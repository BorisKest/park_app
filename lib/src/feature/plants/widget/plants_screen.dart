import 'package:flutter/material.dart';
import 'package:park_app/src/feature/plants/widget/card.dart';
import 'package:park_app/src/feature/plants/widget/promitions.dart';
import 'package:park_app/src/feature/plants/widget/sql_helper.dart';

class PlantsScreen extends StatefulWidget {
  const PlantsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PlantsScreen> createState() => _PlantsScreenState();
}

class _PlantsScreenState extends State<PlantsScreen> {
  List<Map<String, dynamic>> _plants = [];
  List<Map<String, dynamic>> _plantsImages = [];
  bool _isLoading = true;

  void _refreshJournals() async {
    final data = await DBHelper.getItems();
    final images = await DBHelper.getImages();
    setState(() {
      _plants = data;
      _plantsImages = images;
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
        actions: <Widget>[
          IconButton(
            onPressed: () {
              chekPromitions(context);
            },
            icon: const Icon(Icons.qr_code),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
                maxCrossAxisExtent: 392,
              ),
              itemCount: _plants.length,
              itemBuilder: (context, index) => BuildCard(
                image: _plantsImages[index]['image'],
                titleText: _plants[index]['name'],
                bodyText: _plants[index]['description'],
              ),
            ),
    );
  }
}
