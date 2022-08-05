import 'dart:math';

import 'package:flutter/material.dart';
import 'package:story_ui/screens/chart_step/chart_step_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double testValueToInt = 2.5;

    return Scaffold(
      appBar: AppBar(
        title: Text("Story Ui"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StoryAnimation(),
          ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>const ChartStepScreen()));
            }, child: Text('ChartStep',style: TextStyle(
              color: Colors.white,fontSize: size.height * 0.03,fontWeight: FontWeight.bold
          )),),
          Container(
            width: size.height * 0.1,
            height: size.height * 0.1,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle
            ),
            child: Text('0',style: TextStyle(
                color: Colors.white,fontSize: size.height * 0.03,fontWeight: FontWeight.bold
            )),
          )
        ],
      ),
    );
  }


}

class StoryAnimation extends StatefulWidget {
  const StoryAnimation({
    Key? key,
  }) : super(key: key);

  @override
  State<StoryAnimation> createState() => _StoryAnimationState();
}

class _StoryAnimationState extends State<StoryAnimation> {
  final PageController _pageController = PageController();
  double currentvalue = 0;

  @override
  void initState(){
    super.initState();

  }
  List<String> listImg = [
    "assets/images/image_01.png",
    "assets/images/image_02.jpg",
    "assets/images/image_03.jpg",
    "assets/images/image_04.jpg",
    "assets/images/image_02.jpg",
    "assets/images/image_04.jpg",
    "assets/images/image_01.png",
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.5,
      width: size.width,
      decoration: BoxDecoration(
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          StatefulBuilder(
            builder: (context, setState2) {
              _pageController.addListener(() {
                currentvalue = _pageController.page!;
                setState2((){
                });
              });
              return LListStoryCar(size: size, currentValue: currentvalue, listImg: listImg,);
            }
          ),

          PageView.builder(
            itemCount: listImg.length,
          reverse: false,
          controller: _pageController,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => GestureDetector(
            onTap: (){
              print('taped page index: $index');
            },
              child: Container(
                color: Colors.transparent,
              ))),
        ],
      ),
    );
  }
}

class LListStoryCar extends StatelessWidget {
  const LListStoryCar({
    Key? key,
    required this.size, required this.currentValue, required this.listImg,
  }) : super(key: key);

  final Size size;
  final double currentValue;
  final List<String> listImg;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: List.generate(listImg.length, (index) {
        int listIndex = listImg.length - 1;
        bool display = currentValue>listIndex-index;
        double valueNotEffectRight = size.width * 0.2 - (size.width * 0.07 * (listIndex-index))+(size.width * 0.07 * currentValue);
        double valueEffectRight = size.width * 0.2+(size.width * min(currentValue-(listIndex-index),1));
        double valueNotEffectLeft = size.width * 0.04 +(size.width * 0.06 * (listIndex-index))-(size.width * 0.06 * currentValue) ;
        double valueEffectLeft = size.width * 0.04-size.width * min(currentValue-(listIndex-index),1);
        double valueEffectTopAndBottom = size.height * 0.02 * (listIndex-index)-(size.height * 0.02 * currentValue);
        return Positioned(
          right: display?valueEffectRight:valueNotEffectRight,
          left: display?valueEffectLeft:valueNotEffectLeft,
          bottom: display?0:valueEffectTopAndBottom,
          top: display?0:valueEffectTopAndBottom,
          child:  ClipRRect(
            borderRadius: BorderRadius.circular(20-(3 * min(listIndex-index.toDouble()-currentValue, 5))),
            child: Image.asset(listImg[index],fit: BoxFit.cover,),
          ),
        );
      }
      ),
    );
  }
}

