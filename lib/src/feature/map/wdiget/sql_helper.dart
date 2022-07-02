import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DBHelper {
  static Future<sql.Database> db() async {
    var dbDir = await sql.getDatabasesPath();
    var dbPath = join(dbDir, "app_data.db");
    ByteData data = await rootBundle.load("assets/app_data.db");
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(dbPath).writeAsBytes(bytes);
    return sql.openDatabase(
      dbPath,
      version: 1,
    );
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await DBHelper.db();
    return db.query('plants', orderBy: "id");
  }
}
