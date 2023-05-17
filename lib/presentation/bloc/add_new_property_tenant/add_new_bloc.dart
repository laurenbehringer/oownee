import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:oownee/data/models/edit_success_response_model/edit_success_response_model.dart';
import 'package:oownee/data/services/api_connection.dart';

part 'add_new_event.dart';
part 'add_new_state.dart';

class AddNewBloc extends Bloc<AddNewEvent, AddNewState> {
  AddNewBloc() : super(AddNewInitial()) {
    on<AddNewEvent>((event, emit) async {
      if (event is LoadAddNewTenantEvent) {
        emit(AddNewLoadState());

        print("body = ${event.propertyID}");
        print("body = ${event.name}");
        print("body = ${event.phone}");
        print("body = ${event.rentPrice}");
        print("body = ${event.birthDate}");
        print("body = ${event.propertyID}");
        print("body = ${event.email}");
        print("body = ${event.bankaccNo}");

        FormData body = FormData.fromMap({
          "property_id": event.propertyID,
          "tenant_name": event.name,
          "phone_number": event.phone,
          "tenant_rent": event.rentPrice,
          "tenant_birthdate": event.birthDate,
          // "tenant_doc": event.image,
          // "tenant_image": event.image,
          "date": event.birthDate,
          "tenant_email": event.email,
          "tenant_bank_acc_no": event.bankaccNo,
        });

        try {
          final response = await ApiConnection.PostFormData(
            url: "https://app.oownee.com/api/tenet_register",
            body: body,
          );

          emit(AddNewSuccessState(editSuccessResponseModelFromJson(response)));
          print("LMAFO");
        } on DioError catch (e) {
          if (e.response != null) {
            print("First block");
            print(e.response!.data.toString());
            emit(AddNewFailedState());
          } else {
            print("second block ${e.response!.data}");
            // Something else went wrong (e.g. network connectivity issue)
            // return ApiResponse(success: false, errorMessage: e.toString());
          }
        } catch (e) {
          print(e.toString());
          emit(AddNewFailedState());
        }
      }

      if (event is LoadAddNewPropertyEvent) {
        emit(AddNewLoadState());

        FormData body = FormData.fromMap({
          "property_name": event.propertyName,
          "number_of_tenants": event.numberofTenants,
          "property_type": event.propertyType,
          "monthly_rent": event.monthlyRent,
          // "maintenance_charge": event.,
          // "tenant_doc": event.image,
          // "tenant_image": event.image,
          // "date": event.birthDate,
          // "tenant_email": event.email,
          // "tenant_bank_acc_no": event.bankaccNo,
        });

        try {
          final response = await ApiConnection.PostFormData(
            url: "https://app.oownee.com/api/property_update",
            body: body,
          );

          emit(AddNewSuccessState(editSuccessResponseModelFromJson(response)));
          print("ok boo");
        } on DioError catch (e) {
          if (e.response != null) {
            print("First block");
            print(e.response!.data.toString());
            emit(AddNewFailedState());
          } else {
            print("second block ${e.response!.data}");
            // Something else went wrong (e.g. network connectivity issue)
            // return ApiResponse(success: false, errorMessage: e.toString());
          }
        } catch (e) {
          print(e.toString());
          emit(AddNewFailedState());
        }
      }
    });
  }
}
