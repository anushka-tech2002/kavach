import 'package:flutter_contacts/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Database? _database;

class DatabaseHelper {
  Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    var databasepath = await getDatabasesPath();
    String path = join(databasepath, 'demo.db');

    _database = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE IF NOT EXISTS Contacts(id INTEGER PRIMARY KEY,name TEXT,number TEXT)');
    });
    return _database!;
  }

  Future<int?> insertData({required List<Contact> contactlist}) async {
    int? rows = 0;
    final db = await DatabaseHelper().database;
    for (var phone in contactlist) {
      rows = await db.insert('Contacts', {
        'name': phone.displayName,
        'number': phone.phones.first.number.toString(),
      });
    }

    return rows;
  }

  Future<List<Map>> getData() async {
    final db = await DatabaseHelper().database;
    List<Map> getdatalist = await db.rawQuery('SELECT * FROM Contacts');
    print("printing datalist:${getdatalist}");
    return getdatalist;
  }

  Future<int> getdatabaseCount() async {
    final db = await DatabaseHelper().database;
    var result = await db.rawQuery('SELECT COUNT(*) FROM Contacts');
    int count = Sqflite.firstIntValue(result) ?? 0;
    return count;
  }

  Future<int> deleteContact({required int id}) async {
    final db = await DatabaseHelper().database;
    var result = await db.rawDelete('DELETE FROM Contacts WHERE id=?', [id]);
    return result;
  }
}
