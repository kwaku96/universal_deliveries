import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable{
  SignUpEvent([List props =const []]):super(props);
}


class EmailChanged extends SignUpEvent{
  final String email;

  EmailChanged({@required this.email}):super([email]);

  @override
  String toString() {
    return "email changed {$email}";
  }
}


class PasswordChanged extends SignUpEvent{
  final String password;

  PasswordChanged({@required this.password}):super([password]);

  @override
  String toString() {
    return "password changed {$password}";
  }
}


class NameChanged extends SignUpEvent{
  final String name;

  NameChanged({@required this.name}):super([name]);

  @override
  String toString() {
    return "name changed {$name}";
  }
}


class TelChanged extends SignUpEvent{
  final String tel;

  TelChanged({@required this.tel}):super([tel]);

  @override
  String toString() {
    return "telephone changed {$tel}";
  }
}


class Submitted extends SignUpEvent{
  final String name;
  final String password;
  final String tel;
  final String email;

  Submitted({
    @required this.email,
    @required this.password,
    @required this.name,
    @required this.tel
  }):assert(email != null),
    assert(password != null),
    assert(tel != null),
    assert(name != null),
    super([email,password,name,tel]);

  @override
  String toString() {
    return '''submitted 
      {
        email:$email,
        password:$password,
        name:$name,
        tel:$tel
      }
      ''';
  }
}