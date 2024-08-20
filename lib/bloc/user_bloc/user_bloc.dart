import 'package:bloc/bloc.dart';
import 'package:crm/bloc/user_bloc/user_event.dart';
import 'package:crm/bloc/user_bloc/user_state.dart';
import 'package:crm/services/authentacation_service.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthenticationService authService;

  UserBloc({required this.authService}) : super(UserInitial()) {
    on<LoadUserProfile>(_onLoadUserProfile);
  }

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is LoadUserProfile) {
      yield UserLoading();
      try {
        final userProfile = await authService.getUserProfile();
        yield UserLoaded(userProfile);
      } catch (error) {
        yield UserFailure(error.toString());
      }
    }
  }

  Future<void> _onLoadUserProfile(
      LoadUserProfile event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final userProfile = await authService.getUserProfile();
      emit(UserLoaded(userProfile));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}
