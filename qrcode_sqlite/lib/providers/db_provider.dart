



import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:qrcode_sqlite/Models/scan_model.dart';
export 'package:qrcode_sqlite/Models/scan_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {

  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  
  Future<Database> get database async =>
      _database ??= await initDB();

  Future<Database> initDB() async{
    //path de donde almacenaremos la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join( documentsDirectory.path, 'ScansDB.db');
    // print(path);

    //Crear Base de datos

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db){},
      onCreate: (Database db, int version) async{
        await db.execute('''
          CREATE TABLE Scans(
          id INTEGER PRIMARY KEY,
          tipo TEXT,
          valor TEXT
        )
        ''');
      },
      );

  }

  nuevoScanRaw( ScanModel nuevoscan) async {

    final id= nuevoscan.id;
    final tipo= nuevoscan.tipo;
    final valor= nuevoscan.valor;

    //verificar la base de datos
    final db = await database;
    final res = await db.rawInsert('''
    INSERT INTO Scans (id, tipo,valor) VALUES ( $id, $tipo, $valor)''');

    return res;
  }
  Future<int>nuevoScan(ScanModel nuevoScan ) async{
    final db = await database;
    final res = await db.insert('Scans', nuevoScan.toJson());
    //res es el id del ultimo registro insertado
    return res;
  }
  Future<ScanModel?>getScanById(int id) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id= ?',whereArgs: [id]);

    if (res.isNotEmpty) {
      return ScanModel.fromJson(res.first);
    } else {
      return null;
    }

  }
  Future<List?>getScansAll() async {
    final db = await database;
    final res = await db.query('Scans');

    if (res.isNotEmpty) {
      return res.map((s) => ScanModel.fromJson(s)).toList();
    } else {
      return [];
    }

  }
   Future<List?>getScansByTipo(String  tipo) async {
    final db = await database;
    final res = await db.rawQuery('''
    SELECT * FROM Scans WHERE tipo = '$tipo'
    ''');

    if (res.isNotEmpty) {
      return res.map((s) => ScanModel.fromJson(s)).toList();
    } else {
      return [];
    }

  }

  Future<int> updateScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.update('Scans', nuevoScan.toJson(), where: 'id = ?', whereArgs: [nuevoScan.id]);
    return res;
  }

  Future<int> deleteScan(int id) async {
    final db = await database;
    final res = await db.delete('Scans', where: 'id=?',whereArgs: [id]);
    return res;
  }

  //Los siguientes  2 metodos borran todos los registros solo que de diferente manera
  Future<int> deleteAllScans() async {
    final db = await database;
    final res = await db.delete('Scans');
    return res;
  }

  Future<int> deleteScansTodos() async {
    final db = await database;
    final res = await db.rawDelete('''
    DELETE FROM Scans
    ''');
    return res;
  }
}