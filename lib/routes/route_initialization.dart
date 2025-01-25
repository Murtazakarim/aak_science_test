import 'package:aakscience_test/routes/routes_names.dart';
import 'package:aakscience_test/view/sigup_screen/signup_screen.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> getPages = [
  GetPage(name: AppRoutes.signup, page: ()=>SignupScreen()),
];