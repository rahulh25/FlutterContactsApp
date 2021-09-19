import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fluttercontactsapp/model/contact_details_model.dart';

class ContactServices {
  var contactsList = <ContactDetailsModel>[];
  void deleteData(int id) {
    contactsList.removeWhere((item) => item.id == id);
  }

  void editData(int id, String firstname, String lastName, String phonenumber) {
    print(firstname);
    contactsList.removeWhere((element) => element.id == id);
    contactsList.add(ContactDetailsModel(id, firstname, lastName, phonenumber));
  }

  Future<List<ContactDetailsModel>> getContactDetails() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final contactsJsonData = await json.decode(response);

    for (var i = 0; i < contactsJsonData.length; i++) {
      contactsList.add(ContactDetailsModel(
          int.parse(contactsJsonData[i]["id"].toString()),
          contactsJsonData[i]["first_name"].toString(),
          contactsJsonData[i]["last_name"].toString(),
          contactsJsonData[i]["phone"].toString()));
    }
    return contactsList;
  }
}
