import 'package:flutter/material.dart';

class TextShapeCircle extends StatelessWidget {
  const TextShapeCircle({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.height * 0.1,
      height: size.height * 0.1,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.5),
          shape: BoxShape.circle
      ),
      child: Text(text,style: TextStyle(
          color: Colors.white,fontSize: size.height * 0.03,fontWeight: FontWeight.bold
      )),
    );
  }
}
