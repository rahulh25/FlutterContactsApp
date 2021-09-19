class ContactDetailsModel {
  final int id;
  final String firstName;
  final String lastName;
  final int phoneNumber;
  final String email;
  static final columns = [
    "id",
    "firstName",
    "lastName",
    "phoneNumber",
    "email"
  ];
  ContactDetailsModel(
      this.id, this.firstName, this.lastName, this.phoneNumber, this.email);

  Map<String, dynamic> toMap() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "email": email
      };
  factory ContactDetailsModel.fromMap(Map<dynamic, dynamic> data) {
    return ContactDetailsModel(data['id'], data['firstName'], data['lastName'],
        data['phoneNumber'], data['email']);
  }

  @override
  String toString() {
    return 'ContactDetails{id: $id, firstName: $firstName,lastName:$lastName,phoneNumber:$phoneNumber,email:$email}';
  }
}
