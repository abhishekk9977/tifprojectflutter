import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tif_assignment/dimensions.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  FontWeight fontWeight;
  BigText(
      {super.key,
      this.color = Colors.black,
      required this.text,
      this.size = 0,
      this.overFlow = TextOverflow.ellipsis,
      this.fontWeight = FontWeight.w400});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        text,
        overflow: overFlow,
        style: TextStyle(
          color: color,
          fontSize: size == 0 ? Dimensions.font18 : size,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
