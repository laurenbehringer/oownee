import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:oownee/data/models/add_new_response_model/add_property_response_model.dart';
import 'package:oownee/data/models/edit_success_response_model/edit_success_response_model.dart';
import 'package:oownee/data/models/global_fail_response_model/globalfail_response_model.dart';
import 'package:oownee/data/services/api_connection.dart';

part 'add_new_event.dart';
part 'add_new_state.dart';

class AddNewBloc extends Bloc<AddNewEvent, AddNewState> {
  AddNewBloc() : super(AddNewInitial()) {
    on<AddNewEvent>((event, emit) async {
      if (event is LoadAddNewTenantEvent) {
        emit(AddNewLoadState());

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

        var response;

        try {
          final response = await ApiConnection.PostFormData(
            url: "https://app.oownee.com/api/tenet_register",
            body: body,
          );

          emit(AddNewSuccessState(editSuccessResponseModelFromJson(response)));
          print("LMAFO");
        } on DioError catch (e) {
          if (e.response != null) {
            // The server responded with an error status code (e.g. 400, 401, 403, etc.)
            print("First block");
            print(e.response!.data.toString());
            emit(AddNewFailedState(
                globalFailedResponseModelFromJson(e.response!.data)));
          } else {
            emit(AddNewFailedUnexpectedState("Something went wrong"));
            // Something else went wrong (e.g. network connectivity issue)
            // return ApiResponse(success: false, errorMessage: e.toString());
          }
        } catch (e) {
          print("Error BRUH");
          emit(AddNewFailedState(globalFailedResponseModelFromJson(response)));
        }
      }

      if (event is LoadAddNewPropertyEvent) {
        emit(AddNewLoadState());

        FormData body = FormData.fromMap({
          "property_name": event.propertyName,
          "number_of_tenants": event.numberofTenants,
          "property_type": event.propertyType,
          "monthly_rent": event.monthlyRent,
          "maintenance_charge": event.maintenance_charge,
          "address": event.address,
          "user_id": event.userId,
        });

        var response;

        try {
          response = await ApiConnection.PostFormData(
            url: "https://app.oownee.com/api/property_register",
            body: body,
          );

          emit(AddPropertySuccessState(
              addPropertyResponseModelFromJson(response)));
          print("ok boo");
        } on DioError catch (e) {
          if (e.response != null) {
            // The server responded with an error status code (e.g. 400, 401, 403, etc.)
            print("First block");
            print(e.response!.data.toString());
            emit(AddNewFailedState(
                globalFailedResponseModelFromJson(e.response!.data)));
          } else {
            emit(AddNewFailedUnexpectedState("Something went wrong"));
            // Something else went wrong (e.g. network connectivity issue)
            // return ApiResponse(success: false, errorMessage: e.toString());
          }
        } catch (e) {
          print("Error BRUH");
          emit(AddNewFailedState(globalFailedResponseModelFromJson(response)));
        }
      }

      if (event is LoadUploadPropertyImgEvent) {
        var body = {
          'property_id': event.propertyId,
          'property_image': event.propertyImg,
          'property_doc': event.propertyDoc,
        };

        var response;

        try {
          response = await ApiConnection.PostDataImage(
            url: "https://app.oownee.com/api/upload_property_image",
            body: body,
          );

          emit(AddPropertyImageSuccessState(
              editSuccessResponseModelFromJson(response)));
          print("ok boo");
        } on DioError catch (e) {
          if (e.response != null) {
            // The server responded with an error status code (e.g. 400, 401, 403, etc.)
            print("First block");
            print(e.response!.data.toString());
            emit(AddNewFailedState(
                globalFailedResponseModelFromJson(e.response!.data)));
          } else {
            emit(AddNewFailedUnexpectedState("Something went wrong"));
            // Something else went wrong (e.g. network connectivity issue)
            // return ApiResponse(success: false, errorMessage: e.toString());
          }
        } catch (e) {
          print("Error BRUH");
          emit(AddNewFailedState(globalFailedResponseModelFromJson(response)));
        }
      }
    });
  }
}
