import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tif_assignment/dimensions.dart';
import 'package:tif_assignment/widgets/bigtext.dart';
import 'package:tif_assignment/widgets/smalltext.dart';

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
  double textHeight = Dimensions.screenHeight / 7.6;
  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 300,
      color: Colors.white,
      //decoration: BoxDecoration(border: Border.all()),
      child: secondHalf.isEmpty
          ? BigText(
              text: firstHalf,
              color: Colors.black,
              overFlow: TextOverflow.visible,
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  child: BigText(
                    text: hiddenText
                        ? (firstHalf + ".")
                        : (firstHalf + secondHalf),
                    color: Colors.black,
                    overFlow: TextOverflow.visible,
                    fontWeight: FontWeight.w400,
                    size: Dimensions.font18,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {});
                  },
                  child: BigText(
                    text: "Read More..",
                    color: Color.fromARGB(255, 45, 123, 225),
                  ),
                ),
              ],
            ),
    );
  }
}
