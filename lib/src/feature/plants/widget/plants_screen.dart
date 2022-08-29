import 'package:flutter/material.dart';
import 'package:park_app/src/common/localization/language.dart';
import 'package:park_app/src/common/model/common_models.dart';
import 'package:park_app/src/feature/plants/models.dart';
import 'package:park_app/src/feature/plants/widget/card.dart';
import 'package:park_app/src/feature/plants/services/promitions.dart';
import 'package:park_app/src/feature/plants/services/sql_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PlantsScreen extends StatefulWidget {
  const PlantsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PlantsScreen> createState() => PlantsScreenState();
}

class PlantsScreenState extends State<PlantsScreen> {
  List<Map<String, dynamic>> plantsImages = [];
  bool isLoading = true;

  Future<Language> _getLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return Language.values[prefs.getInt('lenguage') ?? 0];
  }

  void refreshJournals() async {
    final data = await DBHelper.getItems();
    final images = await DBHelper.getImages();
    setState(() {
      plants = data;
      plantsImages = images;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    refreshJournals(); // Loading the plants when the screen starts
    plantsisShown = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(AppLocalizations.of(context)!.plants),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              chekPromitions(context);
            },
            icon: const Icon(Icons.qr_code),
          ),
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
                maxCrossAxisExtent: 392,
              ),
              itemCount: plants.length,
              itemBuilder: (context, index) => BuildCard(
                image: plantsImages[index]['image'],
                titleText: plants[index]['name'],
                bodyText: plants[index]['description'],
              ),
            ),
    );
  }
}
