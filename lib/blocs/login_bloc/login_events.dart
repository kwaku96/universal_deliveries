import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class LoginEvents extends Equatable {
  LoginEvents([List props = const []]) : super(props);
}

class EmailChanged extends LoginEvents{
  final String email;

  EmailChanged({ @required this.email}):super([email]);

  @override
  String toString() => "EmailChanged { email :$email }";
}

class PasswordChanged extends LoginEvents {
  final String password;

  PasswordChanged({@required this.password}) : super([password]);

  @override
  String toString() => 'PasswordChanged { password: $password }';
}


class Submitted extends LoginEvents {
  final String email;
  final String password;

  Submitted({
    @required this.email,
    @required this.password
  }):super([email,password]);

  @override
  String toString()=> 'Submitted { email: $email, password: $password }';
}


class LoginWithCredentialsPressed extends LoginEvents {
  final String email;
  final String password;

  LoginWithCredentialsPressed({@required this.email, @required this.password})
      : super([email, password]);

  @override
  String toString() {
    return 'LoginWithCredentialsPressed { email: $email, password: $password }';
  }
}