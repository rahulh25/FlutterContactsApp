import 'package:flutter/material.dart';

import 'Widgets/contacts_home_widget/contacts_card_widget.dart';

void main() => runApp(const ContactsApp());

/// This is the main application widget.
class ContactsApp extends StatelessWidget {
  const ContactsApp({Key? key}) : super(key: key);

  static const String _title = 'Contacts';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title),backgroundColor: Colors.lightGreen[900],),
        body: const ContactsHomeWidget(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.

