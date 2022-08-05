import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:story_ui/screens/home/home_screen.dart';

import '../../widget/text_container_lozenge.dart';
import '../../widget/text_shape_circle.dart';

class ChartStepScreen extends StatefulWidget {
  const ChartStepScreen({Key? key}) : super(key: key);

  @override
  State<ChartStepScreen> createState() => _ChartStepScreenState();
}

class _ChartStepScreenState extends State<ChartStepScreen> {
  int lengthList = 9;
  late List<String> listNumber;


  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int getNumber(){
      int maxLenght = listNumber.length;
      double x1 = (maxLenght)/5;
      double x2 = (maxLenght-3)/5;

      int valueFinal = x1.ceil()+x2.ceil();

      return valueFinal;
    }
    listNumber = List.generate(lengthList, (index) => index.toString());
    /*listNumber = [
      "1",
      "2",
      "3",
      "?",
      "5",
      "6",
      "?",
      "7",
      "?",
      "9",
      "10",
      "?",
      "12",
    ];*/
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('ChartStep'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      lengthList--;

                      setState((){
                      });
                    }, child: Text('-',style: TextStyle(
                      color: Colors.white,fontSize: size.height * 0.03,fontWeight: FontWeight.bold
                  )),),
                  Text('$lengthList',style: TextStyle(
                      color: Colors.black,fontSize: size.height * 0.03,fontWeight: FontWeight.bold
                  )),
                  ElevatedButton(
                    onPressed: (){
                      lengthList++;

                      setState((){
                      });
                    }, child: Text('+',style: TextStyle(
                      color: Colors.white,fontSize: size.height * 0.03,fontWeight: FontWeight.bold
                  )),),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.05,),
            //Line Paint
            SizedBox(
              height: size.height,
              width: size.width,
              child: CustomPaint(
                size: Size(size.width,size.height),
                painter: /*SliderPaintCustom(),*/DashedPathPainter(
                    originalPath: pathCustom(size,getNumber(),lengthList),
                    dashGapLength: 15,
                    strokeWidth: 5,
                    dashLength: 15,
                    pathColor: Colors.red),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -size.height * 0.05,
                      right: 0,
                      left: 0,
                      child: Column(
                        children: List.generate(getNumber(), (indexColumn) => Padding(
                          padding: EdgeInsets.only(left: size.height * 0.02,right: size.height * 0.02,bottom: size.height * 0.04),
                          child: indexColumn%2==0?Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: List.generate(3, (indexRow) {
                              int numberStepTwo = indexColumn~/2;
                              int numberStepThree = (3*indexColumn+indexRow);
                              bool checkLength = numberStepThree-numberStepTwo<listNumber.length;
                              bool checkQuestion = checkLength?listNumber[numberStepThree-numberStepTwo].toString()=="?":false;
                              return checkLength?
                                  (checkQuestion?TextContainerLozenge(text: listNumber[numberStepThree-numberStepTwo].toString()):TextShapeCircle(text: listNumber[numberStepThree-numberStepTwo].toString(),))
                                  :Container();
                            },
                          ),
                        ):Stack(
                            alignment: Alignment.center,
                            children: List.generate(2, (indexRow) {
                              int numberStepTwo = indexColumn~/2;
                              int numberStepThree = (3*indexColumn+indexRow);
                              bool checkLength = numberStepThree-numberStepTwo<listNumber.length;
                              bool checkQuestion = checkLength?listNumber[numberStepThree-numberStepTwo].toString()=="?":false;
                              return checkLength?Align(
                                alignment: Alignment(indexRow==0?0.5:-0.5,0),
                                child: (checkQuestion?TextContainerLozenge(text: listNumber[numberStepThree-numberStepTwo].toString()):TextShapeCircle(text: listNumber[numberStepThree-numberStepTwo].toString(),))):Container();
                            },
                            ),
                          ),))
                      ),
                    )
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>const HomeScreen()));
              }, child: Text('Story UI',style: TextStyle(
                color: Colors.white,fontSize: size.height * 0.03,fontWeight: FontWeight.bold
            )),)
          ],
        ),
      ),
    );
  }

  Path pathCustom(Size size,int lengthRow,int lengthList){
    Path path0 = Path();
    path0.moveTo(size.width * 0.2,0);
    path0.lineTo(size.width * 0.2, 0);
    path0.lineTo(size.width * 0.7, 0);
    //line 1

    for(int i = 0; i<(lengthRow%2==0?(lengthRow/2):(lengthRow~/2));i++){
      path0.moveTo(size.width*0.8 ,size.height*0.28*i);
      path0.quadraticBezierTo(size.width*0.7,size.height*0.28*i,size.width*0.8,size.height*0.28*i);
      path0.cubicTo(size.width,size.height*0.28*i,size.width,size.height*0.14*(i+i+1),size.width*0.8,size.height*0.14*(i+i+1));
      path0.quadraticBezierTo(size.width*0.8,size.height*0.14*(i+i+1),size.width*0.8,size.height*0.14*(i+i+1));

      path0.quadraticBezierTo(size.width*0.8,size.height*0.14*(i+i+1),size.width*0.2,size.height*0.14*(i+i+1));

    }
    for(int i = 0; i<(lengthRow%2==0?(lengthRow/2-1):(lengthRow/2).ceil()-1);i++){
      path0.moveTo(size.width*0.2,size.height*0.14*(i+i+1));
      path0.quadraticBezierTo(size.width*0.2,size.height*0.14*(i+i+1),size.width*0.2,size.height*0.14*(i+i+1));
      path0.cubicTo(0,size.height*0.14*(i+i+1),0,size.height*0.28*(i+1),size.width*0.2,size.height*0.28*(i+1));
      path0.quadraticBezierTo(size.width*0.2,size.height*0.28*(i+1),size.width*0.3,size.height*0.28*(i+1));

      path0.quadraticBezierTo(size.width*0.2,size.height*0.28*(i+1),size.width*0.8,size.height*0.28*(i+1));

    }



    //line 2

    //line 3
    /*path0.moveTo(size.width*0.8,size.height*0.28);
    path0.quadraticBezierTo(size.width*0.8,size.height*0.28,size.width*0.8,size.height*0.28);
    path0.cubicTo(size.width,size.height*0.28,size.width,size.height*0.42,size.width*0.8,size.height*0.42);
    path0.quadraticBezierTo(size.width*0.8,size.height*0.42,size.width*0.8,size.height*0.42);

    path0.quadraticBezierTo(size.width*0.8,size.height*0.42,size.width*0.2,size.height*0.42);*/
    //line 4
  /*  path0.moveTo(size.width*0.2,size.height*0.42);
    path0.quadraticBezierTo(size.width*0.2,size.height*0.42,size.width*0.2,size.height*0.42);
    path0.cubicTo(0,size.height*0.42,0,size.height*0.56,size.width*0.2,size.height*0.56);
    path0.quadraticBezierTo(size.width*0.2,size.height*0.56,size.width*0.3,size.height*0.56);
    path0.quadraticBezierTo(size.width*0.2,size.height*0.56,size.width*0.8,size.height*0.56);*/
    return path0;
  }
}



