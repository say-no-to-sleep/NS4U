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
  static bool _useDynamicColor = true;
  static bool _isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body of the scaffold
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.brush_outlined),
              title: const Text('Themes'),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return DraggableScrollableSheet(
                      expand: false,
                      builder: (context, scrollController) {
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return Wrap(
                              children: [
                                ListTile(
                                  leading:
                                      const Icon(Icons.settings_brightness),
                                  title: const Text('Use system theme'),
                                  trailing: Switch(
                                    value: _useDynamicColor,
                                    onChanged: (value) {
                                      setState(() {
                                        _useDynamicColor = value;
                                      });
                                    },
                                  ),
                                ),
                                if (!_useDynamicColor)
                                  ListTile(
                                    leading: Icon(_isDarkMode
                                        ? Icons.dark_mode
                                        : Icons.light_mode),
                                    title: Text(_isDarkMode
                                        ? 'Dark Mode'
                                        : 'Light Mode'),
                                    trailing: Switch(
                                      value: _isDarkMode,
                                      onChanged: (value) {
                                        setState(() {
                                          _isDarkMode = value;
                                        });
                                      },
                                    ),
                                  ),
                              ],
                            );
                          },
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
