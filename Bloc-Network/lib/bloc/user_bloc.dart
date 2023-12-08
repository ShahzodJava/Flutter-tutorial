import 'package:bloc_network/bloc/user_event.dart';
import 'package:bloc_network/bloc/user_state.dart';
import 'package:bloc_network/service/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/user.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc({required this.userRepository}): super(UserEmptyState()) {
    on<UserLoadEvent>((event, emit) async {
      emit(UserLoadingState());

      try {
        final List<User> loadedUserList = await userRepository.getAllUsers();
        emit(UserLoadedState(loadedUser: loadedUserList));

      } catch(_) {
          emit(UserErrorState());
      }

    });

    on<UserClearEvent>((event, emit) async {
      emit(UserEmptyState());
    });
  }

}