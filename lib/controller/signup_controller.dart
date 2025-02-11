import 'package:aakscience_test/api_service/api_endpoints.dart';
import 'package:aakscience_test/api_service/http_client.dart';
import 'package:aakscience_test/models/signup_model.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../api_service/api_service.dart';

class SignupController extends GetxController {
  RxBool isLoading  = false.obs;
  RxString selectedValue = "researcher".obs;
  RxString selectedCountry = "United States".obs;
  final apiClient = ApiService(Dio());
  var signupModel = SignupModel().obs;
  List<String> dropDownList = ["researcher", "investor", "institution_staff" , "service_provider"].obs;

  Future<bool> register({required SignupModel signupModel})async {
    isLoading.value = true;
    try{
      var request = HttpRequest(
          endpoint: ApiEndpoint.signUp.url, method: 'POST', data: signupModel.toJson());
      var response = await apiClient.makeRequest(request);
      if (kDebugMode) {
        print("response::${response.data.toString()}");
      }
      if(response != null){
        if(response.statusCode == 200){
         this.signupModel.value = SignupModel.fromJson(response.data);
          return true;
        }else{

          Get.rawSnackbar(
              message: 'signup_screen.error_message'.tr(),
              backgroundColor: Colors.red,
              snackPosition: SnackPosition.TOP);
          return false;
        }
      }
      return false;
    }catch(e){
      if (kDebugMode) {
        print("register error::${e.toString()}");
      }
      Get.rawSnackbar(
          message: '$e',
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.TOP);
      rethrow;
    }finally{
      isLoading.value = false;
    }
  }

}