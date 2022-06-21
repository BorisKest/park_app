import 'package:flutter/material.dart';
import 'package:park_app/src/common/widget/large_text.dart';

class PlantsScreen extends StatefulWidget {
  const PlantsScreen({Key? key, required this.openIndex}) : super(key: key);
  final int openIndex;

  @override
  State<PlantsScreen> createState() => _PlantsScreenState(i: openIndex);
}

class _PlantsScreenState extends State<PlantsScreen> {
  _PlantsScreenState({required this.i});
  final int i;
  List<bool> _isOpen = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    _isOpen[i] = true;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Plants'),
        ),
        body: SingleChildScrollView(
          child: ExpansionPanelList(
              children: [
                ExpansionPanel(
                  headerBuilder: ((context, isExpanded) {
                    return const Text('Plant1');
                  }),
                  body: const Text('Description for Plant1.'),
                  isExpanded: _isOpen[0],
                ),
                ExpansionPanel(
                  headerBuilder: ((context, isExpanded) {
                    return const Text('Plant2');
                  }),
                  body: const Text('Description for Plant1.'),
                  isExpanded: _isOpen[1],
                ),
                ExpansionPanel(
                  headerBuilder: ((context, isExpanded) {
                    return const Text('Plant3');
                  }),
                  body: const Text('Description for Plant1.'),
                  isExpanded: _isOpen[2],
                ),
                ExpansionPanel(
                  headerBuilder: ((context, isExpanded) {
                    return const Text('Plant4');
                  }),
                  body: const Text('Description for Plant1.'),
                  isExpanded: _isOpen[3],
                ),
              ],
              expansionCallback: (i, isExpanded) {
                setState(
                  () {
                    _isOpen[i] = !isExpanded;
                  },
                );
              }),
        ));
  }
}
