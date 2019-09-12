import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kingsly_jamal/blocs/authentication_bloc/a_bloc.dart';
import 'package:kingsly_jamal/blocs/login_bloc/l_bloc.dart';
import 'package:kingsly_jamal/repository/UserRepository.dart';
import '../components/gradient_background.dart';
import '../themes/textTheme.dart';


import 'RecoverPassword.dart';
import 'SignUpPage.dart';

class LoginPage extends StatefulWidget {
  final UserRepository userRepository;

  LoginPage({Key key,@required this.userRepository}):
    assert(userRepository != null),
    super(key:key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginBloc _loginBloc;

  bool get isPopulated => _emailController.text.isNotEmpty
      && _passwordController.text.isNotEmpty;

  bool isLoginButtonEnabled(LoginStates state){
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }


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

    return BlocListener<LoginBloc,LoginStates>(
      listener: (context,state){
        if(state.isSubmitting){
          Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Logging in ....',
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
                      'Login failed, checked credential and try again',
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
      child: BlocBuilder<LoginBloc,LoginStates>(
        builder: (context,state){
          return Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: _inputDecoration(
                      hintText: 'Email Address',
                      icon: Icons.mail_outline
                  ),
                  style: textStyle(),
                  autocorrect: false,
                  autovalidate: true,
                  validator: (_){
                    return !state.isEmailValid ? 'Invalid email':null;
                  },
                ),
                SizedBox(height: 15.0,),
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: _inputDecoration(
                    hintText: 'Password',
                    icon: Icons.lock_open,
                  ),
                  style: textStyle(),
                  autocorrect: false,
                  autovalidate: true,
                  validator: (_){
                    return !state.isPasswordValid ? "password not valid":null;
                  },
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
                    onPressed: isLoginButtonEnabled(state) ? (){
                      print('hello world');
                      _loginBloc.dispatch(
                        LoginWithCredentialsPressed(
                          email: _emailController.text,
                          password: _passwordController.text
                        )
                      );
                    }:null,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                  ),
                ),
              ],
            ),
          );
        },
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

  void _onEmailChanged() {
    _loginBloc.dispatch(
      EmailChanged(email: _emailController.text)
    );
  }

  void _onPasswordChanged() {
    _loginBloc.dispatch(
      PasswordChanged(password: _passwordController.text)
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

}
