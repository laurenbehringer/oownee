import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
        } catch (error) {
          print("error here $error");
          print("response $response");
          // emit(LoginSuccessState(loginResponseModelFromJson(response)));
        }
      }
    });
  }
}
