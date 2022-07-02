import 'dart:io';

import 'package:flutter/material.dart';
import 'package:park_app/src/common/widget/card.dart';
import 'package:park_app/src/feature/map/wdiget/sql_helper.dart';

class PlantsScreen extends StatefulWidget {
  const PlantsScreen({Key? key, required this.openIndex}) : super(key: key);
  final int openIndex;

  @override
  State<PlantsScreen> createState() => _PlantsScreenState();
}

class _PlantsScreenState extends State<PlantsScreen> {
  final List<bool> _isOpen = [false, false, false, false];

  List<Map<String, dynamic>> _plants = [];
  bool _isLoading = true;

  void _refreshJournals() async {
    final data = await DBHelper.getItems();
    setState(() {
      _plants = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshJournals(); // Loading the plants when the screen starts
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text('Plants'),
        ),
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _plants.length,
                itemBuilder: (context, index) => BuildCard(
                    image: _plants[index]['image'],
                    titleText: _plants[index]['name'],
                    bodyText: _plants[index]['description']),
              )

        // ListView(
        //  children: const [
        //    BuildCard(
        //      image: 'assets/images/plant1.jpg',
        //      titleText: 'Plant Uritaka',
        //      bodyText:
        //          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eu metus vitae lacus ullamcorper congue ac at mauris. Phasellus sed ante bibendum, hendrerit quam sed, maximus ligula. Pellentesque felis nibh, suscipit quis mauris ut, porta fringilla enim. Sed rutrum ac tortor vel posuere. Praesent tortor turpis, imperdiet ultricies nisi ut, varius auctor nisl. Maecenas eget enim feugiat, maximus nibh ut, pellentesque neque. Nam at blandit justo, ac convallis urna. Donec a ultricies magna, quis hendrerit magna. Duis sed elit imperdiet, auctor libero quis, interdum mauris. Praesent nisl ipsum, tempor id metus a, sagittis suscipit ex. Nam in orci id massa volutpat finibus eu a quam.',
        //    ),
        //    BuildCard(
        //      image: 'assets/images/plant1.jpg',
        //      titleText: 'Plant Uritaka',
        //      bodyText:
        //          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eu metus vitae lacus ullamcorper congue ac at mauris. Phasellus sed ante bibendum, hendrerit quam sed, maximus ligula. Pellentesque felis nibh, suscipit quis mauris ut, porta fringilla enim. Sed rutrum ac tortor vel posuere. Praesent tortor turpis, imperdiet ultricies nisi ut, varius auctor nisl. Maecenas eget enim feugiat, maximus nibh ut, pellentesque neque. Nam at blandit justo, ac convallis urna. Donec a ultricies magna, quis hendrerit magna. Duis sed elit imperdiet, auctor libero quis, interdum mauris. Praesent nisl ipsum, tempor id metus a, sagittis suscipit ex. Nam in orci id massa volutpat finibus eu a quam.',
        //    ),
        //    BuildCard(
        //      image: 'assets/images/plant1.jpg',
        //      titleText: 'Plant Uritaka',
        //      bodyText:
        //          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eu metus vitae lacus ullamcorper congue ac at mauris. Phasellus sed ante bibendum, hendrerit quam sed, maximus ligula. Pellentesque felis nibh, suscipit quis mauris ut, porta fringilla enim. Sed rutrum ac tortor vel posuere. Praesent tortor turpis, imperdiet ultricies nisi ut, varius auctor nisl. Maecenas eget enim feugiat, maximus nibh ut, pellentesque neque. Nam at blandit justo, ac convallis urna. Donec a ultricies magna, quis hendrerit magna. Duis sed elit imperdiet, auctor libero quis, interdum mauris. Praesent nisl ipsum, tempor id metus a, sagittis suscipit ex. Nam in orci id massa volutpat finibus eu a quam.',
        //    ),
        //    BuildCard(
        //      image: 'assets/images/plant1.jpg',
        //      titleText: 'Plant Uritaka',
        //      bodyText:
        //          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eu metus vitae lacus ullamcorper congue ac at mauris. Phasellus sed ante bibendum, hendrerit quam sed, maximus ligula. Pellentesque felis nibh, suscipit quis mauris ut, porta fringilla enim. Sed rutrum ac tortor vel posuere. Praesent tortor turpis, imperdiet ultricies nisi ut, varius auctor nisl. Maecenas eget enim feugiat, maximus nibh ut, pellentesque neque. Nam at blandit justo, ac convallis urna. Donec a ultricies magna, quis hendrerit magna. Duis sed elit imperdiet, auctor libero quis, interdum mauris. Praesent nisl ipsum, tempor id metus a, sagittis suscipit ex. Nam in orci id massa volutpat finibus eu a quam.',
        //    ),
        //  ],
        //),
        );
  }
}

//class Data {
//  final int? id;
//  final String name;
//  final String descripton;
//  final String image;
//
//  Data({
//    this.id,
//    required this.name,
//    required this.descripton,
//    required this.image,
//  });
//
//  factory Data.fromMap(Map<String, dynamic> json) => Data(
//        id: json['id'],
//        name: json['name'],
//        descripton: json['descripton'],
//        image: json['image'],
//      );
//
//  Map<String, dynamic> toMap() {
//    return {
//      'id': id,
//      'name': name,
//      'descripton': descripton,
//      'image': image,
//    };
//  }
//}
//
//class DatabaseHelper {
//  DatabaseHelper._privatConstructor();
//  static final DatabaseHelper instance = DatabaseHelper._privatConstructor();
//
//  static Database? _database;
//  Future<Database> get database async => _database ??= await _initDatabase();
//
//  Future<Database> _initDatabase() async {
//    Directory documentsDirectory = await getApplicationDocumentsDirectory();
//    String pathToDb = join(documentsDirectory.path, '/app_data.db');
//    return await openDatabase(
//      'app_data.db',
//      version: 1,
//      onCreate: (db, version) {
//        return db.execute(
//          'CREATE TABLE plants(id INTEGER PRIMARY KEY, name TEXT, description TEXT, image TEXT)',
//        );
//      },
//    );
//  }
//
//  Future<List<Data>> getData() async {
//    Database db = await instance.database;
//    var plantData = await db.query('plants');
//    List<Data> plantDataList = plantData.isNotEmpty ? plantData.map((c) => Data.fromMap(c)).toList() : [];
//    return plantDataList;
//  }
//}
