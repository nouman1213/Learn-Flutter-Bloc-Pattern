import 'package:api_project_bloc/models/users_model.dart';
import 'package:api_project_bloc/repo/user_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit(this.usersRepo) : super(UsersLoadingState());
  final UsersRepo? usersRepo;
  onUserLoaded() async {
    try {
      emit(UsersLoadingState());
      var data = await usersRepo!.getUsers();
      emit(UsersLoadedState(data));
    } catch (e) {
      emit(UsersErrorState(e.toString()));
    }
  }
}
