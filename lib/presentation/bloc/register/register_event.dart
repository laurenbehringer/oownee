part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class LoadRegisterEvent extends RegisterEvent {
  final String name, country, address, email, phone, password;

  const LoadRegisterEvent(
      {required this.name,
      required this.country,
      required this.address,
      required this.email,
      required this.phone,
      required this.password});

  @override
  List<Object?> get props => [name, country, address, email, phone, password];
}
