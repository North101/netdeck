import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_restorable/flutter_riverpod_restorable.dart';

import '/view/debug_page.dart';
import '/view/loading_page.dart';
import 'providers.dart';

void main() => runApp(const ProviderScope(child: App()));

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MaterialApp(
      restorationScopeId: 'root',
      title: 'Netdeck',
      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: theme.appBarTheme.copyWith(
          color: const Color(0xFF093156),
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        dividerTheme: theme.dividerTheme.copyWith(space: 1),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF093156),
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
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      builder: (context, child) => RestorableProviderRegister(
        restorationId: 'app',
        providers: [
          nrdbPublicApiProvider,
          lastSyncProvider,
        ],
        child: child!,
      ),
      home: kDebugMode ? const DebugPage(route: LoadingPage.route) : const LoadingPage(),
    );
  }
}
