part of 'owner_view_bloc.dart';

abstract class OwnerViewState extends Equatable {
  const OwnerViewState();
}

class OwnerViewInitial extends OwnerViewState {
  @override
  List<Object> get props => [];
}

class OwnerLoadingState extends OwnerViewState {
  @override
  List<Object> get props => [];
}

class OwnerSuccessState extends OwnerViewState {
  final OwnerViewResponseModel ownerData;
  OwnerSuccessState(this.ownerData);

  @override
  List<Object> get props => [ownerData];
}

class OwnerFailedState extends OwnerViewState {
  final GlobalFailedResponseModel response;

  OwnerFailedState(this.response);

  @override
  List<Object> get props => [response];
}

class OwnerFailedUnexpectedState extends OwnerViewState {
  String msg;

  OwnerFailedUnexpectedState(this.msg);

  @override
  List<Object> get props => [msg];
}

class OwnerEditSuccessState extends OwnerViewState {
  final UploadResponseModel ownerData;
  OwnerEditSuccessState(this.ownerData);

  @override
  List<Object> get props => [ownerData];
}
