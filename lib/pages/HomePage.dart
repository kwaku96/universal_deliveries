import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../pages/sub_pages/maps_search.dart';
import 'package:line_icons/line_icons.dart';


import 'sub_pages/notifications.dart';
import 'sub_pages/profile.dart';
import 'sub_pages/requests_feed_page.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> _pages = [
    RequestsFeed(),
    MapSearch(),
    Notifications(),
    Profile()
  ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 241, 241, 1.0),
      body: _pages[_currentIndex],
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildBottomBar(){
    return BottomNavigationBar(
      elevation: 0.0,
      backgroundColor: Color.fromRGBO(250, 250, 250, 1.0),
      currentIndex: _currentIndex,
      selectedItemColor: Color.fromRGBO(246, 181, 121, 1.0),
      unselectedItemColor: Colors.grey.withOpacity(0.6),
      onTap: (val){
        setState(() { _currentIndex = val; });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.rss_feed),
          title: Text('Request'),
        ),
        BottomNavigationBarItem(
          icon: Icon(LineIcons.map),
          title: Text('Map')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_none),
          title: Text('Notification')
        ),
        BottomNavigationBarItem(
          icon: Icon(LineIcons.user),
          title: Text('Profile')
        ),
      ],
    );
  }
}
