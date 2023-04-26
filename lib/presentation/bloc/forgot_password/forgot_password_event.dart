part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();
}

class TryForgotPasswordEvent extends ForgotPasswordEvent {
  String email;

  TryForgotPasswordEvent({required this.email});

  @override
  List<Object?> get props => [email];
}
