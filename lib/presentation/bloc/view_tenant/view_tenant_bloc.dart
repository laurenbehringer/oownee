import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:oownee/data/models/edit_success_response_model/edit_success_response_model.dart';
import 'package:oownee/data/models/tenant_view_model/tenant_view_response_model.dart';
import 'package:oownee/data/services/api_connection.dart';

import '../../../data/models/owner_view_model/owner_edit_response_model.dart';

part 'view_tenant_event.dart';
part 'view_tenant_state.dart';

class ViewTenantBloc extends Bloc<ViewTenantEvent, ViewTenantState> {
  ViewTenantBloc() : super(ViewTenantInitial()) {
    on<ViewTenantEvent>((event, emit) async {
      if (event is LoadTenantViewEvent) {
        emit(TenantViewLoadState());

        Map<String, String> body = {"tenant_id": event.tenantID};

        try {
          final response = await ApiConnection.GetDashBoardData(
            url: "https://app.oownee.com/api/tenet_view",
            body: body,
          );
          emit(TenantViewSuccessState(
              tenantViewResponseModelFromJson(response)));
        } catch (e) {
          print("Error");
          emit(TenantViewFailedState());
        }
      }

      if (event is LoadTenantEditEvent) {
        emit(TenantViewLoadState());

        /*print("body = ${event.tenantID}");
        print("body = ${event.name}");
        print("body = ${event.phone}");
        print("body = ${event.rentPrice}");
        print("body = ${event.startingDate}");
        print("body = ${event.propertyID}");
        print("body = ${event.email}");
        print("body = ${event.bankaccNo}");*/

        FormData body = FormData.fromMap({
          "tenant_name": event.name,
          "phone_number": event.phone,
          "tenant_rent": event.rentPrice,
          "tenant_birthdate": event.birthDate,
          // "tenant_doc": event.image,
          // "tenant_image": event.image,
          "tenant_country": event.tenantCountry,
          "date": event.startingDate,
          "property_id": event.propertyID,
          "tenant_email": event.email,
          "tenant_bank_acc_no": event.bankaccNo,
        });

        try {
          final response = await ApiConnection.PostFormData(
            url: "https://app.oownee.com/api/tenet_edit",
            body: body,
          );
          print(response);

          emit(TenantEditSuccessState(
              editSuccessResponseModelFromJson(response)));
        } catch (e) {
          print("Error");
          emit(TenantViewFailedState());
        }
      }
    });
  }
}
