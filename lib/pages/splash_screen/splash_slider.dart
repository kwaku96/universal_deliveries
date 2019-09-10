import 'package:flutter/material.dart';
import '../../themes/textTheme.dart';


class SplashSliderScreen extends StatefulWidget {
  @override
  _SplashSliderScreenState createState() => _SplashSliderScreenState();
}

class _SplashSliderScreenState extends State<SplashSliderScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            child: Image.asset('assets/images/man5.jpg',fit: BoxFit.cover),
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
                  Colors.transparent
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
                      color: Colors.black
                    ),
                  ),
                ),
                Flexible(child: Container(),),

                //slider indicators
                Container(height: 10.0,),

               SizedBox(height: 10.0,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
