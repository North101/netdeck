import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/providers.dart';
import '/util/assets.gen.dart';
import '/util/nrdb/public.dart';
import 'main_page.dart';

class LoadingPage extends ConsumerStatefulWidget {
  const LoadingPage({super.key});

  @override
  LoadingPageState createState() => LoadingPageState();
}

class LoadingPageState extends ConsumerState<LoadingPage> {
  static Route<void> openMainPageRoute(BuildContext context, Object? arguments) {
    return MaterialPageRoute(builder: (context) {
      return MainPage.withOverrides();
    });
  }

  @override
  void initState() {
    super.initState();

    final nrdbPublicApi = ref.read(nrdbPublicApiProvider);
    nrdbPublicApi.update();
  }

  void checkValue(DateTime? value) {
    if (value == null) return;

    Future.delayed(const Duration(), () {
      Navigator.of(context).restorablePushReplacement(openMainPageRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<NrdbPublicApiNotifier>(nrdbPublicApiProvider, (previous, next) {
      checkValue(next.value);
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Netdeck')),
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
