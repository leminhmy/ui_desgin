import 'package:flutter/material.dart';

class TextContainerLozenge extends StatelessWidget {
  const TextContainerLozenge({
    Key? key,
    required this.text,

  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RotationTransition(
      turns: const AlwaysStoppedAnimation(45 / 360),
      child: Container(
        width: size.height * 0.08,
        height: size.height * 0.08,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.5),
        ),
        child: RotationTransition(
          turns: const AlwaysStoppedAnimation(-45 / 360),
          child: Text(text,style: TextStyle(
              color: Colors.white,fontSize: size.height * 0.03,fontWeight: FontWeight.bold
          )),
        ),
      ),
    );
  }
}
