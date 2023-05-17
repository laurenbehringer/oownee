part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
}

class RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterLoadingState extends RegisterState {
  @override
  List<Object> get props => [];
}

//under here

class RegisterFailedState extends RegisterState {
  final GlobalFailedResponseModel response;

  RegisterFailedState(this.response);

  @override
  List<Object> get props => [response];
}

class RegisterFailedUnexpectedState extends RegisterState {
  String msg;
  RegisterFailedUnexpectedState(this.msg);

  @override
  List<Object> get props => [msg];
}

class RegisterSuccessState extends RegisterState {
  final RegisterResponseModel response;
  RegisterSuccessState(this.response);

  @override
  List<Object> get props => [response];
}
