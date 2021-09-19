import 'package:flutter/material.dart';
import 'package:fluttercontactsapp/services/contact_services.dart';

class ConfirmDialogBoxWidget extends StatefulWidget {
  const ConfirmDialogBoxWidget(
      {Key? key,
      required this.id,
      required this.firstname,
      required this.lastname,
      required this.phoneNumber,
      required this.promptText,
      required this.dialogText,
      required this.type})
      : super(key: key);
  final int id;
  final String firstname;
  final String lastname;
  final String phoneNumber;
  final String promptText;
  final String dialogText;
  final String type;
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
          child: const Text("Continue"),
          onPressed: () {
            var contactService = ContactServices();
            if (widget.type == "Edit") {
              contactService.editData(widget.id, widget.firstname,
                  widget.lastname, widget.phoneNumber);
            } else {
              contactService.deleteData(widget.id);
            }
            Navigator.pop(context, true);
          },
        ),
      ],
    );
  }
}
