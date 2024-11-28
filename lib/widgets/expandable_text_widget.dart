import 'package:flutter/material.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;

  const ExpandableTextWidget({super.key, required this.text});

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
 late String firstHalf;
 late String secondHalf;

 bool hiddenText = true;
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
