import 'package:flutter/material.dart';
import 'package:fluttercontactsapp/Widgets/popup_widget/confirm_dialog_widget.dart';
import 'package:fluttercontactsapp/Widgets/show_contact_details/padded_text_fields_widget.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class AddContactsDialog extends StatefulWidget {
  const AddContactsDialog({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return AddContactsDialogState();
  }
}

class AddContactsDialogState extends State {
  TextEditingController firstNameFieldController = TextEditingController();
  TextEditingController lastNameFieldController = TextEditingController();
  TextEditingController phoneNumberFieldController = TextEditingController();
  TextEditingController emailFieldController = TextEditingController();
  @override
  void initState() {
    firstNameFieldController = TextEditingController(text: "");
    lastNameFieldController = TextEditingController(text: "");
    phoneNumberFieldController = TextEditingController(text: "");
    emailFieldController = TextEditingController(text: "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Contact'),
          backgroundColor: Colors.lightGreen[900],
        ),
        body: Card(
          child: Column(
            children: [
              PaddedTextFieldWidgets(
                  hintText: 'First Name',
                  labeltext: 'Enter First Name',
                  textEditingController: firstNameFieldController),
              PaddedTextFieldWidgets(
                  hintText: 'Last Name',
                  labeltext: 'Enter Last Name',
                  textEditingController: lastNameFieldController),
              PaddedTextFieldWidgets(
                  hintText: 'Phone Number',
                  labeltext: 'Enter Phone Number',
                  textEditingController: phoneNumberFieldController),
              PaddedTextFieldWidgets(
                  hintText: 'Email',
                  labeltext: 'Enter Email',
                  textEditingController: emailFieldController),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shadowColor: Colors.teal[200],
                        elevation: 20,
                        minimumSize: const Size(100, 50),
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: Colors.teal,
                        primary: Colors.white,
                        padding: const EdgeInsets.only(
                            left: 40, right: 40, top: 15, bottom: 15),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConfirmDialogBoxWidget(
                                id: -1,
                                firstname: firstNameFieldController.text,
                                lastname: lastNameFieldController.text,
                                phoneNumber:int.parse(phoneNumberFieldController.text),
                                email:emailFieldController.text,
                                dialogText: "Are you sure you want to add?",
                                promptText: "Add Contact",
                                type: "Add"),
                          ),
                        );
                      },
                      child: const Text('Add'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
