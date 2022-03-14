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
  const DefaultCardFilterPage({super.key});

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
  const CardFilterCollection({super.key});

  void setCollection(WidgetRef ref, bool? value) {
    final db = ref.read(dbProvider);
    db.update(db.settings).write(SettingsCompanion(
          filterCollection: Value(value!),
        ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterCollection = ref.watch(settingProvider.select((value) {
      return value.whenData((value) {
        return value.settings.filterCollection;
      }).whenOrNull(data: (data) => data);
    }));
    final collection = ref.watch(collectionProvider(false));
    return CheckboxListTile(
      value: filterCollection ?? false,
      title: const Text('My Collection'),
      subtitle: collection.maybeWhen(
        data: (data) {
          return Text('${data.where((item) => item.inCollection).length} / ${data.length}');
        },
        orElse: () => null,
      ),
      onChanged: filterCollection != null ? (value) => setCollection(ref, value) : null,
    );
  }
}

class CardFilterFormat extends ConsumerWidget {
  const CardFilterFormat({super.key});

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
    final settings = ref.watch(settingProvider.select((value) {
      return value.whenOrNull(data: (data) => data);
    }));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: FormatDropdown.withOverrides(
        format: settings?.filterFormat,
        onChanged: settings != null ? (value) => setFormat(ref, settings, value) : null,
      ),
    );
  }
}

class CardFilterRotation extends ConsumerWidget {
  const CardFilterRotation({super.key});

  void setRotation(WidgetRef ref, RotationData? value) {
    final db = ref.read(dbProvider);
    db.update(db.settings).write(SettingsCompanion(
          filterRotationCode: Value(value?.code),
        ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingProvider.select((value) {
      return value.whenOrNull(data: (data) => data);
    }));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: RotationDropdown.withOverrides(
        format: settings?.filterFormat,
        rotation: settings?.filterRotation,
        onChanged: settings != null ? (value) => setRotation(ref, value) : null,
      ),
    );
  }
}

class CardFilterMwl extends ConsumerWidget {
  const CardFilterMwl({super.key});

  void setMwl(WidgetRef ref, MwlData? value) {
    final db = ref.read(dbProvider);
    db.update(db.settings).write(SettingsCompanion(
          filterMwlCode: Value(value?.code),
        ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingProvider.select((value) {
      return value.whenOrNull(data: (data) => data);
    }));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: MwlDropdown.withOverrides(
        format: settings?.filterFormat,
        mwl: settings?.filterMwl,
        onChanged: settings != null ? (value) => setMwl(ref, value) : null,
      ),
    );
  }
}
