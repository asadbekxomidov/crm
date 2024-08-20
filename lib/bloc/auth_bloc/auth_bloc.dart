import 'package:crm/services/authentacation_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationService _authService;

  AuthenticationBloc(this._authService) : super(AuthenticationInitial()) {
    on<RegisterUserEvent>(_onRegisterUser);
    on<LoginUserEvent>(_onLoginUser);
    on<LogoutEvent>(_onLogoutEvent);
  }

  // Future<void> _onRegisterUser(
  //     RegisterUserEvent event, Emitter<AuthenticationState> emit) async {
  //   emit(AuthenticationLoading());
  //   on<LoginUserEvent>(_onLoginUser);
  //   try {
  //     await _authService.registerUser(
  //       event.name,
  //       event.phone,
  //       event.password,
  //       event.passwordConfirmation,
  //     );
  //     emit(AuthenticationSuccess());
  //   } catch (error) {
  //     emit(AuthenticationFailure(error: error.toString()));
  //   }
  // }

  Future<void> _onRegisterUser(
      RegisterUserEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    try {
      await _authService.registerUser(
        event.name,
        event.phone,
        event.password,
        event.passwordConfirmation,
      );
      emit(AuthenticationSuccess());
    } catch (error) {
      emit(AuthenticationFailure(error: error.toString()));
    }
  }

  Future<void> _onLoginUser(
      LoginUserEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    try {
      await _authService.loginUser(event.phone, event.password);
      emit(AuthenticationSuccess());
    } catch (error) {
      emit(AuthenticationFailure(error: error.toString()));
    }
  }

  // Future<void> _onLogoutEvent(
  //     LogoutEvent event, Emitter<AuthenticationState> emit) async {
  //   emit(AuthenticationLoading());
  //   try {
  //     await _authService.logoutUser();
  //     emit(AuthenticationSuccess());
  //   } catch (error) {
  //     emit(AuthenticationFailure(error: error.toString()));
  //   }
  // }

  Future<void> _onLogoutEvent(
      LogoutEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    try {
      await _authService.logoutUser();
      emit(AuthenticationSuccess());
    } catch (error) {
      emit(AuthenticationFailure(error: error.toString()));
    }
  }
}
