import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gencheminkaist/firebase_options.dart';
import 'package:gencheminkaist/providers/remote_config.dart';
import 'package:gencheminkaist/router.dart';
import 'package:gencheminkaist/theme.dart';
import 'package:riverpod_context/riverpod_context.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final remoteConfig = await initializeRemoteConfig();

  runApp(
    ProviderScope(
      overrides: [
        remoteConfigProvider.overrideWithValue(remoteConfig),
      ],
      child: const InheritedConsumer(child: GenChemApp()),
    ),
  );
}

Future<FirebaseRemoteConfig> initializeRemoteConfig() async {
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval:
          kDebugMode ? const Duration(minutes: 1) : const Duration(hours: 1),
    ),
  );
  await remoteConfig.setDefaults({
    'genchem_url': 'http://gencheminkaist.pe.kr/',
    'notice_url': 'http://gencheminkaist.pe.kr/down.htm',
    'courses': '[]',
  });
  await remoteConfig.fetchAndActivate();
  return remoteConfig;
}

class GenChemApp extends StatelessWidget {
  const GenChemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'KAIST GenChem',
      routerConfig: router,
      theme: GenChemTheme.light(),
    );
  }
}
