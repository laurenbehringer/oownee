import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

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
        }));
    print("End PostFormData");

    return response.data;
  }

  static Future<void> uploadImage({
    required String tenantID,
    required String tenantName,
    required String phone_number,
    required String tenant_rent,
    required String tenant_birthdate,
    required XFile tenant_image,
    required String property_id,
    required String tenant_email,
    required String tenant_bank_acc_no,
  }) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://app.oownee.com/api/tenet_edit'));
    request.fields['tenant_id'] = tenantID;
    request.fields['tenant_name'] = tenantName;
    request.fields['phone_number'] = phone_number;
    request.fields['tenant_rent'] = tenant_rent;
    request.fields['tenant_birthdate'] = tenant_birthdate;
    request.fields['property_id'] = property_id;
    request.fields['tenant_email'] = tenant_email;
    request.fields['tenant_bank_acc_no'] = tenant_bank_acc_no;

    request.files.add(
        await http.MultipartFile.fromPath('tenant_image', tenant_image.path));
    var response = await request.send();
    String responseString =
        await response.stream.transform(utf8.decoder).join();
    print("spacer");
    print(responseString);
    print("finished");
    // handle response as needed
  }
}
