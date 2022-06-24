import 'package:flutter/material.dart';
import 'package:park_app/src/common/widget/expansion_card.dart';

class PlantsScreen extends StatefulWidget {
  const PlantsScreen({Key? key, required this.openIndex}) : super(key: key);
  final int openIndex;

  @override
  State<PlantsScreen> createState() => _PlantsScreenState();
}

class _PlantsScreenState extends State<PlantsScreen> {
  final List<bool> _isOpen = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    _isOpen[widget.openIndex] = true;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Plants'),
      ),
      body: ListView(
        children: const [
          BuildCard(
            image: 'assets/images/plant1.jpg',
            titleText: 'Plant Uritaka',
            bodyText:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eu metus vitae lacus ullamcorper congue ac at mauris. Phasellus sed ante bibendum, hendrerit quam sed, maximus ligula. Pellentesque felis nibh, suscipit quis mauris ut, porta fringilla enim. Sed rutrum ac tortor vel posuere. Praesent tortor turpis, imperdiet ultricies nisi ut, varius auctor nisl. Maecenas eget enim feugiat, maximus nibh ut, pellentesque neque. Nam at blandit justo, ac convallis urna. Donec a ultricies magna, quis hendrerit magna. Duis sed elit imperdiet, auctor libero quis, interdum mauris. Praesent nisl ipsum, tempor id metus a, sagittis suscipit ex. Nam in orci id massa volutpat finibus eu a quam.',
          ),
          BuildCard(
            image: 'assets/images/plant1.jpg',
            titleText: 'Plant Uritaka',
            bodyText:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eu metus vitae lacus ullamcorper congue ac at mauris. Phasellus sed ante bibendum, hendrerit quam sed, maximus ligula. Pellentesque felis nibh, suscipit quis mauris ut, porta fringilla enim. Sed rutrum ac tortor vel posuere. Praesent tortor turpis, imperdiet ultricies nisi ut, varius auctor nisl. Maecenas eget enim feugiat, maximus nibh ut, pellentesque neque. Nam at blandit justo, ac convallis urna. Donec a ultricies magna, quis hendrerit magna. Duis sed elit imperdiet, auctor libero quis, interdum mauris. Praesent nisl ipsum, tempor id metus a, sagittis suscipit ex. Nam in orci id massa volutpat finibus eu a quam.',
          ),
          BuildCard(
            image: 'assets/images/plant1.jpg',
            titleText: 'Plant Uritaka',
            bodyText:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eu metus vitae lacus ullamcorper congue ac at mauris. Phasellus sed ante bibendum, hendrerit quam sed, maximus ligula. Pellentesque felis nibh, suscipit quis mauris ut, porta fringilla enim. Sed rutrum ac tortor vel posuere. Praesent tortor turpis, imperdiet ultricies nisi ut, varius auctor nisl. Maecenas eget enim feugiat, maximus nibh ut, pellentesque neque. Nam at blandit justo, ac convallis urna. Donec a ultricies magna, quis hendrerit magna. Duis sed elit imperdiet, auctor libero quis, interdum mauris. Praesent nisl ipsum, tempor id metus a, sagittis suscipit ex. Nam in orci id massa volutpat finibus eu a quam.',
          ),
          BuildCard(
            image: 'assets/images/plant1.jpg',
            titleText: 'Plant Uritaka',
            bodyText:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eu metus vitae lacus ullamcorper congue ac at mauris. Phasellus sed ante bibendum, hendrerit quam sed, maximus ligula. Pellentesque felis nibh, suscipit quis mauris ut, porta fringilla enim. Sed rutrum ac tortor vel posuere. Praesent tortor turpis, imperdiet ultricies nisi ut, varius auctor nisl. Maecenas eget enim feugiat, maximus nibh ut, pellentesque neque. Nam at blandit justo, ac convallis urna. Donec a ultricies magna, quis hendrerit magna. Duis sed elit imperdiet, auctor libero quis, interdum mauris. Praesent nisl ipsum, tempor id metus a, sagittis suscipit ex. Nam in orci id massa volutpat finibus eu a quam.',
          ),
        ],
      ),
    );
  }
}
