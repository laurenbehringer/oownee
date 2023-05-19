part of 'add_new_bloc.dart';

abstract class AddNewState extends Equatable {
  const AddNewState();
}

class AddNewInitial extends AddNewState {
  @override
  List<Object> get props => [];
}

class AddNewLoadState extends AddNewState {
  @override
  List<Object> get props => [];
}

class AddNewFailedState extends AddNewState {
  final GlobalFailedResponseModel response;

  const AddNewFailedState(this.response);

  @override
  List<Object> get props => [response];
}

class AddNewFailedUnexpectedState extends AddNewState {
  String msg;
  AddNewFailedUnexpectedState(this.msg);

  @override
  List<Object> get props => [msg];
}

class AddNewSuccessState extends AddNewState {
  final EditSuccessResponseModel tenantData;
  AddNewSuccessState(this.tenantData);

  @override
  List<Object> get props => [tenantData];
}

class AddPropertySuccessState extends AddNewState {
  final AddPropertyResponseModel response;

  AddPropertySuccessState(this.response);

  @override
  List<Object> get props => [response];
}

class AddPropertyImageSuccessState extends AddNewState {
  final EditSuccessResponseModel response;

  AddPropertyImageSuccessState(this.response);

  @override
  List<Object> get props => [response];
}
