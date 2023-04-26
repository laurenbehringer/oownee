part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();
}

class LoadDashboardEvent extends DashboardEvent {
  final String uid;

  LoadDashboardEvent({required this.uid});

  @override
  List<Object?> get props => [uid];
}
