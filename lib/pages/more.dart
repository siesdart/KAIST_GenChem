import 'package:flutter/material.dart';
import 'package:gencheminkaist/utils/uri.dart';
import 'package:gencheminkaist/widgets/activity_tile.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(4),
          child: ActivityTile(
            leading: const Icon(Icons.mail),
            title: const Text('Contact'),
            onTap: () => launchUrl(
              Uri(
                scheme: 'mailto',
                path: 'ghwhsbsb@kaist.ac.kr',
                query: encodeQueryParameters({'subject': '[KAIST GenChem] '}),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4),
          child: ActivityTile(
            leading: const Icon(Icons.info),
            title: const Text('APP Info'),
            onTap: () => context.push('/app'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4),
          child: ActivityTile(
            leading: const Icon(Icons.info),
            title: const Text('License'),
            onTap: () => context.push('/license'),
          ),
        ),
      ],
    );
  }
}
