import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:kotlin_flavor/scope_functions.dart';
import 'package:timeago/timeago.dart' as timeago;

import '/providers.dart';
import '/util/nrdb/private.dart';
import '/view/header_list_tile.dart';
import 'collection_page.dart';
import 'default_filter_page.dart';

class SettingsBody extends ConsumerWidget {
  const SettingsBody({super.key});

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
  const SettingsGeneral({super.key});

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
  const SettingsCollection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collection = ref.watch(collectionProvider(false));
    return ListTile(
      title: const Text('My Collection'),
      subtitle: collection.whenOrNull<Widget?>(
        error: (error, stackTrace) => Text(error.toString()),
        data: (data) => Text('${data.where((item) => item.inCollection).length} / ${data.length}'),
      ),
      onTap: () => Navigator.of(context).restorablePush(CollectionSettingsPage.route),
    );
  }
}

class SettingsDefaultCardFilters extends ConsumerWidget {
  const SettingsDefaultCardFilters({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingProvider);
    return ListTile(
      title: const Text('Default Card Filter'),
      subtitle: settings.whenOrNull<Widget?>(
        error: (error, strackTrace) => Text(error.toString()),
        data: (data) => [
          if (data.settings.filterCollection) 'My Collection',
          if (data.filterFormat != null) 'Format: ${data.filterFormat!.name}',
          if (data.filterRotation != null) 'Rotation: ${data.filterRotation!.name}',
          if (data.filterMwl != null) 'Most Wanted List: ${data.filterMwl!.name}',
        ].join('\n').let((e) => e.isNotEmpty ? Text(e) : null),
      ),
      onTap: () => Navigator.of(context).restorablePush(DefaultCardFilterPage.route),
    );
  }
}

class SettingsNrdbAuth extends ConsumerWidget {
  const SettingsNrdbAuth({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(nrdbAuthStateProvider);
    final lastSync = ref.watch(lastSyncProvider).value;
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
  const SettingsNrdbUpdateDatabase({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nrdbApi = ref.watch(nrdbPublicApiProvider).value;
    return ListTile(
      title: const Text('Card Data'),
      subtitle: nrdbApi == null ? const Text('Loading...') : Text('Last Checked: ${timeago.format(nrdbApi)}'),
      trailing: Container(
        width: 96,
        alignment: Alignment.center,
        child: nrdbApi == null
            ? const SizedBox(
                width: 32,
                height: 32,
                child: CircularProgressIndicator(),
              )
            : SizedBox(
                width: 96,
                child: ElevatedButton(
                  onPressed: () {
                    final nrdbApi = ref.read(nrdbPublicApiProvider);
                    nrdbApi.update(force: true);
                  },
                  child: const Text('Update'),
                ),
              ),
      ),
    );
  }
}

class SettingsNrdb extends ConsumerWidget {
  const SettingsNrdb({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverStickyHeader(
      header: HeaderListTile.title(title: 'NetrunnerDB'),
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
  const AboutTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: Text('About'),
    );
  }
}

class SettingsApp extends ConsumerWidget {
  const SettingsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverStickyHeader(
      header: HeaderListTile.title(title: 'App'),
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
