part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccessState extends LoginState {
  final LoginResponseModel response;
  LoginSuccessState(this.response);

  @override
  List<Object> get props => [response];
}

class LoginFailedState extends LoginState {
  final GlobalFailedResponseModel response;
  // final String response;

  LoginFailedState(this.response);

  @override
  List<Object> get props => [response];
}

class LoginFailedUnexpectedState extends LoginState {
  final String msg;

  const LoginFailedUnexpectedState(this.msg);

  @override
  List<Object> get props => [msg];
}
