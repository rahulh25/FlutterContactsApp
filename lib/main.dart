import 'package:flutter/material.dart';

import 'Widgets/contacts_card_widget.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Contacts';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(scaffoldBackgroundColor: Colors.blueGrey[600]),
      home: Scaffold(
        appBar: AppBar(title: const Text(_title),backgroundColor: Colors.lightGreen[900],),
        body: const MyContactsWidget(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.

