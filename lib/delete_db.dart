import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

void main() async{
var databasesPath = await getDatabasesPath();
String path = join(databasesPath, 'ContactsDB.db');

// Delete the database
await deleteDatabase(path);
}