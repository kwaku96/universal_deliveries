import 'package:flutter/material.dart';
import '../themes/textTheme.dart';

import 'gradient_background.dart';


class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.45;
    final width = MediaQuery.of(context).size.width;
    final cardWidth = width*.9;
    return Container(
      width: double.infinity,
      height: height ,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              height: height * 0.8,
              child: GradientBackground()
          ),
          Positioned(
            bottom: 0.0,
            left: (width/2)-(cardWidth)/2,
            height: height*0.8,
            width: cardWidth,
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: _buildProfileImageTile(context)
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _buildStats(statName: 'visitors',value: '2305'),
                      _buildStats(statName: 'liked',value: '235'),
                      _buildStats(statName: 'matched',value: '25'),
                    ],
                  ),
                  SizedBox(height: 10.0,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProfileImageTile(BuildContext context){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(width: 15.0,),
        Container(
          height: 110.0,
          width: 110.0,
          decoration: BoxDecoration(
              color: Colors.black.withAlpha(110),
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage('assets/images/woman1.jpg'),
                  fit: BoxFit.cover
              )
          ),
        ),
        SizedBox(width: 10.0,),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Kingsley Agomina',
              style: textStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
                color: Colors.black,
              ),
            ),
            Text(
              'KNUST, Katanga Hall',
              style: textStyle(
                  fontSize: 16.0,
                  color: Color.fromRGBO(197, 197, 197, 1.0)
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _buildStats({String statName,String value}){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[

        Text(
          statName.toUpperCase(),
          style: textStyle(
              fontSize: 20.0,
              color: Color.fromRGBO(197, 197, 197, 1.0)
          ),
        ),
        Text(
          '$value',
          style: textStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Colors.black
          ),
        ),
      ],
    );
  }
}
