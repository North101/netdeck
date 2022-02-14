import 'package:flutter/material.dart';

extension StreamBuilderEx<T> on Stream<T> {
  Widget when({
    required Widget Function(T data) data,
    required Widget Function(Object error, StackTrace? stackTrace) error,
    required Widget Function() loading,
  }) =>
      StreamBuilder<T>(
        stream: this,
        builder: (context, value) {
          if (value.hasError) {
            return error(value.error!, value.stackTrace);
          } else if (value.hasData) {
            return data(value.requireData);
          } else {
            return loading();
          }
        },
      );
}


extension FutureBuilderEx<T> on Future<T> {
  Widget when({
    required Widget Function(T data) data,
    required Widget Function(Object error, StackTrace? stackTrace) error,
    required Widget Function() loading,
  }) =>
      FutureBuilder<T>(
        future: this,
        builder: (context, value) {
          if (value.hasError) {
            return error(value.error!, value.stackTrace);
          } else if (value.hasData) {
            return data(value.requireData);
          } else {
            return loading();
          }
        },
      );
}
