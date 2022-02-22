import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kotlin_flavor/scope_functions.dart';

import '/db/database.dart';
import '/providers.dart';
import '/view/format_dropdown.dart';
import '/view/mwl_dropdown.dart';
import '/view/rotation_dropdown.dart';

class DefaultCardFilterPage extends ConsumerWidget {
  const DefaultCardFilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Default Card Filters')),
      body: ListView(
        children: const [
          CardFilterCollection(),
          CardFilterFormat(),
          CardFilterRotation(),
          CardFilterMwl(),
        ],
      ),
    );
  }
}

class CardFilterCollection extends ConsumerWidget {
  const CardFilterCollection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingProvider);
    return settings.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stracktrace) => Text(error.toString()),
      data: (data) {
        final collection = ref.watch(collectionProvider(false));
        return CheckboxListTile(
          value: data.settings.filterCollection,
          title: const Text('My Collection'),
          subtitle: collection.maybeWhen(
            data: (data) {
              return Text('${data.where((item) => item.inCollection).length} / ${data.length}');
            },
            orElse: () => null,
          ),
          onChanged: (value) {
            final db = ref.read(dbProvider);
            db.update(db.settings).write(SettingsCompanion(
                  filterCollection: Value(value!),
                ));
          },
        );
      },
    );
  }
}

class CardFilterFormat extends ConsumerWidget {
  const CardFilterFormat({Key? key}) : super(key: key);

  void setFormat(WidgetRef ref, SettingResult settings, FormatResult? value) {
    final rotation = settings.filterRotation;
    final mwl = settings.filterMwl;

    final db = ref.read(dbProvider);
    db.update(db.settings).write(SettingsCompanion(
          filterFormatCode: Value(value?.format.code),
          filterRotationCode: Value((value?.let((e) => e.currentRotation) ?? rotation)?.code),
          filterMwlCode: Value((value?.let((e) => e.activeMwl) ?? mwl)?.code),
        ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: settings.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stacktrace) => Text(error.toString()),
        data: (settings) => FormatDropdown.withOverrides(
          format: settings.filterFormat,
          onChanged: (value) => setFormat(ref, settings, value),
        ),
      ),
    );
  }
}

class CardFilterRotation extends ConsumerWidget {
  const CardFilterRotation({Key? key}) : super(key: key);

  void setRotation(WidgetRef ref, RotationData? value) {
    final db = ref.read(dbProvider);
    db.update(db.settings).write(SettingsCompanion(
          filterRotationCode: Value(value?.code),
        ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: settings.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stacktrace) => Text(error.toString()),
        data: (settings) => RotationDropdown.withOverrides(
          format: settings.filterFormat,
          rotation: settings.filterRotation,
          onChanged: (value) => setRotation(ref, value),
        ),
      ),
    );
  }
}

class CardFilterMwl extends ConsumerWidget {
  const CardFilterMwl({Key? key}) : super(key: key);

  void setMwl(WidgetRef ref, MwlData? value) {
    final db = ref.read(dbProvider);
    db.update(db.settings).write(SettingsCompanion(
          filterMwlCode: Value(value?.code),
        ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: settings.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stacktrace) => Text(error.toString()),
        data: (settings) => MwlDropdown.withOverrides(
          format: settings.filterFormat,
          mwl: settings.filterMwl,
          onChanged: (MwlData? value) => setMwl(ref, value),
        ),
      ),
    );
  }
}
