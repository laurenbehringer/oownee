import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oownee/data/models/edit_success_response_model/edit_success_response_model.dart';
import 'package:oownee/data/models/edit_success_response_model/temp_model.dart';
import 'package:oownee/data/models/global_fail_response_model/globalfail_response_model.dart';
import 'package:oownee/data/models/owner_view_model/owner_edit_response_model.dart';
import 'package:oownee/data/models/owner_view_model/owner_view_response_model.dart';
import 'package:oownee/data/models/owner_view_model/owner_view_response_model.dart';
import 'package:oownee/data/services/api_connection.dart';

part 'owner_view_event.dart';
part 'owner_view_state.dart';

class OwnerViewBloc extends Bloc<OwnerViewEvent, OwnerViewState> {
  OwnerViewBloc() : super(OwnerViewInitial()) {
    on<OwnerViewEvent>((event, emit) async {
      if (event is LoadOwnerEvent) {
        emit(OwnerLoadingState());

        Map<String, String> body = {"owner_id": event.ownerID};

        var response;
        try {
          response = await ApiConnection.GetDashBoardData(
            url: "https://app.oownee.com/api/owner_view",
            body: body,
          );

          emit(OwnerSuccessState(ownerViewResponseModelFromJson(response)));
        } catch (e) {
          print("Error");
          emit(OwnerFailedState(response));
        }
      }

      if (event is LoadOwnerEditEvent) {
        print("lgsw vs lakers");

        emit(OwnerLoadingState());
        Map<String, String> body;

        if (event.image != "") {
          body = {
            "owner_id": event.ownerId,
            "name": event.name,
            "country": event.country,
            "email": event.email,
            "phone_number": event.phoneNum,
            "address": event.address,
            // "owner_doc": eve
            "owner_image": event.image
          };
        } else {
          body = {
            "owner_id": event.ownerId,
            "name": event.name,
            "country": event.country,
            "email": event.email,
            "phone_number": event.phoneNum,
            "address": event.address,
          };
        }

        print("body here = $body");

        var response;

        try {
          response = await ApiConnection.PostDataImage(
            url: "https://app.oownee.com/api/owner_edit",
            body: body,
          );
          print(response);

          emit(OwnerEditSuccessState(uploadResponseModelFromJson(response)));
        } on DioError catch (e) {
          if (e.response != null) {
            // The server responded with an error status code (e.g. 400, 401, 403, etc.)
            print("First block");
            print(e.response!.data.toString());
            emit(OwnerFailedState(
                globalFailedResponseModelFromJson(e.response!.data)));
          } else {
            emit(OwnerFailedUnexpectedState("Something went wrong"));
            // Something else went wrong (e.g. network connectivity issue)
            // return ApiResponse(success: false, errorMessage: e.toString());
          }
        } catch (e) {
          print("Error BRUH");
          emit(OwnerFailedState(globalFailedResponseModelFromJson(response)));
        }
      }
    });
  }
}
