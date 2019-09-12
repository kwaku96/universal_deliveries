import 'package:bloc/bloc.dart';
import 'package:kingsly_jamal/repository/UserRepository.dart';
import 'package:kingsly_jamal/utils/validators.dart';
import './l_bloc.dart';
import 'package:meta/meta.dart';

class LoginBloc extends Bloc<LoginEvents,LoginStates>{
  UserRepository _userRepository;

  LoginBloc({
    @required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  LoginStates get initialState => LoginStates.empty();

  @override
  Stream<LoginStates> mapEventToState(LoginEvents event) async*{
    if(event is EmailChanged){
      yield* _mapEmailChangedToState(event);
    }else if(event is PasswordChanged){
      yield* _mapPasswordChangedToState(event);
    }else if(event is LoginWithCredentialsPressed){
      yield* _mapLoginWithCredentialsPressedToState(
        email: event.email,
        password: event.password
      );
    }
  }

  Stream<LoginStates> _mapEmailChangedToState(EmailChanged event) async*{
    final email = event.email;
    yield currentState.update(
      isEmailValid: Validators.isEmailValid(email)
    );
  }

  Stream<LoginStates> _mapPasswordChangedToState(PasswordChanged event) async* {
    final password = event.password;
    yield currentState.update(
      isPasswordValid: Validators.isPasswordValid(password)
    );
  }

  Stream<LoginStates> _mapLoginWithCredentialsPressedToState
      ({String email, String password}) async* {
    yield LoginStates.loading();
    try{
      await _userRepository.loginWithCredentials(email: email, password: password);
      yield LoginStates.success();
    }catch(_){
      yield LoginStates.failure();
    }
  }

}