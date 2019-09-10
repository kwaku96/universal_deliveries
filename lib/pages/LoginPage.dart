import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../components/gradient_background.dart';
import '../themes/textTheme.dart';


import 'HomePage.dart';
import 'RecoverPassword.dart';
import 'SignUpPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        GradientBackground(),
        _buildPage(context)
      ],
    );
  }

  Widget _buildPage(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: <Widget>[
          //Texts
          Container(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            width: double.infinity,
            child: Text('Log In.',style: textStyle(
              fontSize: 60.0,fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            width: double.infinity,
            child: Text("We've missed you!",style: textStyle(fontSize: 18.0),)
          ),

          SizedBox(height: 30.0,),

          //form
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:32.0),
            child: _buildForm(context),
          ),

          SizedBox(height: 5.0,),

          //navigation to forgot password
          GestureDetector(
            child: Text('Forgot Password?',style: textStyle(
                color: Colors.white.withAlpha(170),
                fontSize: 16.0
              ),
              textAlign: TextAlign.center,
            ),
            onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> RecoverPasswordPage())
              );
            },
          ),
          SizedBox(height: 5.0,),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: '',
              children: [
                TextSpan(
                  text: 'New User?',
                  style: textStyle(
                    fontSize: 16.0,
                    color: Colors.white.withAlpha(170)
                  )
                ),
                TextSpan(
                  text: ' Create account',
                  style: textStyle( fontSize: 16.0,),
                  recognizer: TapGestureRecognizer()..onTap = (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=> SignUpPage())
                    );
                  }
                )
              ]
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildForm(BuildContext context){
    //TODO validate form
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: _inputDecoration(
              hintText: 'Email Address',
              icon: Icons.mail_outline
            ),
          ),
          SizedBox(height: 15.0,),
          TextFormField(
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: _inputDecoration(
              hintText: 'Password',
              icon: Icons.lock_open
            ),
          ),
          SizedBox(height: 15.0,),
          Padding(
            padding: const EdgeInsets.only(top:20.0,bottom: 20.0),
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
                    MaterialPageRoute(builder: (context)=>HomePage())
                );
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              padding: EdgeInsets.symmetric(vertical: 20.0),
            ),
          ),
        ],
      ),
    );
  }


  InputDecoration _inputDecoration({IconData icon,String hintText}){
    return InputDecoration(
      prefixIcon: Icon(icon,color: Colors.white,),
      hintText: hintText,
      hintStyle: textStyle(
        fontSize:18.0,
        fontWeight:FontWeight.normal
      ),
      border:UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      enabledBorder:UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
    );
  }
}
