import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchTheme {
  const SearchTheme(this.context);

  final BuildContext context;

  ThemeData get theme {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: colorScheme.brightness == Brightness.dark ? Colors.grey[900] : Colors.white,
        iconTheme: theme.primaryIconTheme.copyWith(color: Colors.grey),
        titleTextStyle: theme.textTheme.headline6?.copyWith(color: Colors.black),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: theme.inputDecorationTheme.hintStyle,
        border: InputBorder.none,
      ),
    );
  }

  static of(BuildContext context) => SearchTheme(context).theme;
}