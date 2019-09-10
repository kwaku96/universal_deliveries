import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../components/gradient_background.dart';
import '../themes/textTheme.dart';

import 'SignUpPage.dart';


class RecoverPasswordPage extends StatefulWidget {
  @override
  _RecoverPasswordPageState createState() => _RecoverPasswordPageState();
}

class _RecoverPasswordPageState extends State<RecoverPasswordPage> {
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
            child: Text('Reset Password',style: textStyle(
                fontSize: 45.0,fontWeight: FontWeight.bold),
            ),
          ),

          SizedBox(height: 30.0,),

          //form
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:32.0),
            child: _buildForm(context),
          ),

          SizedBox(height: 25.0,),

          //navigation to forgot password
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: '',
                children: [
                  TextSpan(
                    text: 'Or',
                    style: textStyle(
                      color: Colors.white.withAlpha(170),
                      fontSize: 16.0
                    )
                  ),
                  TextSpan(
                      text: ' Create account',
                      style: textStyle( fontSize: 16.0,),
                      recognizer: TapGestureRecognizer()..onTap = (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context)=>SignUpPage())
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
              onPressed: (){},
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
