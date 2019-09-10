import 'package:flutter/material.dart';
import '../../themes/textTheme.dart';


class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(child: Container(),),
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            'Notifications',
            style: textStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
          ),
        ),
        Flexible(child: Container(),flex: 3,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/home_page.png'),
        ),
        Text(
          'No New Notifications',
          style: textStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),
        ),
        Text(
          'You currently do not have any unread notifications',
          style: textStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(197, 197, 197, 1.0)
          ),
          textAlign: TextAlign.center,
        ),
        Flexible(child: Container(),flex: 2,),
      ],      
    );
  }
}
