part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoadLoginEvent extends LoginEvent {
  final String email, password;
  const LoadLoginEvent(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}
