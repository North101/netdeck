import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/view/debug_page.dart';
import '/view/loading_page.dart';
import 'providers.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  static Route<void> openHomeRoute(BuildContext context, Object? argument) {
    return MaterialPageRoute(builder: (context) {
      return const LoadingPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MaterialApp(
      restorationScopeId: 'root',
      title: 'Netdeck',
      theme: ThemeData(
        appBarTheme: theme.appBarTheme.copyWith(
          color: const Color(0xFF093156),
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        dividerTheme: theme.dividerTheme.copyWith(space: 1),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFF093156),
          ),
        ),
        colorScheme: theme.colorScheme.copyWith(
          secondary: const Color(0xFF093156),
        ),
        primaryColor: const Color(0xFF343740),
        buttonTheme: theme.buttonTheme.copyWith(
          buttonColor: const Color(0xFF093156),
        ),
      ),
      builder: (context, child) => ProviderScope(
        restorationId: 'app',
        restorables: [
          nrdbPublicApiProvider.withRestorationId('nrdbPublicApiProvider'),
          lastSyncProvider.withRestorationId('lastSyncProvider'),
        ],
        child: child!,
      ),
      home: kDebugMode ? const DebugPage(route: openHomeRoute) : const LoadingPage(),
    );
  }
}
