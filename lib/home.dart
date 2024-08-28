import 'package:flutter/material.dart';
import 'package:gencheminkaist/providers/remote_config.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_context/riverpod_context.dart';
import 'package:url_launcher/url_launcher.dart';

const locations = ['/courses', '/notice', '/more'];

class GenChemHome extends StatelessWidget {
  const GenChemHome({required this.body, super.key});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KAIST GenChem'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.open_in_browser),
            onPressed: () =>
                launchUrl(Uri.parse(context.read(genchemUrlProvider))),
          ),
        ],
      ),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:
            locations.indexWhere(GoRouterState.of(context).uri.path.startsWith),
        type: BottomNavigationBarType.fixed,
        onTap: (index) => context.go(locations[index]),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Course List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notice',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
