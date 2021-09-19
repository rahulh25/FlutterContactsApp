import 'package:flutter/material.dart';
import 'package:fluttercontactsapp/Widgets/popup_widget/confirm_dialog_widget.dart';
import 'package:fluttercontactsapp/Widgets/show_contact_details/padded_text_fields_widget.dart';
import 'package:fluttercontactsapp/model/contact_details_model.dart';

class ShowContactDetailsDialog extends StatefulWidget {
  const ShowContactDetailsDialog({Key? key, required this.contactDetails})
      : super(key: key);
  final ContactDetailsModel contactDetails;
  @override
  State<StatefulWidget> createState() {
    return ShowContactDetailsDialogState();
  }
}

class ShowContactDetailsDialogState extends State<ShowContactDetailsDialog> {
  TextEditingController firstNameFieldController = TextEditingController();
  TextEditingController lastNameFieldController = TextEditingController();
  TextEditingController phoneNumberFieldController = TextEditingController();
  TextEditingController emailFieldController = TextEditingController();
  @override
  void initState() {
    firstNameFieldController =
        TextEditingController(text: widget.contactDetails.firstName);
    lastNameFieldController =
        TextEditingController(text: widget.contactDetails.lastName);
    phoneNumberFieldController = TextEditingController(
        text: widget.contactDetails.phoneNumber.toString());
    emailFieldController =
        TextEditingController(text: widget.contactDetails.email);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Contact Details'),
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
                                id: widget.contactDetails.id,
                                firstname: firstNameFieldController.text,
                                lastname: lastNameFieldController.text,
                                phoneNumber:
                                    int.parse(phoneNumberFieldController.text),
                                email: emailFieldController.text,
                                dialogText: "Are you sure you want to edit?",
                                promptText: "Edit Contact",
                                type: "Edit"),
                          ),
                        );
                      },
                      child: const Text('Edit'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shadowColor: Colors.red[200],
                        minimumSize: const Size(100, 50),
                        textStyle: const TextStyle(fontSize: 20),
                        primary: Colors.white,
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.only(
                            left: 40, right: 40, top: 15, bottom: 15),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConfirmDialogBoxWidget(
                                id: widget.contactDetails.id,
                                firstname: firstNameFieldController.text,
                                lastname: lastNameFieldController.text,
                                phoneNumber:
                                    int.parse(phoneNumberFieldController.text),
                                email: emailFieldController.text,
                                dialogText:
                                    "Are you sure you want to delete this contact?",
                                promptText: "Delete Contact",
                                type: "Delete"),
                          ),
                        );
                      },
                      child: const Text('Delete'),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
