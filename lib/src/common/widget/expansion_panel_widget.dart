import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class ExpansionPanelBuilder extends StatefulWidget {
  @override
  State<ExpansionPanelBuilder> createState() => _ExpansionPanelBuilderState(
      image: '', titleText: '', bodyText: '', isOpen: false);
}

class _ExpansionPanelBuilderState extends State<ExpansionPanelBuilder> {
  _ExpansionPanelBuilderState(
      {required this.image,
      required this.titleText,
      required this.bodyText,
      required this.isOpen});
  final String image;
  final String titleText;
  final String bodyText;
  final bool isOpen;

  @override
  Widget build(BuildContext context) {
    return Card(
        //            child: ExpansionPanel(
        //       headerBuilder: (context, isOupen){
        //         return Text(titleText);
        //       }
        //       body: Text(bodyText),
        //       isExpanded: isOpen,
        //     ),
        );
  }
}
