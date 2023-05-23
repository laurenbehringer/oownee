import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oownee/data/models/edit_success_response_model/edit_success_response_model.dart';
import 'package:oownee/data/models/global_fail_response_model/globalfail_response_model.dart';
import 'package:oownee/data/models/tenant_view_model/tenant_view_response_model.dart';
import 'package:oownee/data/services/api_connection.dart';
import 'package:oownee/presentation/bloc/add_new_property_tenant/add_new_bloc.dart';

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

        // print("Image : ${event.image.path}");
        // print("Image : ${event.image.name}");
        print("XDDDDD ${event.propertyID}");
        print("base64 ${event.image}");

        // FormData body = FormData.fromMap({
        //   "tenant_id": event.tenantID,
        //   "tenant_name": event.name,
        //   "phone_number": event.phone,
        //   "tenant_rent": event.rentPrice,
        //   // "tenant_birthdate": event.birthDate,
        //   // "tenant_doc": event.image,
        //   // "tenant_image": await MultipartFile.fromFile(
        //   //   event.image.path,
        //   //   // filename: event.image.name,
        //   // ),
        //   // "tenant_country": event.tenantCountry,
        //   "date": event.startingDate,
        //   "property_id": event.propertyID,
        //   "tenant_email": event.email,
        //   "tenant_bank_acc_no": event.bankaccNo,
        // });

        Map<String, String> body = {
          "tenant_id": event.tenantID,
          "tenant_name": event.name,
          "phone_number": event.phone,
          "tenant_rent": event.rentPrice,
          "tenant_birthdate": event.birthDate,
          "property_id": event.propertyID,
          "tenant_country": event.tenantCountry,
          "date": event.startingDate,
          "tenant_email": event.email,
          "tenant_bank_acc_no": event.bankaccNo,
          "tenant_image": event.image,
          // "tenant_doc": event.
        };

        try {
          final response = await ApiConnection.PostDataImage(
            url: "https://app.oownee.com/api/tenet_edit",
            body: body,
          );
          print(response);

          emit(TenantEditSuccessState(
              editSuccessResponseModelFromJson(response)));
        } on DioError catch (e) {
          if (e.response != null) {
            // print("first block ${e.response!.statusCode}");
            // The server responded with an error status code (e.g. 400, 401, 403, etc.)
            // return ApiResponse(
            //     success: false, errorMessage: e.response.data.toString());
            print("First block");
            print(e.response!.data.toString());
            emit(TenantEditFailedState());
          } else {
            print("second block ${e.response!.data}");
            // Something else went wrong (e.g. network connectivity issue)
            // return ApiResponse(success: false, errorMessage: e.toString());
          }
        } catch (e) {
          print(e.toString());
        }
      }
    });
  }
}
