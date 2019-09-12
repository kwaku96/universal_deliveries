import 'package:flutter/material.dart';
import 'package:kingsly_jamal/repository/UserRepository.dart';
import '../components/gradient_background.dart';
import '../themes/textTheme.dart';


import 'LoginPage.dart';
import 'SignUpPage.dart';

class LandingPage extends StatelessWidget {

  final UserRepository userRepository;

  LandingPage({
    @required this.userRepository
  }):assert(userRepository != null);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        GradientBackground(),
        _buildHome(context)
      ],
    );
  }

  Widget _buildHome(BuildContext context){
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Flexible(child: Container(),flex: 3,),

              //logo
              Container(
                width: 115.0,
                height: 115.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/app_logo.png'),
                        fit: BoxFit.cover
                    )
                ),
              ),
              //greeting message
              Text(
                'Universal Delivery',
                style: textStyle(fontSize:20,fontWeight:FontWeight.bold),
              ),
              Text(
                'Delivery is just a button away',
                style: textStyle(fontSize:16.0,fontWeight:FontWeight.w600),
              ),

              Flexible(child: Container(),flex: 2,),

              //buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: OutlineButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Login'.toUpperCase()),
                    ],
                  ),
                  onPressed: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context)=> LoginPage(userRepository: userRepository,)
                        )
                    );
                  },
                  color: Colors.white,
                  textColor: Colors.white,
                  borderSide: BorderSide(
                      color: Colors.white
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  highlightedBorderColor: Colors.white,
                ),
              ),
              SizedBox(height: 20.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:32.0),
                child: RaisedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign up'.toUpperCase(),
                      ),
                    ],
                  ),
                  onPressed: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>SignUpPage())
                    );
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                ),
              ),

              Flexible(child: Container(),flex: 1,),

              //decoration Image
              Padding(
                padding: const EdgeInsets.only(left:8.0),
                child: Image.asset('assets/images/home_page.png'),
              ),

              Flexible(child: Container(),),
            ],
          ),
        ),
      ),

    );
  }
}
