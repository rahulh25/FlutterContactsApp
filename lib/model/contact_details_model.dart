class ContactDetailsModel {
  final int id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  static final columns = ["id", "firstName", "lastName", "phoneNumber"];
  ContactDetailsModel(this.id, this.firstName, this.lastName, this.phoneNumber);

  Map<String, dynamic> toMap() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
      };
  factory ContactDetailsModel.fromMap(Map<dynamic, dynamic> data) {
    return ContactDetailsModel(
        data['id'], data['firstName'], data['lastName'], data['phoneNumber']);
  }

  @override
  String toString() {
    return 'ContactDetails{id: $id, firstName: $firstName,lastName:$lastName,phoneNumber:$phoneNumber}';
  }
}
