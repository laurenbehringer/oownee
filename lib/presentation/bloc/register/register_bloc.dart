import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:oownee/data/models/global_fail_response_model/globalfail_response_model.dart';
import 'package:oownee/data/models/register/register_success_response_model.dart';
import 'package:oownee/data/services/api_connection.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) async {
      if (event is LoadRegisterEvent) {
        emit(RegisterLoadingState());

        FormData body = FormData.fromMap({
          "full_name": event.name,
          "email": event.email,
          "country": event.country,
          "address": event.address,
          "phone_number": event.phone,
          "password": event.password,
        });

        var response;

        try {
          response = await ApiConnection.PostFormData(
            url: "https://app.oownee.com/api/owner_register",
            body: body,
          );
          print(response);

          emit(RegisterSuccessState(registerResponseModelFromJson(response)));
        } on DioError catch (e) {
          if (e.response != null) {
            // The server responded with an error status code (e.g. 400, 401, 403, etc.)
            print("First block");
            print(e.response!.data.toString());
            emit(RegisterFailedState(
                globalFailedResponseModelFromJson(e.response!.data)));
          } else {
            emit(RegisterFailedUnexpectedState("Something went wrong"));
            // Something else went wrong (e.g. network connectivity issue)
            // return ApiResponse(success: false, errorMessage: e.toString());
          }
        } catch (e) {
          print("Error BRUH");
          emit(
              RegisterFailedState(globalFailedResponseModelFromJson(response)));
        }
      }
    });
  }
}
