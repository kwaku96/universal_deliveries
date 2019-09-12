import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationState extends Equatable{
  AuthenticationState([List props = const []]):super(props);
}

class Uninitialised extends AuthenticationState{
  @override
  toString() => "Uninitialised";
}

class Authenticated extends AuthenticationState{
  final String displayName;

  Authenticated({@required this.displayName}):super([displayName]);

  @override
  toString() => "Authenticated { displayName: $displayName }";
}

class Unauthenticated extends AuthenticationState{
  @override
  toString() => "unauthenticated";
}