part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();
}

class DashboardInitial extends DashboardState {
  @override
  List<Object> get props => [];
}

class DashboardLoadingState extends DashboardState {
  @override
  List<Object> get props => [];
}

class DashboardSuccessState extends DashboardState {
  final DashboardResponseModel dashboardData;
  DashboardSuccessState(this.dashboardData);

  @override
  List<Object> get props => [dashboardData];
}

class DashboardFailedState extends DashboardState {
  @override
  List<Object> get props => [];
}
