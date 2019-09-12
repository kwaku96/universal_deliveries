import 'package:meta/meta.dart';

@immutable
class SignUpState{
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isTelValid;
  final bool isNameValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  bool get isFormValid => isEmailValid && isPasswordValid &&
      isTelValid && isNameValid;

  SignUpState({
    @required this.isSuccess,
    @required this.isFailure,
    @required this.isSubmitting,
    @required this.isPasswordValid,
    @required this.isEmailValid,
    @required this.isNameValid,
    @required this.isTelValid
  });

  factory SignUpState.empty(){
    return SignUpState(
      isEmailValid: true,
      isPasswordValid: true,
      isNameValid: true,
      isTelValid: true,
      isFailure: false,
      isSuccess: false,
      isSubmitting: false
    );
  }

  factory SignUpState.loading(){
    return SignUpState(
        isEmailValid: true,
        isPasswordValid: true,
        isNameValid: true,
        isTelValid: true,
        isFailure: false,
        isSuccess: false,
        isSubmitting: true
    );
  }

  factory SignUpState.success(){
    return SignUpState(
        isEmailValid: true,
        isPasswordValid: true,
        isNameValid: true,
        isTelValid: true,
        isFailure: false,
        isSuccess: true,
        isSubmitting: false
    );
  }

  factory SignUpState.failure(){
    return SignUpState(
        isEmailValid: true,
        isPasswordValid: true,
        isNameValid: true,
        isTelValid: true,
        isFailure: true,
        isSuccess: false,
        isSubmitting: false
    );
  }

  SignUpState update({
    bool isEmailValid,
    bool isPasswordValid,
    bool isNameValid,
    bool isTelValid
  }){
    return copyWith(
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isNameValid: isNameValid,
      isTelValid: isTelValid
    );
  }

  SignUpState copyWith({
    bool isEmailValid,
    bool isPasswordValid,
    bool isTelValid,
    bool isNameValid,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure
  }){
    return SignUpState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      isTelValid: isTelValid ?? this.isTelValid,
      isNameValid: isNameValid ?? this.isNameValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isEmailValid: isEmailValid ?? this.isEmailValid
    );
  }

  @override
  String toString() {
    return '''SignUpState {
      isEmailValid: $isEmailValid,
      isPasswordValid: $isPasswordValid,
      isSubmitting: $isSubmitting,
      isSuccess: $isSuccess,
      isFailure: $isFailure,
      isTelValid: $isTelValid,
      isNameValid: $isNameValid
    }''';
  }
}