import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/providers.dart';
import '/util/card_text.dart';

class MyCollectionChip extends ConsumerWidget {
  const MyCollectionChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collection = ref.watch(filterCollectionProvider.state);
    if (!collection.state) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Chip(
        label: const Text('My Collection'),
        onDeleted: () {
          collection.state = false;
        },
      ),
    );
  }
}

class RotationChip extends ConsumerWidget {
  const RotationChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rotation = ref.watch(filterRotationProvider.state);
    if (rotation.state == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Chip(
        label: Text(rotation.state!.name),
        onDeleted: () {
          rotation.state = null;
        },
      ),
    );
  }
}

class MwlChip extends ConsumerWidget {
  const MwlChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mwl = ref.watch(filterMwlProvider.state);
    if (mwl.state == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Chip(
        label: Text(mwl.state!.name),
        onDeleted: () {
          mwl.state = null;
        },
      ),
    );
  }
}

class PacksChip extends ConsumerWidget {
  const PacksChip({required this.count, Key? key}) : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packs = ref.watch(filterPacksProvider.state);
    if (!packs.state.isVisible) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Chip(
        label: Text(formatText('Packs', packs.state.length, count)),
        onDeleted: () {
          packs.state = packs.state.copyWith(values: const {});
        },
      ),
    );
  }
}

class FactionsChip extends ConsumerWidget {
  const FactionsChip({required this.count, Key? key}) : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final factions = ref.watch(filterFactionsProvider.state);
    if (!factions.state.isVisible) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Chip(
        label: Text(formatText('Factions', factions.state.length, count)),
        onDeleted: () {
          factions.state = factions.state.copyWith(values: const {});
        },
      ),
    );
  }
}

class TypesChip extends ConsumerWidget {
  const TypesChip({required this.count, Key? key}) : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final types = ref.watch(filterTypesProvider.state);
    if (!types.state.isVisible) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Chip(
        label: Text(formatText('Types', types.state.length, count)),
        onDeleted: () {
          types.state = types.state.copyWith(values: const {});
        },
      ),
    );
  }
}