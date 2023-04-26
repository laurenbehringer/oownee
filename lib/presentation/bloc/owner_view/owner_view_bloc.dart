import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
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

        try {
          final response = await ApiConnection.GetDashBoardData(
            url: "https://app.oownee.com/api/owner_view",
            body: body,
          );

          emit(OwnerSuccessState(ownerViewResponseModelFromJson(response)));
        } catch (e) {
          print("Error");
          emit(OwnerFailedState());
        }
      }

      if (event is LoadOwnerEditEvent) {
        emit(OwnerLoadingState());

        // print(event.image);

        FormData body = FormData.fromMap({
          "owner_id": event.ownerId,
          "name": event.name,
          "country": event.country,
          "email": event.email,
          "phone_number": event.phoneNum,
          "address": event.address,
          // "owner_image": event.image,
        });

        print(body);

        try {
          final response = await ApiConnection.PostFormData(
            url: "https://app.oownee.com/api/owner_edit",
            body: body,
          );
          print(response);

          emit(OwnerEditSuccessState(ownerEditResponseModelFromJson(response)));
        } catch (e) {
          print("Error");
          emit(OwnerFailedState());
        }
      }
    });
  }
}
