import 'package:flutter/material.dart';
import 'package:kingsly_jamal/blocs/login_bloc/l_bloc.dart';
import 'package:kingsly_jamal/blocs/signup_bloc/s_bloc.dart';
import 'package:kingsly_jamal/pages/HomePage.dart';
import 'package:kingsly_jamal/pages/LandingPage.dart';
import 'package:kingsly_jamal/repository/UserRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './blocs/authentication_bloc/a_bloc.dart';
import './blocs/simple_bloc_delegate.dart';
import 'package:bloc/bloc.dart';
import './pages/splash_screen/splash_slider.dart';

void main(){
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final UserRepository userRepository = UserRepository();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          builder: (context)=> AuthenticationBloc(userRepository: userRepository)
            ..dispatch(AppStarted())
        ),
        BlocProvider<LoginBloc>(
          builder: (context)=>LoginBloc(userRepository: userRepository),
        ),
        BlocProvider<SignUpBloc>(
          builder: (context)=>SignUpBloc(userRepository: userRepository),
        )
      ],
      child: MyApp(userRepository: userRepository),
    )
  );
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  MyApp({@required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Universal Deliveries',
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AuthenticationBloc,AuthenticationState>(
        builder: (context,state){
          if(state is Uninitialised){
            return SplashSliderScreen();
          }else if(state is Unauthenticated){
            return LandingPage(userRepository:userRepository);
          }else{
            return HomePage();
          }
        },
      ),
    );
  }
}
