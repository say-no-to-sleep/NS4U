// set up the settings page

import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: const SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body of the scaffold
      body: SingleChildScrollView(
        child: Column(
          // a column of options for the user to select and show a bottom sheet
          children: [
            ListTile(
              leading: const Icon(Icons.brush_outlined),
              title: const Text('Themes'),
              onTap: () {
                // do something
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return DraggableScrollableSheet(
                      expand: false,
                      builder: (context, scrollController) {
                        return const Wrap(
                          children: [],
                        );
                      },
                    );
                  },
                );
              },
            ),
            // other list tiles
          ],
        ),
      ),
    );
  }
}
