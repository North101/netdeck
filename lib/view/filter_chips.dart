import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/providers.dart';
import '/util/card_text.dart';

class MyCollectionChip extends ConsumerWidget {
  const MyCollectionChip({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collection = ref.watch(filterCollectionProvider);
    if (!collection.value) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Chip(
        label: const Text('My Collection'),
        onDeleted: () {
          collection.value = false;
        },
      ),
    );
  }
}

class RotationChip extends ConsumerWidget {
  const RotationChip({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rotation = ref.watch(filterRotationProvider);
    if (rotation.value == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Chip(
        label: Text(rotation.value!.name),
        onDeleted: () {
          rotation.value = null;
        },
      ),
    );
  }
}

class MwlChip extends ConsumerWidget {
  const MwlChip({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mwl = ref.watch(filterMwlProvider);
    if (mwl.value == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Chip(
        label: Text(mwl.value!.name),
        onDeleted: () {
          mwl.value = null;
        },
      ),
    );
  }
}

class PacksChip extends ConsumerWidget {
  const PacksChip({required this.count, super.key});

  final int count;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packs = ref.watch(filterPacksProvider);
    if (!packs.value.isVisible) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Chip(
        label: Text(formatText('Packs', packs.value.length, count)),
        onDeleted: () {
          packs.value = packs.value.copyWith(values: const {});
        },
      ),
    );
  }
}

class FactionsChip extends ConsumerWidget {
  const FactionsChip({required this.count, super.key});

  final int count;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final factions = ref.watch(filterFactionsProvider);
    if (!factions.value.isVisible) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Chip(
        label: Text(formatText('Factions', factions.value.length, count)),
        onDeleted: () {
          factions.value = factions.value.copyWith(values: const {});
        },
      ),
    );
  }
}

class TypesChip extends ConsumerWidget {
  const TypesChip({required this.count, super.key});

  final int count;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final types = ref.watch(filterTypesProvider);
    if (!types.value.isVisible) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Chip(
        label: Text(formatText('Types', types.value.length, count)),
        onDeleted: () {
          types.value = types.value.copyWith(values: const {});
        },
      ),
    );
  }
}
