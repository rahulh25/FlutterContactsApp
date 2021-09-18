import 'package:flutter/material.dart';
import 'package:fluttercontactsapp/Widgets/show_contact_details/padded_text_fields_widget.dart';
import 'package:fluttercontactsapp/model/contact_details_model.dart';

class ShowContactDetailsDialog extends StatefulWidget {
  const ShowContactDetailsDialog(
      {Key? key, required this.contactDetails, required this.contactsList})
      : super(key: key);
  final ContactDetailsModel contactDetails;
  final List<ContactDetailsModel> contactsList;
  @override
  State<StatefulWidget> createState() {
    return ShowContactDetailsDialogState();
  }
}

class ShowContactDetailsDialogState extends State<ShowContactDetailsDialog> {
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
                  textFieldContent: widget.contactDetails.firstName),
              PaddedTextFieldWidgets(
                  hintText: 'Last Name',
                  labeltext: 'Enter Last Name',
                  textFieldContent: widget.contactDetails.lastName),
              PaddedTextFieldWidgets(
                  hintText: 'Phone Number',
                  labeltext: 'Enter Phone Number',
                  textFieldContent: widget.contactDetails.phoneNumber)
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: SizedBox(
              //     width: 350,
              //     height: 50,
              //     child: TextField(
              //       controller: TextEditingController(
              //           text: widget.contactDetails.firstName),
              //       decoration: const InputDecoration(
              //           hintText: 'First Name',
              //           contentPadding: EdgeInsets.all(10.0),
              //           border: OutlineInputBorder(),
              //           labelText: 'Enter First Name'),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: SizedBox(
              //     width: 350,
              //     height: 50,
              //     child: TextField(
              //       controller: TextEditingController(
              //           text: widget.contactDetails.lastName),
              //       decoration: const InputDecoration(
              //           hintText: 'Last Name',
              //           contentPadding: EdgeInsets.all(10.0),
              //           border: OutlineInputBorder(),
              //           labelText: 'Enter Last Name'),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: SizedBox(
              //     width: 350,
              //     height: 50,
              //     child: TextField(
              //       controller: TextEditingController(
              //           text: widget.contactDetails.phoneNumber),
              //       decoration: const InputDecoration(
              //           hintText: 'Phone Number',
              //           contentPadding: EdgeInsets.all(10.0),
              //           border: OutlineInputBorder(),
              //           labelText: 'Enter Phone Number'),
              //     ),
              //   ),
              // )
            ],
          ),
        ));
  }
}
