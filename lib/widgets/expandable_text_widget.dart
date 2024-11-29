import 'package:flutter/material.dart';
import 'package:shop_app_with_backend/utils/dimantions.dart';

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
 double textHeight = Dimantions.screenHeight/5.63;

void initSate(){
  super.initState();
  if(widget.text.length>textHeight){
    firstHalf= widget.text.substring(0, textHeight.toInt());
    secondHalf= widget.text.substring(textHeight.toInt()+1, widget.text.length);
  }
}

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
