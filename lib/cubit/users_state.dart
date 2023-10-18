part of 'users_cubit.dart';

sealed class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

final class UsersInitial extends UsersState {}

final class UsersLoadingState extends UsersState {}

final class UsersLoadedState extends UsersState {
  final List<UserModel> userModel;

  const UsersLoadedState(this.userModel);
  @override
  List<Object> get props => [userModel];
}

final class UsersErrorState extends UsersState {
  final String errorMessage;

  const UsersErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
