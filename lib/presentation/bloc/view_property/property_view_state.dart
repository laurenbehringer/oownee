part of 'property_view_bloc.dart';

abstract class PropertyViewState extends Equatable {
  const PropertyViewState();
}

class PropertyViewInitial extends PropertyViewState {
  @override
  List<Object> get props => [];
}

class PropertyViewSuccessState extends PropertyViewState {
  final PropertyViewResponseModel propertyData;
  PropertyViewSuccessState(this.propertyData);

  @override
  List<Object> get props => [propertyData];
}

class PropertyViewLoadState extends PropertyViewState {
  @override
  List<Object> get props => [];
}

class PropertyViewFailedState extends PropertyViewState {
  @override
  List<Object> get props => [];
}

class PropertyEditSuccessState extends PropertyViewState {
  final EditSuccessResponseModel tenantData;
  PropertyEditSuccessState(this.tenantData);

  @override
  List<Object> get props => [tenantData];
}
