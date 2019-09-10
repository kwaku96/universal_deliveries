import 'package:flutter/material.dart';
import '../themes/textTheme.dart';
import 'package:line_icons/line_icons.dart';

import 'HomePage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  String _gender = 'gender';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 250, 250, 1.0),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20.0,),
          Text(
            'Tell us about you.',
            textAlign: TextAlign.center,
            style: textStyle(
              color: Colors.black,
              fontSize: 42.0,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 30.0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:32.0),
            child: _buildForm(context),
          )
        ],
      ),
    );
  }

  Widget _buildForm(BuildContext context){
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: _inputDecoration(
              hintText: 'Full Name',
              icon: LineIcons.user,
              textColor: Color.fromRGBO(34, 34, 34, 1.0),
              borderColor: Color.fromRGBO(178, 178, 178, 1.0)
            ),
          ),
          SizedBox(height: 20.0,),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: _inputDecoration(
              hintText: 'Email Address',
              icon: Icons.mail_outline,
              textColor: Color.fromRGBO(34, 34, 34, 1.0),
              borderColor: Color.fromRGBO(178, 178, 178, 1.0)
            ),
          ),
          SizedBox(height: 20.0,),
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: _inputDecoration(
              hintText: 'Phone Number',
              icon: LineIcons.phone,
              textColor: Color.fromRGBO(34, 34, 34, 1.0),
              borderColor: Color.fromRGBO(178, 178, 178, 1.0)
            ),
          ),
          SizedBox(height: 20.0,),
          TextFormField(
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: _inputDecoration(
              hintText: 'Password',
              icon: Icons.lock_open,
              textColor: Color.fromRGBO(34, 34, 34, 1.0),
              borderColor: Color.fromRGBO(178, 178, 178, 1.0)
            ),
          ),
          SizedBox(height: 25.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildRadioButton(label: 'Male'),
              _buildRadioButton(label: 'Female'),
              _buildRadioButton(label: 'Other'),
              SizedBox(width: 15.0,)
            ],
          ),
          SizedBox(height: 25.0,),
          RaisedButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Create account'.toUpperCase(),
                  style: textStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
            color: Color.fromRGBO(245, 171, 101, 1.0),
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>HomePage())
              );
            },
            padding: EdgeInsets.symmetric(vertical: 20.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          )
        ],
      ),
    );
  }

  Widget _buildRadioButton({String label}){
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          groupValue: _gender,
          value: '$label',
          onChanged: (val){
            setState(() {
              _gender = val;
            });
          },
          activeColor: Color.fromRGBO(34, 34, 34, 1.0),
        ),
        Text(
          '$label',
          style: textStyle(
            fontSize: 16.0,
            color: Color.fromRGBO(34, 34, 34, 1.0)
          ),
        )
      ],
    );
  }

  InputDecoration _inputDecoration({
    IconData icon,
    String hintText,
    Color textColor= Colors.white,
    Color borderColor = Colors.black
  }){
    return InputDecoration(
      prefixIcon: Icon(icon,color: borderColor,),
      hintText: hintText,
      hintStyle: textStyle(
        fontSize:18.0,
        fontWeight:FontWeight.normal,
        color: textColor,
      ),
      border:UnderlineInputBorder(borderSide: BorderSide(color: borderColor)),
      enabledBorder:UnderlineInputBorder(borderSide: BorderSide(color: borderColor)),
      focusedBorder:UnderlineInputBorder(borderSide: BorderSide(color: borderColor)),
    );
  }
}
