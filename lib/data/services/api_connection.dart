import 'package:dio/dio.dart';

abstract class ApiConnection {
  static PostCall({String? url, Map<String, String>? body}) async {
    var response = await Dio().post(url!,
        data: body!,
        options: Options(contentType: Headers.formUrlEncodedContentType));

    return response.data;
  }

  static GetLoginData({String? url, Map<String, String>? body}) async {
    print("enter GetLoginData");
    var response = await Dio().post(url!,
        data: body!,
        options: Options(contentType: Headers.formUrlEncodedContentType));
    print("end GetLoginData");
    return response.data;
  }

  static GetDashBoardData({String? url, Map<String, String>? body}) async {
    print("enter GetDashBoardData");
    var response = await Dio().post(url!,
        data: body!,
        options: Options(contentType: Headers.formUrlEncodedContentType));
    print("end GetDashboardData");
    return response.data;
  }

  static GetPropertyData({String? url, Map<String, String>? body}) async {
    print("enter GetPropertyData");
    var response = await Dio().post(url!,
        data: body!,
        options: Options(contentType: Headers.formUrlEncodedContentType));
    print("end GetPropertyData");
    return response.data;
  }

  static GetTenantData({String? url, Map<String, String>? body}) async {
    print("enter GetPropertyData");
    var response = await Dio().post(url!,
        data: body!,
        options: Options(contentType: Headers.formUrlEncodedContentType));
    print("end GetPropertyData");
    return response.data;
  }

  static PostFormData({String? url, FormData? body}) async {
    print("Start PostForm Data");
    var response = await Dio().post(url!,
        data: body!,
        options: Options(headers: {
          "Content-Type": "multipart/form-data",
          'Accept': '*/*',
        }));
    print("End PostFormData");

    return response.data;
  }
}
