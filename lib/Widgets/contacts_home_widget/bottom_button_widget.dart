import 'package:flutter/material.dart';

import 'add_contacts_widget.dart';

class AddButtonWidget extends StatefulWidget {
  const AddButtonWidget({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return AddButtonWidgetState();
  }
}

class AddButtonWidgetState extends State {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 280, top: 10, bottom: 10),
        child: Ink(
          decoration: const ShapeDecoration(
            color: Colors.lightBlue,
            shape: CircleBorder(),
          ),
          child: IconButton(
            icon: const Icon(Icons.add),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddContactsDialog(),
                ),
              );
            },
          ),
        ));
  }
}
