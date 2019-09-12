import 'package:bloc/bloc.dart';
import 'package:kingsly_jamal/repository/UserRepository.dart';
import './a_bloc.dart';
import 'package:meta/meta.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent,AuthenticationState>{

  final UserRepository _userRepository;

  AuthenticationBloc({
    @required UserRepository userRepository
  }): assert(userRepository != null),
    _userRepository = userRepository;

  @override
  AuthenticationState get initialState => Uninitialised();

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async*{
    if(event is AppStarted){
      yield* _mapAppStartedToState();
    }else if (event is LoggedIn){
      yield* _mapLoggedInToState();
    }else if(event is LoggedOut){
      yield* _mapLoggedOutToState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async*{
    try{
      final bool isSignedIn = await _userRepository.isSignedIn();
      if(isSignedIn){
        final String name = await _userRepository.getUser();
        yield Authenticated(displayName: name);
      }else{
        //TODO remove else statement after splash screen is completed
        yield Unauthenticated();
      }
    }catch(_){
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState() async*{
    yield Authenticated(displayName: (await _userRepository.getUser()));
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async*{
    yield Unauthenticated();
    _userRepository.signOut();
  }

}