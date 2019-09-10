import 'package:flutter/material.dart';
import '../themes/textTheme.dart';
import 'package:line_icons/line_icons.dart';


class TopRequest extends StatelessWidget {

  final String productImagePath;
  final String userImagePath;
  final String username;
  final String requestText;


  TopRequest({
    @required this.productImagePath,
    @required this.userImagePath,
    @required this.username,
    @required this.requestText
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height ;
    print(height);
    print(height* 0.25);
    print(height * 0.3);

    return Container(
      height: height * 0.45,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            height:height* 0.25,
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)
              ),
              child: ClipRRect(
                child: Image.asset('$productImagePath',fit: BoxFit.cover,),
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            height: height * 0.3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)
                ),
                child: _buildBody(context),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context){
    return Column(
      children: <Widget>[
        ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              height: 60.0,
              width: 60.0,
              child: Image.asset('$userImagePath',fit: BoxFit.cover,),
            ),
          ),
          title: Text(
            '$username',
            style: textStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18.0
            ),
          ),
          subtitle: Text(
            '19 Aug',
            style: textStyle(
                color: Color.fromRGBO(197, 197, 197, 1.0),
                fontSize: 18.0
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              '$requestText',
              style: textStyle(
                  color: Color.fromRGBO(197, 197, 197, 1.0),
                  fontSize: 16.0
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:10.0),
          child: _buildRowOfButton(context),
        )
      ],
    );
  }

  Widget _buildRowOfButton(BuildContext context){
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.share),
          onPressed: (){},
        ),
        Flexible(child: Container(),),
        FlatButton.icon(
          onPressed: (){},
          icon: Icon(LineIcons.comments_o),
          label: Text('256'),
        ),
        FlatButton.icon(
          onPressed: (){},
          icon: Icon(LineIcons.heart_o),
          label: Text('4k'),
        )
      ],
    );
  }

}
