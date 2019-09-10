import 'package:flutter/material.dart';
import '../../components/profile_header.dart';
import '../../themes/textTheme.dart';
import 'package:line_icons/line_icons.dart';


class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        ProfileHeader(),
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 23.0),
            children: <Widget>[
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          height: 30.0,
                          width: 30.0,
                          color: Colors.red,
                          child: Icon(Icons.favorite,color: Colors.white,)
                        ),
                      ),
                      title: Text(
                        'likes'.toUpperCase(),
                        style: textStyle(
                          color: Colors.black.withAlpha(220),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      trailing: Icon(LineIcons.chevron_circle_right),
                    ),
                    Divider(color: Colors.black,),
                    ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                            height: 30.0,
                            width: 30.0,
                            color: Colors.green,
                            child: Icon(LineIcons.eye,color: Colors.white,)
                        ),
                      ),
                      title: Text(
                        'visitors'.toUpperCase(),
                        style: textStyle(
                            color: Colors.black.withAlpha(220),
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      trailing: Icon(LineIcons.chevron_circle_right),
                    ),
                    Divider(color: Colors.black,),
                    ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                            height: 30.0,
                            width: 30.0,
                            color: Colors.purple,
                            child: Icon(LineIcons.group,color: Colors.white,)
                        ),
                      ),
                      title: Text(
                        'groups'.toUpperCase(),
                        style: textStyle(
                            color: Colors.black.withAlpha(220),
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      trailing: Icon(LineIcons.chevron_circle_right),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
                ),
                elevation: 5.0,
                margin: EdgeInsetsDirectional.only(top: 30.0,bottom: 25.0),
              ),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                            height: 30.0,
                            width: 30.0,
                            color: Colors.redAccent,
                            child: Icon(LineIcons.money,color: Colors.white,)
                        ),
                      ),
                      title: Text(
                        'Wallet'.toUpperCase(),
                        style: textStyle(
                            color: Colors.black.withAlpha(220),
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      trailing: Icon(LineIcons.chevron_circle_right),
                    ),
                    Divider(color: Colors.black,),
                    ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                            height: 30.0,
                            width: 30.0,
                            color: Colors.blueAccent,
                            child: Icon(LineIcons.diamond,color: Colors.white,)
                        ),
                      ),
                      title: Text(
                        'vip'.toUpperCase(),
                        style: textStyle(
                            color: Colors.black.withAlpha(220),
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      trailing: Icon(LineIcons.chevron_circle_right),
                    ),
                    Divider(color: Colors.black,),
                    ListTile(
                      leading: Icon(LineIcons.group),
                      title: Text(
                        'groups'.toUpperCase(),
                        style: textStyle(
                            color: Colors.black.withAlpha(220),
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      trailing: Icon(LineIcons.chevron_circle_right),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                elevation: 5.0,
                margin: EdgeInsetsDirectional.only(top: 25.0,bottom: 25.0),
              )
            ],
          ),
        )
      ],
    );
  }

}
