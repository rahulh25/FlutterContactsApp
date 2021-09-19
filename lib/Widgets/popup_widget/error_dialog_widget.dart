import 'package:flutter/material.dart';

class ErrorDialog extends StatefulWidget {
  const ErrorDialog(
      {Key? key, required this.dialogText})
      : super(key: key);
  final String dialogText;
  @override
  State<StatefulWidget> createState() {
    return ErrorDialogState();
  }
}

class ErrorDialogState extends State<ErrorDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Error"),
      content: Text(
        widget.dialogText,
        style: const TextStyle(color: Colors.red),
      ),
      actions: [
        TextButton(
          child: const Text("Close"),
          onPressed: () => Navigator.pop(context, true),
        ),
      ],
    );
  }
}
