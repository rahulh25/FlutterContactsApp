import 'dart:async';
import 'dart:io';
import 'package:fluttercontactsapp/model/contact_details_model.dart';
import 'package:path/path.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:path_provider/path_provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:sqflite/sqflite.dart';

class SQLiteDbProvider {
  SQLiteDbProvider._();
  static final SQLiteDbProvider db = SQLiteDbProvider._();
  static Database? _database;
  Future<Database> get database async => _database ??= await initDB();
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "ContactsDB.db");
    print('db location : ' + path);
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Contacts ("
          "id INTEGER PRIMARY KEY,"
          "firstName TEXT,"
          "lastName TEXT,"
          "phoneNumber INTEGER,"
          "email TEXT"
          ")");
      var jsonData = [
        {
          "id": 1,
          "first_name": "James",
          "last_name": "Butt",
          "phone": "5046218927",
          "email": "jbutt@gmail.com"
        },
        {
          "id": 2,
          "first_name": "Josephine",
          "last_name": "Darakjy",
          "phone": "8102929388",
          "email": "josephine_darakjy@darakjy.org"
        },
        {
          "id": 3,
          "first_name": "Art",
          "last_name": "Venere",
          "phone": "8566368749",
          "email": "art@venere.org"
        },
        {
          "id": 4,
          "first_name": "Lenna",
          "last_name": "Paprocki",
          "phone": "9073854412",
          "email": "lpaprocki@hotmail.com"
        },
        {
          "id": 5,
          "first_name": "Donette",
          "last_name": "Foller",
          "phone": "5135701893",
          "email": "donette.foller@cox.net"
        },
        {
          "id": 6,
          "first_name": "Simona",
          "last_name": "Morasca",
          "phone": "4195032484",
          "email": "simona@morasca.com"
        },
        {
          "id": 7,
          "first_name": "Mitsue",
          "last_name": "Tollner",
          "phone": "7735736914",
          "email": "mitsue_tollner@yahoo.com"
        }
      ];
      for (var i = 0; i < jsonData.length; i++) {
        await db.execute(
            "INSERT INTO Contacts ('id', 'firstName', 'lastName', 'phoneNumber','email') values (?, ?, ?, ?,?)",
            [
              int.parse(jsonData[i]["id"].toString()),
              jsonData[i]["first_name"].toString(),
              jsonData[i]["last_name"].toString(),
              int.parse(jsonData[i]["phone"].toString()),
              jsonData[i]["email"].toString()
            ]);
      }
    });
  }

  Future<List<ContactDetailsModel>> getAllProducts() async {
    final db = await database;
    List<ContactDetailsModel> products = <ContactDetailsModel>[];
    try {
      List<Map> results = await db.query("Contacts",
          columns: ContactDetailsModel.columns, orderBy: "id ASC");
      for (var result in results) {
        ContactDetailsModel product = ContactDetailsModel.fromMap(result);
        products.add(product);
      }
    } catch (ex) {
      print(ex);
    }
    return products;
  }

  Future<List<ContactDetailsModel>> searchdata(String value) async {
    final db = await database;
    List<ContactDetailsModel> products = <ContactDetailsModel>[];
    try {
      String strwhere =
          "firstName like '%" + value + "'% or lastName like '%" + value + "'%";
      List<Map> results = await db.query("Contacts",
          columns: ContactDetailsModel.columns,
          orderBy: "id ASC",
          where: strwhere);
      for (var result in results) {
        ContactDetailsModel product = ContactDetailsModel.fromMap(result);
        products.add(product);
      }
    } catch (ex) {
      print(ex);
    }
    return products;
  }

  insert(ContactDetailsModel contact) async {
    final db = await database;
    try {
      var maxIdResult = await db
          .rawQuery("SELECT MAX(id)+1 as last_inserted_id FROM Contacts");
      var id = maxIdResult.first["last_inserted_id"];
      var result = await db.rawInsert(
          "INSERT Into Contacts (id, firstName, lastName, phoneNumber,email)"
          " VALUES (?, ?, ?, ?,?)",
          [
            id,
            contact.firstName,
            contact.lastName,
            contact.phoneNumber,
            contact.email
          ]);
      return result;
    } catch (ex) {
      print(ex);
    }
  }

  update(ContactDetailsModel contact) async {
    final db = await database;
    try {
      var result = await db.update("Contacts", contact.toMap(),
          where: "id = ?", whereArgs: [contact.id]);
      return result;
    } catch (ex) {
      print(ex);
    }
  }

  delete(int id) async {
    final db = await database;
    try {
      db.delete("Contacts", where: "id = ?", whereArgs: [id]);
    } catch (ex) {
      print(ex);
    }
  }
}
