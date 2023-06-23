import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class Sqldb {
//------------------------------
  static Database? _db; // variable statique de classe
  Future<Database?> get db async {
    if(_db == null) {
      _db = await initialisation();
      return _db;
    } else {
      return _db;
    }
  }
//-------------------------------
  initialisation() async {
    String db_path = await getDatabasesPath();
    String path = join(db_path,'Librairie');
    Database mydb = await openDatabase(path,onCreate: _createDB,version: 1);
    return mydb;
  }
//-------------------------------
  _createDB(Database db, int version) async {
    await db.execute('''
CREATE TABLE "books" (
"id" INTEGER PRIMARY KEY AUTOINCREMENT,
"titre" TEXT NOT NULL
)
''');
    print("--------DataBase Created------------");
  }
//------------------readData----------------------
  readData(String sql) async {
    Database? mydb = await db;
    List<Map> reponse = await mydb!.rawQuery(sql);
    return reponse;
  }
//-------------insert------------------------------
  insertData(String sql) async {
    Database? mydb = await db;
    int reponse = await mydb!.rawInsert(sql);
    return reponse;
  }
//---------------update-------------------------
  updateData(String sql) async {
    Database? mydb = await db;
    int reponse = await mydb!.rawUpdate(sql);
    return reponse;
  }
//---------------------delete----------------------
  deleteData(String sql) async {
    Database? mydb = await db;
    int reponse = await mydb!.rawDelete(sql);
    return reponse;
  }
//-------------------------
}