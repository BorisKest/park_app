import 'dart:io';

import 'package:flutter/services.dart';
import 'package:park_app/src/common/localization/language.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:park_app/src/common/localization/language.dart';

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
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String language = Language.values[prefs.getInt('lenguage') ?? 0].name.toString();
    return db.query(language, orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getImages() async {
    final db = await DBHelper.db();

    return db.query('plants_images', orderBy: "id");
  }
}
