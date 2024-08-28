import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gencheminkaist/providers/package_info.dart';
import 'package:riverpod_context/riverpod_context.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('KAIST GenChem')),
      body: Center(
        child: switch (context.watch(packageInfoProvider)) {
          AsyncData(value: final packageInfo) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(56),
                  child: Image.asset('assets/icons/ic_launcher.png'),
                ),
                const SizedBox(height: 8),
                Text(
                  packageInfo.appName,
                  style: theme.textTheme.titleLarge,
                ),
                Text(
                  packageInfo.version,
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          _ => const CircularProgressIndicator(),
        },
      ),
    );
  }
}
