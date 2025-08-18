import 'package:flutter/material.dart';
import 'package:shop_app_with_backend/widgets/small_text.dart';

import '../utils/dimentions.dart';

class ExpandableText extends StatefulWidget {
  final String text;

  const ExpandableText({super.key, required this.text});

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  double textHeight = Dimentions.screenHeight/6.8;
  @override
  void initState(){
    super.initState();
    if(widget.text.length>textHeight){
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1, widget.text.length);
    }else{
      firstHalf= widget.text;
      secondHalf="";
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        child: secondHalf.isEmpty?Smalltext( text: firstHalf,size: Dimentions.font16,): Column(
          children: [
            Smalltext(height:1.8,text: hiddenText? ("$firstHalf..."):(firstHalf+ secondHalf),),
            InkWell(
              onTap: (){
                setState(() {
                  hiddenText=!hiddenText;
                });
              },
              child: Row(
                children: [
                  Smalltext(text: "Show more",size:Dimentions.font16,color: Colors.teal,),
                  Icon(hiddenText?Icons.arrow_drop_down_outlined:Icons.arrow_drop_up,color: Colors.teal,),
                ],
              ),
            )

          ],
        )
    );
  }
}
