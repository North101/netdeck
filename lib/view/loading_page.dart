import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/providers.dart';
import '/util/assets.gen.dart';
import '/util/nrdb/private.dart';
import 'main_page.dart';

class LoadingPage extends ConsumerWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      final authState = ref.read(nrdbAuthStateProvider);
      AuthState.refreshToken(authState.ref);
    });

    final lastChecked = ref.watch(nrdbPublicApiProvider.notifier).value;
    if (lastChecked != null) return const MainPage();

    final data = ref.watch(nrdbPublicApiProvider);
    return data.when(
      loading: () => const LoadingWidget(),
      error: (error, stacktrace) => Center(child: Text(error.toString())),
      data: (_) => const MainPage(),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        constraints: const BoxConstraints(minHeight: 160),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Powered By'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.images.netrunnerdb.image(height: 48, width: 48),
                const Text('NetrunnerDB', style: TextStyle(fontSize: 32)),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
