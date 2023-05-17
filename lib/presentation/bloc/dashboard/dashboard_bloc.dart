import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oownee/data/models/dashboard_response_model.dart';
import 'package:oownee/data/services/api_connection.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<DashboardEvent>((event, emit) async {
      if (event is LoadDashboardEvent) {
        emit(DashboardLoadingState());
        Map<String, String> body = {"owner_id": event.uid};

        try {
          final response = await ApiConnection.GetDashBoardData(
            url: "https://app.oownee.com/api/dashboard",
            body: body,
          );

          emit(DashboardSuccessState(dashboardResponseModelFromJson(response)));
        } catch (e) {
          print("Error");
          emit(DashboardFailedState());
        }
      }
    });
  }
}
