import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:oownee/data/models/global_fail_response_model/globalfail_response_model.dart';
import 'package:oownee/data/models/login_response_model.dart';
import 'package:oownee/data/services/api_connection.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      if (event is LoadLoginEvent) {
        emit(LoginLoadingState());
        Map<String, String> body = {
          "email": event.email,
          "password": event.password
        };
        var response;
        try {
          response = await ApiConnection.GetLoginData(
            url: "https://app.oownee.com/api/login.php",
            body: body,
          );

          print("response $response");
          print("saved data ${loginResponseModelFromJson(response).data.id}");
          await prefs.setString(
              'userID', loginResponseModelFromJson(response).data.id);

          emit(LoginSuccessState(loginResponseModelFromJson(response)));
        } on DioError catch (e) {
          if (e.response != null) {
            // The server responded with an error status code (e.g. 400, 401, 403, etc.)
            print("First block");
            print(e.response!.data.toString());
            emit(LoginFailedState(
                globalFailedResponseModelFromJson(e.response!.data)));
            // emit(
            //     LoginFailedState(e.response.));
          } else {
            emit(LoginFailedUnexpectedState("Something went wrong"));
            // Something else went wrong (e.g. network connectivity issue)
            // return ApiResponse(success: false, errorMessage: e.toString());
          }
        } catch (error) {
          print("error here $error");
          print("response $response");
          emit(LoginFailedState(globalFailedResponseModelFromJson(response)));
        }
      }
    });
  }
}
