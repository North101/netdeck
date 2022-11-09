import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncValueBuilder<T> extends StatelessWidget {
  const AsyncValueBuilder({
    required this.value,
    required this.data,
    this.loading,
    this.error,
    super.key,
  });

  final AsyncValue<T> value;
  final Widget Function(T) data;
  final Widget Function()? loading;
  final Widget Function(Object error, StackTrace? stackTrace)? error;

  @override
  Widget build(BuildContext context) {
    return value.when(
      loading: loading ?? () => const Center(child: CircularProgressIndicator()),
      error: error ??
          (error, stackTrace) {
            if (kDebugMode) {
              print(stackTrace);
              print(error);
            }
            return Center(
              child: Text(
                stackTrace.toString(),
                style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.error),
              ),
            );
          },
      data: data,
    );
  }
}
