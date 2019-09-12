import 'package:flutter/material.dart';
import 'package:kingsly_jamal/blocs/authentication_bloc/a_bloc.dart';
import 'package:kingsly_jamal/blocs/signup_bloc/s_bloc.dart';
import '../themes/textTheme.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'HomePage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _telController = TextEditingController();

  String _gender = 'gender';

  SignUpBloc _signUpBloc;

  bool get isPopulated =>
      _emailController.text.isNotEmpty &&
      _passwordController.text.isNotEmpty &&
      _telController.text.isNotEmpty &&
      _nameController.text.isNotEmpty;

  bool isSignUpButtonEnabled(SignUpState state){
    return isPopulated && state.isFormValid && !state.isSubmitting;
  }


  @override
  void initState() {
    super.initState();
    _signUpBloc = BlocProvider.of(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordController);
    _nameController.addListener(_onNameChanged);
    _telController.addListener(_onTelChanged);
  }

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
    return BlocListener<SignUpBloc,SignUpState>(
      listener: (context,state){
        if(state.isSubmitting){
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Signing up ....',
                    style: textStyle(color: Colors.pink,fontSize: 16.0),

                  ),
                  CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.pink)
                  ),
                ],
              ),
            ));
        }else if(state.isFailure){
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Row(
                children: <Widget>[
                  Text(
                    'Sign up failed, checked credential and try again',
                    style: textStyle(color: Colors.pink,fontSize: 16.0),
                  )
                ],
              ),
            ));
        }else if(state.isSuccess){
          BlocProvider.of<AuthenticationBloc>(context).dispatch(LoggedIn());
          Navigator.of(context).popUntil(
            ModalRoute.withName(Navigator.defaultRouteName)
          );
        }
      },
      child: BlocBuilder<SignUpBloc,SignUpState>(
        builder: (context,state){
          return Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  decoration: _inputDecoration(
                    hintText: 'Full Name',
                    icon: LineIcons.user,
                    textColor: Color.fromRGBO(34, 34, 34, 1.0),
                    borderColor: Color.fromRGBO(178, 178, 178, 1.0)
                  ),
                  autocorrect: false,
                  autovalidate: true,
                  validator: (_){
                    return state.isNameValid ? null : 'invalid name';
                  },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: _inputDecoration(
                    hintText: 'Email Address',
                    icon: Icons.mail_outline,
                    textColor: Color.fromRGBO(34, 34, 34, 1.0),
                    borderColor: Color.fromRGBO(178, 178, 178, 1.0),
                  ),
                  autovalidate: true,
                  autocorrect: false,
                  validator: (_){
                    return state.isEmailValid ? null : "Invalid email";
                  },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  controller: _telController,
                  keyboardType: TextInputType.phone,
                  decoration: _inputDecoration(
                    hintText: 'Phone Number',
                    icon: LineIcons.phone,
                    textColor: Color.fromRGBO(34, 34, 34, 1.0),
                    borderColor: Color.fromRGBO(178, 178, 178, 1.0)
                  ),
                  autovalidate: true,
                  autocorrect: false,
                  validator: (_){
                    return state.isTelValid?null:'invalid phone number';
                  },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: _inputDecoration(
                    hintText: 'Password',
                    icon: Icons.lock_open,
                    textColor: Color.fromRGBO(34, 34, 34, 1.0),
                    borderColor: Color.fromRGBO(178, 178, 178, 1.0)
                  ),
                  autovalidate: true,
                  autocorrect: false,
                  validator: (_){
                    return state.isPasswordValid?null:'invalid password';
                  },
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
                  onPressed: isSignUpButtonEnabled(state)?
                      (){
                        _signUpBloc.dispatch(
                          Submitted(
                            email: _emailController.text,
                            password: _passwordController.text,
                            tel: _telController.text,
                            name: _nameController.text
                          )
                        );
                      }:null,
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                )
              ],
            ),
          );
        },
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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _telController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    _signUpBloc.dispatch(
      EmailChanged(email: _emailController.text)
    );
  }

  void _onPasswordController() {
    _signUpBloc.dispatch(
      PasswordChanged(password: _passwordController.text)
    );
  }

  void _onNameChanged() {
    _signUpBloc.dispatch(
      NameChanged(name: _nameController.text)
    );
  }

  void _onTelChanged() {
    _signUpBloc.dispatch(
      TelChanged(tel: _telController.text)
    );
  }
}
