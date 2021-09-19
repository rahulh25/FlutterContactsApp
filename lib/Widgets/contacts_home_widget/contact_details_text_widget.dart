import 'package:flutter/material.dart';

class ContactDetailsTextWidget extends StatefulWidget {
  const ContactDetailsTextWidget({Key? key, required this.fieldValue})
      : super(key: key);
  final String fieldValue;
  @override
  State<StatefulWidget> createState() {
    return ContactDetailsTextWidgetState();
  }
}

class ContactDetailsTextWidgetState extends State<ContactDetailsTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        // default text style
        children: <TextSpan>[
          TextSpan(
              text: widget.fieldValue,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white)),
        ],
      ),
    );
  }
}
