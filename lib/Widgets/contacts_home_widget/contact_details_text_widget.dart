import 'package:flutter/material.dart';

class ContactDetailsTextWidget extends StatefulWidget {
  const ContactDetailsTextWidget(
      {Key? key,
      required this.fieldValue,
      required this.phonenumber,
      required this.type})
      : super(key: key);
  final String fieldValue;
  final String type;
  final int phonenumber;
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
              text: widget.type == "name"
                  ? widget.fieldValue
                  : widget.phonenumber.toString(),
              style: TextStyle(
                  fontWeight: widget.type == "name"
                      ? FontWeight.bold
                      : FontWeight.normal,
                  fontSize: widget.type == "name" ? 22 : 18,
                  color: widget.type == "name"
                      ? Colors.pinkAccent
                      : Colors.cyan[900])),
        ],
      ),
    );
  }
}
