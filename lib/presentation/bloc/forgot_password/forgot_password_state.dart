part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();
}

class ForgotPasswordInitial extends ForgotPasswordState {
  @override
  List<Object> get props => [];
}

class ForgotPasswordFailedState extends ForgotPasswordState {
  @override
  List<Object?> get props => [];
}

class ForgotPasswordSuccessState extends ForgotPasswordState {
  @override
  List<Object?> get props => [];
}

class ForgotPasswordLoadingState extends ForgotPasswordState {
  @override
  List<Object?> get props => [];
}
