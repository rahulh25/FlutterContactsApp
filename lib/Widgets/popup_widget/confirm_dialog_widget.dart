import 'package:flutter/material.dart';
import 'package:fluttercontactsapp/services/contact_services.dart';

class ConfirmDialogBoxWidget extends StatefulWidget {
  const ConfirmDialogBoxWidget(
      {Key? key,
      required this.id,
      required this.firstname,
      required this.lastname,
      required this.phoneNumber})
      : super(key: key);
  final int id;
  final String firstname;
  final String lastname;
  final String phoneNumber;
  @override
  State<StatefulWidget> createState() {
    return ConfirmDialogBoxWidgetState();
  }
}

class ConfirmDialogBoxWidgetState extends State<ConfirmDialogBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Edit Details"),
      content: const Text("Are you sure you want to edit the details"),
      actions: [
        TextButton(
          child: const Text("Cancel"),
          onPressed: () {
            var contactService = ContactServices();
            contactService.editData(widget.id, widget.firstname,
                widget.lastname, widget.phoneNumber);
          },
        ),
        TextButton(
          child: const Text("Continue"),
          onPressed: () {},
        ),
      ],
    );
  }
}
