// @dart=2.9
import 'package:flutter/material.dart';
import 'Widgets/contacts_home_widget/bottom_button_widget.dart';
import 'Widgets/contacts_home_widget/contacts_card_widget.dart';
void main() => runApp(const ContactsApp());

/// This is the main application widget.
class ContactsApp extends StatelessWidget {
  static const String _title = 'Contacts';

  const ContactsApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: _title,
        home: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text(_title),
            backgroundColor: Colors.lightGreen[900],
          ),
          body: const ContactsHomeWidget(),
          bottomNavigationBar: const AddButtonWidget(),
        ));
  }
}
