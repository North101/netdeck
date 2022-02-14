import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'view/debug_page.dart';
import 'view/loading_page.dart';

void main() {
  runApp(const ProviderScope(
    child: MaterialApp(
      title: 'Netdeck',
      home: kReleaseMode ? LoadingPage() : DebugPage(home: LoadingPage()),
    ),
  ));
}
