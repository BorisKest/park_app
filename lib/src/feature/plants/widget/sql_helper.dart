import 'dart:io';

import 'package:flutter/services.dart';
import 'package:park_app/src/common/localization/l10n.dart';
import 'package:park_app/src/common/localization/language.dart';
import 'package:park_app/src/common/widget/locale_provider.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String language = Language.values[prefs.getInt('lenguage') ?? 0].toString();
    String tableName = '';
    switch (language) {
      case 'Language.russian':
        {
          tableName = 'plants_ru';
        }
        break;
      case 'Language.spanish':
        {
          tableName = 'plants_es';
        }
        break;
      case 'Language.portuges':
        {
          tableName = 'plants_pt';
        }
        break;
      case 'Language.german':
        {
          tableName = 'plants_de';
        }
        break;
      case 'Language.magyar':
        {
          tableName = 'plants_hu';
        }
        break;
      case 'Language.english':
        {
          tableName = 'plants';
        }
        break;
    }
    return db.query(tableName, orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getImages() async {
    final db = await DBHelper.db();

    return db.query('plants_images', orderBy: "id");
  }
}
