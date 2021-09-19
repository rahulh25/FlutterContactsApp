import 'package:flutter/material.dart';
import 'package:fluttercontactsapp/model/contact_details_model.dart';
import '../../db_test.dart';
import '../../main.dart';

class ConfirmDialogBoxWidget extends StatefulWidget {
  const ConfirmDialogBoxWidget(
      {Key? key,
      required this.id,
      required this.firstname,
      required this.lastname,
      required this.phoneNumber,
      required this.promptText,
      required this.dialogText,
      required this.type,
      required this.email})
      : super(key: key);
  final int id;
  final String firstname;
  final String lastname;
  final int phoneNumber;
  final String promptText;
  final String dialogText;
  final String type;
  final String email;
  @override
  State<StatefulWidget> createState() {
    return ConfirmDialogBoxWidgetState();
  }
}

class ConfirmDialogBoxWidgetState extends State<ConfirmDialogBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.promptText),
      content: Text(widget.dialogText),
      actions: [
        TextButton(
          child: const Text("Cancel"),
          onPressed: () => Navigator.pop(context, true),
        ),
        TextButton(
          child: Text(widget.type),
          onPressed: () async {
            if (widget.type == "Edit") {
              SQLiteDbProvider.db.update(ContactDetailsModel(
                  widget.id,
                  widget.firstname,
                  widget.lastname,
                  widget.phoneNumber,
                  widget.email));
            } else if (widget.type == "Delete") {
              SQLiteDbProvider.db.delete(widget.id);
            } else {
              SQLiteDbProvider.db.insert(ContactDetailsModel(
                  widget.id,
                  widget.firstname,
                  widget.lastname,
                  widget.phoneNumber,
                  widget.email));
            }
            Navigator.pop(context, true);
            await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ContactsApp()))
                .then((value) => setState(() {}));
          },
        ),
      ],
    );
  }
}
