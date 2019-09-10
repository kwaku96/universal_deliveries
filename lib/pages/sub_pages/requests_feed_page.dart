import 'package:flutter/material.dart';
import '../../components/request_tile.dart';
import '../../model/user_requests.dart';
import '../../themes/textTheme.dart';



class RequestsFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20.0),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: 40.0,),
              Text(
                'Available Errands',
                style: textStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
              ),
              SizedBox(height: 20.0,),
            ]),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context,index){
                  if(index % 2 == 0){
                    return RequestTile.left(
                      imagePath: availableRequests[index].imagePath,
                      date: availableRequests[index].date,
                      requestText: availableRequests[index].requestText,
                      username: availableRequests[index].username
                    );
                  }else{
                    return RequestTile.right(
                      imagePath: availableRequests[index].imagePath,
                      date: availableRequests[index].date,
                      requestText: availableRequests[index].requestText,
                      username: availableRequests[index].username
                    );
                  }
                },
              childCount: availableRequests.length
            ),
          )
        ],
      ),
    );
  }
}