class SliderPaintCustom extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint()
      ..color = Color(0xffeb3ab1)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round


      ..strokeWidth = 7;

    Path path0 = Path();
    path0.moveTo(size.width * 0.2,0);
    path0.lineTo(size.width * 0.2, 0);
    path0.lineTo(size.width * 0.7, 0);
    path0.moveTo(size.width*0.7,0);
    path0.quadraticBezierTo(size.width*0.7,0,size.width*0.8,0);
    path0.cubicTo(size.width,0,size.width,size.height*0.14,size.width*0.8,size.height*0.14);
    path0.quadraticBezierTo(size.width*0.8,size.height*0.14,size.width*0.8,size.height*0.14);
    //line 1
    path0.quadraticBezierTo(size.width*0.8,size.height*0.14,size.width*0.2,size.height*0.14);
    //line 2
    path0.moveTo(size.width*0.2,size.height*0.14);
    path0.quadraticBezierTo(size.width*0.2,size.height*0.14,size.width*0.2,size.height*0.14);
    path0.cubicTo(0,size.height*0.14,0,size.height*0.28,size.width*0.2,size.height*0.28);
    path0.quadraticBezierTo(size.width*0.2,size.height*0.28,size.width*0.3,size.height*0.28);

    path0.quadraticBezierTo(size.width*0.2,size.height*0.28,size.width*0.8,size.height*0.28);
    //line 3
    path0.moveTo(size.width*0.8,size.height*0.28);
    path0.quadraticBezierTo(size.width*0.8,size.height*0.28,size.width*0.8,size.height*0.28);
    path0.cubicTo(size.width,size.height*0.28,size.width,size.height*0.42,size.width*0.8,size.height*0.42);
    path0.quadraticBezierTo(size.width*0.8,size.height*0.42,size.width*0.8,size.height*0.42);

    path0.quadraticBezierTo(size.width*0.8,size.height*0.42,size.width*0.2,size.height*0.42);
    //line 3
    path0.moveTo(size.width*0.2,size.height*0.42);
    path0.quadraticBezierTo(size.width*0.2,size.height*0.42,size.width*0.2,size.height*0.42);
    path0.cubicTo(0,size.height*0.42,0,size.height*0.56,size.width*0.2,size.height*0.56);
    path0.quadraticBezierTo(size.width*0.2,size.height*0.56,size.width*0.3,size.height*0.56);
    path0.quadraticBezierTo(size.width*0.2,size.height*0.56,size.width*0.8,size.height*0.56);


    canvas.drawPath(path0, paint);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}


