import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:story_ui/screens/home/home_screen.dart';

class ChartStepScreen extends StatelessWidget {
  const ChartStepScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> listNumber = List.generate(13, (index) => index);
    print(listNumber);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('ChartStep'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 100,),
            SizedBox(
              height: size.height * 0.65,
              width: size.width,
              child: CustomPaint(
                size: Size(size.width,size.height),
                painter: /*SliderPaintCustom(),*/DashedPathPainter(
                    originalPath: pathCustom(size),
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
                        children: List.generate(5, (indexColumn) => Padding(
                          padding: EdgeInsets.only(left: size.height * 0.02,right: size.height * 0.02,bottom: size.height * 0.04),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: List.generate(indexColumn%2==0?3:2, (indexRow) {
                              int numberStepTwo = (indexRow+(indexColumn * 2));
                              int numberStepThree = 1+(indexRow+(indexColumn * 2));
                              return Container(
                                width: size.height * 0.1,
                                height: size.height * 0.1,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle
                                ),
                                child: Text('${listNumber[indexColumn%2==0?numberStepTwo:numberStepThree]}',style: TextStyle(
                                  color: Colors.white,fontSize: size.height * 0.03,fontWeight: FontWeight.bold
                                )),
                              );
                            },
                            ),
                          ),
                        ),)
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

  Path pathCustom(Size size){
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

