import 'package:about/about.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:kotlin_flavor/scope_functions.dart';
import 'package:timeago/timeago.dart' as timeago;

import '/db/database.dart';
import '/providers.dart';
import '/util/nrdb/private.dart';
import '/view/async_value_builder.dart';
import '/view/header_list_tile.dart';
import 'collection_page.dart';
import 'default_filter_page.dart';

class SettingsBody extends ConsumerWidget {
  const SettingsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      controller: ScrollController(),
      slivers: const [
        SettingsGeneral(),
        SettingsNrdb(),
        SettingsApp(),
      ],
    );
  }
}

class SettingsGeneral extends ConsumerWidget {
  const SettingsGeneral({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverStickyHeader(
      header: HeaderListTile.title(title: 'General'),
      sliver: const SliverList(
        delegate: SliverChildListDelegate.fixed([
          SettingsCollection(),
          SettingsDefaultCardFilters(),
        ]),
      ),
    );
  }
}

class SettingsCollection extends ConsumerWidget {
  const SettingsCollection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collection = ref.watch(collectionProvider(false));
    return AsyncValueBuilder<List<CollectionResult>>(
      value: collection,
      data: (data) => ListTile(
        title: const Text('My Collection'),
        subtitle: Text('${data.where((item) => item.inCollection).length} / ${data.length}'),
        onTap: () async {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const CollectionSettingsPage();
          }));
        },
      ),
    );
  }
}

class SettingsDefaultCardFilters extends ConsumerWidget {
  const SettingsDefaultCardFilters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingProvider);
    return AsyncValueBuilder<SettingResult>(
      value: settings,
      data: (data) => ListTile(
        title: const Text('Default Card Filter'),
        subtitle: [
          if (data.settings.filterCollection) 'My Collection',
          if (data.filterFormat != null) 'Format: ${data.filterFormat!.name}',
          if (data.filterRotation != null) 'Rotation: ${data.filterRotation!.name}',
          if (data.filterMwl != null) 'Most Wanted List: ${data.filterMwl!.name}',
        ].join('\n').let((e) => e.isNotEmpty ? Text(e) : null),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const DefaultCardFilterPage();
          }));
        },
      ),
    );
  }
}

class SettingsNrdbAuth extends ConsumerWidget {
  const SettingsNrdbAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(nrdbAuthStateProvider);
    final lastSync = ref.watch(lastSyncProvider);
    return ListTile(
      title: const Text('Account'),
      subtitle: authState.map<Widget>(
        init: (state) => const Text('Initializing...'),
        connecting: (state) => const Text('Connecting...'),
        online: (state) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Online: ${state.user.username}'),
            Text('Last Synced: ${lastSync != null ? timeago.format(lastSync) : 'Never'}'),
          ],
        ),
        offline: (state) => const Text('Offline'),
        unauthenticated: (state) => const Text('Unauthenticated'),
      ),
      trailing: Container(
        width: 96,
        alignment: Alignment.center,
        child: authState.map(
          init: (state) => const SizedBox(
            width: 32,
            height: 32,
            child: CircularProgressIndicator(),
          ),
          connecting: (state) => const SizedBox(
            width: 32,
            height: 32,
            child: CircularProgressIndicator(),
          ),
          online: (state) => SizedBox(
            width: 96,
            child: ElevatedButton(
              onPressed: state.logout,
              child: const Text('Logout'),
            ),
          ),
          offline: (state) => SizedBox(
            width: 96,
            child: ElevatedButton(
              onPressed: state.logout,
              child: const Text('Logout'),
            ),
          ),
          unauthenticated: (state) => SizedBox(
            width: 96,
            child: ElevatedButton(
              onPressed: state.login,
              child: const Text('Login'),
            ),
          ),
        ),
      ),
    );
  }
}

class SettingsNrdbUpdateDatabase extends ConsumerWidget {
  const SettingsNrdbUpdateDatabase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nrdbApi = ref.watch(nrdbPublicApiProvider);
    return ListTile(
      title: const Text('Card Data'),
      subtitle: AsyncValueBuilder<DateTime>(
        value: nrdbApi,
        loading: () => const Text('Loading...'),
        data: (data) => Text('Last Checked: ${timeago.format(data)}'),
      ),
      trailing: Container(
        width: 96,
        alignment: Alignment.center,
        child: nrdbApi.maybeWhen(
          loading: () => const SizedBox(
            width: 32,
            height: 32,
            child: CircularProgressIndicator(),
          ),
          orElse: () => SizedBox(
            width: 96,
            child: ElevatedButton(
              onPressed: () {
                final nrdbApi = ref.read(nrdbPublicApiProvider.notifier);
                nrdbApi.update(force: true);
              },
              child: const Text('Update'),
            ),
          ),
        ),
      ),
    );
  }
}

class SettingsNrdb extends ConsumerWidget {
  const SettingsNrdb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverStickyHeader(
      header: Material(
        elevation: 1,
        color: Theme.of(context).canvasColor,
        child: const ListTile(
          title: Text('NetrunnerDB'),
        ),
      ),
      sliver: const SliverList(
        delegate: SliverChildListDelegate.fixed([
          SettingsNrdbAuth(),
          SettingsNrdbUpdateDatabase(),
        ]),
      ),
    );
  }
}

class AboutTile extends StatelessWidget {
  const AboutTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('About'),
      onTap: () => showAboutPage(
        context: context,
        values: {
          'version': '1.0',
          'year': DateTime.now().year.toString(),
        },
        children: const <Widget>[
          LicensesPageListTile(
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
    );
  }
}

class SettingsApp extends ConsumerWidget {
  const SettingsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverStickyHeader(
      header: Material(
        elevation: 1,
        color: Theme.of(context).canvasColor,
        child: const ListTile(
          title: Text('App'),
        ),
      ),
      sliver: const SliverList(
        delegate: SliverChildListDelegate.fixed([
          //_buildBackup(context),
          //_buildRestore(context),
          AboutTile(),
        ]),
      ),
    );
  }
}