class DashedPathPainter extends CustomPainter {
  final Path originalPath;
  final Color pathColor;
  final double strokeWidth;
  final double dashGapLength;
  final double dashLength;
  late DashedPathProperties _dashedPathProperties;

  DashedPathPainter({
    required this.originalPath,
    required this.pathColor,
    this.strokeWidth = 3.0,
    this.dashGapLength = 5.0,
    this.dashLength = 10.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _dashedPathProperties = DashedPathProperties(
      path: Path(),
      dashLength: dashLength,
      dashGapLength: dashGapLength,
    );
    final dashedPath = _getDashedPath(originalPath, dashLength, dashGapLength);
    canvas.drawPath(
      dashedPath,
      Paint()
        ..style = PaintingStyle.stroke
        ..color = pathColor
        ..strokeWidth = strokeWidth,
    );
  }

  @override
  bool shouldRepaint(DashedPathPainter oldDelegate) =>
      oldDelegate.originalPath != originalPath ||
          oldDelegate.pathColor != pathColor ||
          oldDelegate.strokeWidth != strokeWidth ||
          oldDelegate.dashGapLength != dashGapLength ||
          oldDelegate.dashLength != dashLength;

  Path _getDashedPath(
      Path originalPath,
      double dashLength,
      double dashGapLength,
      ) {
    final metricsIterator = originalPath.computeMetrics().iterator;
    while (metricsIterator.moveNext()) {
      final metric = metricsIterator.current;
      _dashedPathProperties.extractedPathLength = 0.0;
      while (_dashedPathProperties.extractedPathLength < metric.length) {
        if (_dashedPathProperties.addDashNext) {
          _dashedPathProperties.addDash(metric, dashLength);
        } else {
          _dashedPathProperties.addDashGap(metric, dashGapLength);
        }
      }
    }
    return _dashedPathProperties.path;
  }
}

class DashedPathProperties {
  double extractedPathLength;
  Path path;

  final double _dashLength;
  double _remainingDashLength;
  double _remainingDashGapLength;
  bool _previousWasDash;

  DashedPathProperties({
    required this.path,
    required double dashLength,
    required double dashGapLength,
  })  : assert(dashLength > 0.0, 'dashLength must be > 0.0'),
        assert(dashGapLength > 0.0, 'dashGapLength must be > 0.0'),
        _dashLength = dashLength,
        _remainingDashLength = dashLength,
        _remainingDashGapLength = dashGapLength,
        _previousWasDash = false,
        extractedPathLength = 0.0;

  bool get addDashNext {
    if (!_previousWasDash || _remainingDashLength != _dashLength) {
      return true;
    }
    return false;
  }

  void addDash(PathMetric metric, double dashLength) {
    // Calculate lengths (actual + available)
    final end = _calculateLength(metric, _remainingDashLength);
    final availableEnd = _calculateLength(metric, dashLength);
    // Add path
    final pathSegment = metric.extractPath(extractedPathLength, end);
    path.addPath(pathSegment, Offset.zero);
    // Update
    final delta = _remainingDashLength - (end - extractedPathLength);
    _remainingDashLength = _updateRemainingLength(
      delta: delta,
      end: end,
      availableEnd: availableEnd,
      initialLength: dashLength,
    );
    extractedPathLength = end;
    _previousWasDash = true;
  }

  void addDashGap(PathMetric metric, double dashGapLength) {
    // Calculate lengths (actual + available)
    final end = _calculateLength(metric, _remainingDashGapLength);
    final availableEnd = _calculateLength(metric, dashGapLength);
    // Move path's end point
    Tangent tangent = metric.getTangentForOffset(end)!;
    path.moveTo(tangent.position.dx, tangent.position.dy);
    // Update
    final delta = end - extractedPathLength;
    _remainingDashGapLength = _updateRemainingLength(
      delta: delta,
      end: end,
      availableEnd: availableEnd,
      initialLength: dashGapLength,
    );
    extractedPathLength = end;
    _previousWasDash = false;
  }

  double _calculateLength(PathMetric metric, double addedLength) {
    return min(extractedPathLength + addedLength, metric.length);
  }

  double _updateRemainingLength({
    required double delta,
    required double end,
    required double availableEnd,
    required double initialLength,
  }) {
    return (delta > 0 && availableEnd == end) ? delta : initialLength;
  }
}

