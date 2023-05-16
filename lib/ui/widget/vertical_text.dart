
import 'package:flutter/material.dart';

class VerticalText extends StatefulWidget{
  const VerticalText({
    Key? key,
    required this.textContent, required this.from, required this.stringLength, required this.singleLineWidth
}):super(key: key);
  final String textContent;
  final String from;
  final int stringLength;
  final double singleLineWidth;

  @override
  State<StatefulWidget> createState() {
    return VerticalTextState();
  }
}

class VerticalTextState extends State<VerticalText>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int numberOfLines = widget.textContent.length~/widget.stringLength;
    if (widget.textContent.length % widget.stringLength > 0) {
      numberOfLines++;
    }
    List<Widget> allTextLine = [];

    for (int i = 0; i < numberOfLines; i++) {
      String singleLineText = '';

      singleLineText = widget.textContent.substring(
          widget.stringLength * i,
          i < numberOfLines - 1
              ? widget.stringLength * (i + 1)
              : widget.textContent.length);

      allTextLine.add(
        Container(
          margin: const EdgeInsets.only(left: 5),
          width: widget.singleLineWidth+1,
          child: Text(
            singleLineText,
            style: TextStyle(fontSize: widget.singleLineWidth + 5),
            textAlign: TextAlign.left,
          ),
        ),
      );

    }
    for (int i = 0; i < allTextLine.length / 2; i++) {
      Widget temp = allTextLine[i];
      allTextLine[i] = allTextLine[allTextLine.length - 1 - i];
      allTextLine[allTextLine.length - 1 - i] = temp;
    }
    String from = widget.from;

    return AnimatedScale(
      duration: const Duration(milliseconds: 1500),
      scale: widget.textContent!=''?1.0:0.0,
      child: AnimatedOpacity(
        opacity: widget.textContent!=''?1.0:0.0,
        duration: const Duration(milliseconds: 2000),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 40, bottom: 30),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: allTextLine),
            ),
            Text(
              '- $from -',
              style: TextStyle(fontSize: widget.stringLength + 1),
            )
          ],
        ),
      ),
    );

    return Container();
  }


}