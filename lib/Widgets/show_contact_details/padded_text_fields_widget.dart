import 'package:flutter/material.dart';

class PaddedTextFieldWidgets extends StatefulWidget {
  const PaddedTextFieldWidgets(
      {Key? key, required this.hintText, required this.labeltext,required this.textFieldContent})
      : super(key: key);
  final String hintText;
  final String labeltext;
  final String textFieldContent;
  @override
  State<StatefulWidget> createState() {
    return PaddedTextFieldWidgetsState();
  }
}

class PaddedTextFieldWidgetsState extends State<PaddedTextFieldWidgets> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 350,
        height: 50,
        child: TextField(
          controller:
              TextEditingController(text: widget.textFieldContent),
          decoration: InputDecoration(
              hintText: widget.hintText,
              contentPadding:const EdgeInsets.all(10.0),
              border: const OutlineInputBorder(),
              labelText: widget.labeltext),
        ),
      ),
    );
  }
}
