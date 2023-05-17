import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:oownee/data/models/edit_success_response_model/edit_success_response_model.dart';
import 'package:oownee/data/models/edit_success_response_model/temp_model.dart';
import 'package:oownee/data/models/property_view_model/property_view_response_model.dart';
import 'package:oownee/data/services/api_connection.dart';

part 'property_view_event.dart';
part 'property_view_state.dart';

class PropertyViewBloc extends Bloc<PropertyViewEvent, PropertyViewState> {
  PropertyViewBloc() : super(PropertyViewInitial()) {
    on<PropertyViewEvent>((event, emit) async {
      if (event is LoadPropertyViewEvent) {
        emit(PropertyViewLoadState());

        Map<String, String> body = {"property_id": event.propertyID};

        try {
          final response = await ApiConnection.GetDashBoardData(
            url: "https://app.oownee.com/api/property_view",
            body: body,
          );
          emit(PropertyViewSuccessState(
              propertyViewResponseModelFromJson(response)));
        } catch (e) {
          print("Error");
          emit(PropertyViewFailedState());
        }
      }

      if (event is LoadPropertyEditEvent) {
        emit(PropertyViewLoadState());

        print("propertyid ${event.property_id}");
        print("imagebase64 ${event.image.toString()}");

        // FormData body = FormData.fromMap({
        //   "property_id": event.property_id,
        //   // "property_name": event.property_name,
        //   // // "number_of_tenants": event.property_name,
        //   // "property_type": event.property_type,
        //   // "property_address": event.property_address,
        //   // "monthly_rent": event.monthly_rent,
        //   "property_image": event.image,
        // });

        var body = {
          'property_id': event.property_id,
          'property_image': event.image,
        };

        try {
          final response = await ApiConnection.PostFormDataImage(
            url: "https://app.oownee.com/api/upload_property_image.php",
            body: body,
          );
          print(response);

          emit(PropertyEditSuccessState(uploadResponseModelFromJson(response)));
        } catch (e) {
          print("Error BRUH");
          emit(PropertyViewFailedState());
        }
      }
    });
  }
}
