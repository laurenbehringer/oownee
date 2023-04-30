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
  @override
  List<Object> get props => [];
}

class AddNewSuccessState extends AddNewState {
  final EditSuccessResponseModel tenantData;
  AddNewSuccessState(this.tenantData);

  @override
  List<Object> get props => [tenantData];
}
