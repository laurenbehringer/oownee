part of 'view_tenant_bloc.dart';

abstract class ViewTenantState extends Equatable {
  const ViewTenantState();
}

class ViewTenantInitial extends ViewTenantState {
  @override
  List<Object> get props => [];
}

class TenantViewSuccessState extends ViewTenantState {
  final TenantViewResponseModel tenantData;
  TenantViewSuccessState(this.tenantData);

  @override
  List<Object> get props => [tenantData];
}

class TenantViewLoadState extends ViewTenantState {
  @override
  List<Object> get props => [];
}

class TenantViewFailedState extends ViewTenantState {
  @override
  List<Object> get props => [];
}

class TenantEditSuccessState extends ViewTenantState {
  final EditSuccessResponseModel tenantData;
  TenantEditSuccessState(this.tenantData);

  @override
  List<Object> get props => [tenantData];
}
