import 'package:flutter/material.dart';
import 'package:kingsly_jamal/components/scroll_indicator.dart';
import '../../themes/textTheme.dart';


class SplashSliderScreen extends StatefulWidget {
  @override
  _SplashSliderScreenState createState() => _SplashSliderScreenState();
}

class _SplashSliderScreenState extends State<SplashSliderScreen> {

  double scrollPercent = 0.0;
  Offset startDrag;
  double startPercentScroll;
  double finishScrollStart;
  double finishScrollEnd;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: GestureDetector(

        onHorizontalDragStart: _onHorizontalDragStart,
        onHorizontalDragUpdate: _onHorizontalDragUpdate,
        onHorizontalDragEnd: _onHorizontalDragEnd,

        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              child: Image.asset(
                'assets/images/splash_screen_bg.gif',
                fit: BoxFit.cover
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.purple,
                    Colors.purple,
                    Colors.purple.withAlpha(230),
                    Colors.purple.withAlpha(200),
                    Colors.purple.withAlpha(180),
                    Colors.white.withOpacity(0.7),
                    Colors.white.withOpacity(0.6)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                )
              ),
            ),
            Container(
              width: width,
              child: Column(
                children: <Widget>[
                  Flexible(child: Container(),),

                  Text('Map',style: textStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                  ),

                  Flexible(child: Container(),),

                  Card(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)
                    ),
                    child: Container(
                      height: height * 0.35,
                      width: width * .9,
                      child: ClipRRect(
                        borderRadius:BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/map1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  Flexible(child: Container(),),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:30.0),
                    child: Text('find someone near what you want to buy and ask them to buy '
                        'it for you',
                      textAlign: TextAlign.center,
                      style: textStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontStyle: FontStyle.italic
                      ),
                    ),
                  ),
                  Flexible(child: Container(),),

                  //slider indicators
                  Container(
                    height: 10.0,
                    child: ScrollIndicator(
                      color: Colors.purple,
                      scrollPercent: scrollPercent,
                      pageCount: 3,
                      currentIndex: 0,
                    ),
                  ),

                 SizedBox(height: 15.0,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



  void _onHorizontalDragStart(DragStartDetails details) {
    startDrag = details.globalPosition;
    startPercentScroll = scrollPercent;
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    final currentDrag = details.globalPosition;
    final dragDistance = currentDrag.dx - startDrag.dx;
    final singlePageDragPercent = dragDistance/context.size.width;
    print(singlePageDragPercent);

    setState(() {
//      scrollPercent = (
//        startPercentScroll + (-singlePageDragPercent/3)).clamp(0.0, 1.0-(1/3)
//      );
      scrollPercent = singlePageDragPercent * 2;
    });
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    final numCards = 3;

    print(details.velocity);

    finishScrollStart = scrollPercent;
    finishScrollEnd = (scrollPercent * numCards).round()/numCards;

    setState(() {
      startDrag = null;
      startPercentScroll = null;
    });
  }
}
