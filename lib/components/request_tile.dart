import 'package:flutter/material.dart';
import '../themes/textTheme.dart';


class RequestTile extends StatelessWidget {
  final bool skewImageLeft;
  final String imagePath;
  final String date;
  final String requestText;
  final String username;

  RequestTile.left({
    @required this.imagePath,
    @required this.date,
    @required this.requestText,
    @required this.username
  }):skewImageLeft = true;

  RequestTile.right({
    @required this.imagePath,
    @required this.date,
    @required this.requestText,
    @required this.username
  }):skewImageLeft = false;

  RequestTile({
    @required this.skewImageLeft,
    @required this.imagePath,
    @required this.date,
    @required this.requestText,
    @required this.username
  });

  @override
  Widget build(BuildContext context) {
    if(skewImageLeft){
      return _leftImage(context);
    }else{
      return _rightImage(context);
    }
  }

  Widget _leftImage(BuildContext context){
    //final height = MediaQuery.of(context).size.height * 0.3;
    final width = MediaQuery.of(context).size.width;
    final height = 205.02857142857144;

    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      width: double.infinity,
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            right: 0.0,
            top: 0.0,
            bottom: 0.0,
            width: width * 0.80,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)
              ),
              elevation: 5.0,
            ),
          ),
          Positioned(
            left: 0.0,
            top: 0.0,
            bottom: 0.0,
            width: width * 0.4,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical:15.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)
                ),
                elevation: 5.0,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image.asset('$imagePath',fit: BoxFit.cover,)
                ),
              ),
            ),
          ),
          Positioned(
            right: 0.0,
            top: 0,
            bottom: 0.0,
            width: width * 0.5,
            child: Container(
              padding: EdgeInsets.only(left: 10.0,right: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('$date',
                    style: textStyle(
                        color: Color.fromRGBO(158, 158, 158, 1.0),
                        fontSize: 16.0
                    ),
                  ),
                  Text(
                    '$username',
                    style: textStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                  ),
                  Text('$requestText',
                    style: textStyle(
                        color: Color.fromRGBO(158, 158, 158, 1.0),
                        fontSize: 16.0
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _rightImage(BuildContext context){
    //final height = MediaQuery.of(context).size.height * 0.3;
    final width = MediaQuery.of(context).size.width;
    final height = 205.02857142857144;

    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      width: double.infinity,
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            left: 0.0,
            top: 0.0,
            bottom: 0.0,
            width: width * 0.80,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)
              ),
              elevation: 5.0,
            ),
          ),
          Positioned(
            right: 0.0,
            top: 0.0,
            bottom: 0.0,
            width: width * 0.4,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical:15.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)
                ),
                elevation: 5.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image.asset(imagePath,fit: BoxFit.cover,),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0.0,
            top: 0,
            bottom: 0.0,
            width: width * 0.5,
            child: Container(
              padding: EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('$date',
                    style: textStyle(
                        color: Color.fromRGBO(158, 158, 158, 1.0),
                        fontSize: 16.0
                    ),
                  ),
                  Text(
                    '$username',
                    style: textStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                  ),
                  Text('$requestText',
                    style: textStyle(
                        color: Color.fromRGBO(158, 158, 158, 1.0),
                        fontSize: 16.0
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
