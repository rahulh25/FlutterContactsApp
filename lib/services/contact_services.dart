import 'package:fluttercontactsapp/model/contact_details_model.dart';

class ContactServices {
  var contactsList = <ContactDetailsModel>[];
  final contactsJsonData = [
    {
      "id": 1,
      "first_name": "James",
      "last_name": "Butt",
      "phone": "504-845-1427",
      "email": "jbutt@gmail.com"
    },
    {
      "id": 2,
      "first_name": "Josephine",
      "last_name": "Darakjy",
      "phone": "810-374-9840",
      "email": "josephine_darakjy@darakjy.org"
    },
    {
      "id": 3,
      "first_name": "Art",
      "last_name": "Venere",
      "phone": "856-264-4130",
      "email": "art@venere.org"
    },
    {
      "id": 4,
      "first_name": "Lenna",
      "last_name": "Paprocki",
      "phone": "907-921-2010",
      "email": "lpaprocki@hotmail.com"
    },
    {
      "id": 5,
      "first_name": "Donette",
      "last_name": "Foller",
      "phone": "513-549-4561",
      "email": "donette.foller@cox.net"
    },
    {
      "id": 6,
      "first_name": "Simona",
      "last_name": "Morasca",
      "phone": "419-800-6759"
    },
    {
      "id": 7,
      "first_name": "Mitsue",
      "last_name": "Tollner",
      "phone": "773-924-8565"
    },
    {
      "id": 8,
      "first_name": "Leota",
      "last_name": "Dilliard",
      "phone": "408-813-1105"
    },
    {
      "id": 9,
      "first_name": "Sage",
      "last_name": "Wieser",
      "phone": "605-794-4895"
    },
  ];

  List<ContactDetailsModel> getContactDetails() {
    for (var i = 0; i < contactsJsonData.length; i++) {
      contactsList.add(ContactDetailsModel(
          int.parse(contactsJsonData[i]["id"].toString()),
          contactsJsonData[i]["first_name"].toString(),
          contactsJsonData[i]["last_name"].toString(),
          contactsJsonData[i]["phone"].toString()));
    }
    return contactsList;
  }

  void deleteData(int id) {
    contactsList.removeWhere((item) => item.id == id);
  }

  void editData(int id, String firstname, String lastName, String phonenumber) {
    print(firstname);
    contactsList.removeWhere((element) => element.id == id);
    contactsList.add(ContactDetailsModel(id, firstname, lastName, phonenumber));
  }
}
