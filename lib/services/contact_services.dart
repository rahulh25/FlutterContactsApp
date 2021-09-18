import 'package:fluttercontactsapp/model/contact_details_model.dart';

class ContactServices {
  var contactsJsonData = [
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
      "phone": "419-800-6759",
      "email": "simona@morasca.com"
    },
    {
      "id": 7,
      "first_name": "Mitsue",
      "last_name": "Tollner",
      "phone": "773-924-8565",
      "email": "mitsue_tollner@yahoo.com"
    },
    {
      "id": 8,
      "first_name": "Leota",
      "last_name": "Dilliard",
      "phone": "408-813-1105",
      "email": "leota@hotmail.com"
    },
    {
      "id": 9,
      "first_name": "Sage",
      "last_name": "Wieser",
      "phone": "605-794-4895",
      "email": "sage_wieser@cox.net"
    },
  ];
  List<ContactDetailsModel> getContactDetails(){
    var contactsList = <ContactDetailsModel>[];
    for (var i = 0; i < contactsJsonData.length; i++) {
      contactsList.add(ContactDetailsModel(
          int.parse(contactsJsonData[i]["id"].toString()),
          contactsJsonData[i]["first_name"].toString(),
          contactsJsonData[i]["last_name"].toString(),
          contactsJsonData[i]["phone"].toString(),
          contactsJsonData[i]["email"].toString()));
    }
    return contactsList;
  }
}
