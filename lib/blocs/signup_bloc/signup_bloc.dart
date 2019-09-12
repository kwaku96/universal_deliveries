import 'package:bloc/bloc.dart';
import 'package:kingsly_jamal/repository/UserRepository.dart';
import 'package:kingsly_jamal/utils/validators.dart';
import 'package:meta/meta.dart';
import './s_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent,SignUpState>{
  final UserRepository _userRepository;

  SignUpBloc({
    @required UserRepository userRepository
  }): assert(userRepository != null),
    _userRepository = userRepository;

  @override
  SignUpState get initialState => SignUpState.empty();

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async*{
    if(event is PasswordChanged){
      yield* _mapPasswordChangedToState(event);
    }else if(event is EmailChanged){
      yield* _mapEmailChangedToState(event);
    }else if(event is NameChanged){
      yield* _mapNameChangedToState(event);
    }else if(event is TelChanged){
      yield* _mapTelChangedToState(event);
    }else if(event is Submitted){
      yield* _mapFormSubmittedToState(event);
    }
  }

  Stream<SignUpState> _mapPasswordChangedToState(PasswordChanged event) async*{
    yield currentState.update(
      isPasswordValid: Validators.isPasswordValid(event.password.trim())
    );
  }

  Stream<SignUpState> _mapEmailChangedToState(EmailChanged event) async* {
    yield currentState.update(
      isEmailValid: Validators.isEmailValid(event.email.trim())
    );
  }

  Stream<SignUpState> _mapNameChangedToState(NameChanged event) async*{
    yield currentState.update(
      isNameValid: Validators.isNameValid(event.name.trim())
    );
  }

  Stream<SignUpState> _mapTelChangedToState(TelChanged event) async*{
    yield currentState.update(
      isTelValid: Validators.isTelValid(event.tel.trim())
    );
  }

  Stream<SignUpState> _mapFormSubmittedToState(Submitted event) async* {
    yield SignUpState.loading();
    try{
      await _userRepository.signUpWithCredentials(
        email: event.email.trim(),
        password: event.password.trim(),
        name: event.name.trim(),
        tel: event.tel.trim()
      );
      yield SignUpState.success();
    }catch(_){
      yield SignUpState.failure();
    }
  }

}