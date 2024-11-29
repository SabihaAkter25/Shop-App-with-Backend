import 'package:flutter/material.dart';
import 'package:shop_app_with_backend/utils/dimantions.dart';
import 'package:shop_app_with_backend/widgets/small_text.dart';

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
  }else{
    firstHalf=widget.text;
    secondHalf ="";
  }
}

  @override
  @override
  Widget build(BuildContext context) {
    final String text = widget.text;
    final bool isLongText = text.length > textHeight.toInt();

    final String firstHalf = isLongText
        ? text.substring(0, textHeight.toInt())
        : text;
    final String secondHalf = isLongText
        ? text.substring(textHeight.toInt(), text.length)
        : "";

    return Container(
      child: secondHalf.isEmpty
          ? SmallText(text: firstHalf)
          : Column(
        children: [
          SmallText(
              text: hiddenText ? (firstHalf + '...') : (firstHalf + secondHalf)),
          InkWell(
              onTap: () {
                setState(() {
                  hiddenText = !hiddenText;
                });
              },
              child: Row(
                children: [
                  SmallText(
                    text: hiddenText ? 'Show More' : 'Show Less',
                    color: Colors.tealAccent.shade700,
                  ),
                  Icon(
                    hiddenText
                        ? Icons.arrow_drop_down
                        : Icons.arrow_drop_up,
                    color: Colors.tealAccent.shade700,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
