import 'package:aakscience_test/appStyle/theme_data.dart';
import 'package:aakscience_test/controller/signup_controller.dart';
import 'package:aakscience_test/models/signup_model.dart';
import 'package:aakscience_test/utils/validation.dart';
import 'package:aakscience_test/widgets/button_widget.dart';
import 'package:aakscience_test/widgets/text_form_field_widget.dart';
import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  SignupController controller = Get.put(SignupController());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KAppStyle.primaryColor,
        centerTitle: true,
        title: Text(
          'signup_screen.signup_form'.tr(),
          style: KAppStyle.ksize14text.copyWith(fontSize: 24),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      backgroundColor: KAppStyle.primaryColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Obx(
                ()=> Column(
                  spacing: 16,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.teal),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          items: controller.dropDownList
                              .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: KAppStyle.ksize14text
                                        .copyWith(color: Colors.white,fontSize: 16),
                                  )))
                              .toList(),
                          value: controller.selectedValue.value,
                          borderRadius: BorderRadius.circular(10),
                          isDense: true,
                          elevation: 2,
                          iconEnabledColor: Colors.white,
                          padding: EdgeInsets.all(12),
                          dropdownColor: Colors.teal,
                          onChanged: (value) {
                            controller.selectedValue.value = value!;
                          },
                        ),
                      ),
                    ),
                    TextFormFieldWidget(
                      label: 'signup_screen.first_name'.tr(),
                      controller: firstNameController,
                      icon: Icon(Icons.account_circle_sharp,
                          color: KAppStyle.blackColor),
                      validator: FormValidation.validateName,
                      onChange: (text) {},
                    ),
                    TextFormFieldWidget(
                      label: 'signup_screen.last_name'.tr(),
                      controller: lastNameController,
                      icon: Icon(Icons.account_circle_sharp,
                          color: KAppStyle.blackColor),
                      validator: FormValidation.validateLastName,
                      onChange: (text) {},
                    ),
                    TextFormFieldWidget(
                      label: 'signup_screen.username'.tr(),
                      controller: userNameController,
                      icon:
                          Icon(Icons.verified_user, color: KAppStyle.blackColor),
                      validator: FormValidation.validateUsername,
                      onChange: (text) {},
                    ),
                    TextFormFieldWidget(
                      label: 'signup_screen.email'.tr(),
                      controller: emailController,
                      icon: Icon(Icons.email, color: KAppStyle.blackColor),
                      validator: FormValidation.validateEmail,
                      onChange: (text) {},
                    ),
                    TextFormFieldWidget(
                      label: 'signup_screen.password'.tr(),
                      controller: passwordController,
                      isObscureText: true,
                      icon: Icon(Icons.lock, color: KAppStyle.blackColor),
                      validator: (value) =>
                          FormValidation.validatePassword(value),
                      onChange: (text) {},
                    ),
                    ButtonWidget(
                      minWidth: Get.width / 2,
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          useSafeArea: true,
                          showWorldWide: true,

                          showSearch: true,
                          searchAutofocus: true,
                          onSelect: (Country country) {
                            if (kDebugMode) {
                              print('Select country: ${country.name}');
                            }
                            controller.selectedCountry.value = country.name;
                          },
                        );
                      }, text: Text(
                      controller.selectedCountry.value,
                      style:
                      KAppStyle.ksize14text.copyWith(color: Colors.white),
                    ),

                    ),
                    ButtonWidget(
                      minWidth: Get.width / 2,
                      onTap: () {

                        if (formKey.currentState!.validate()) {
                          SignupModel signupModel = SignupModel(
                            userType: controller.selectedValue.value,
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            username: userNameController.text,
                            email: emailController.text,
                            country: controller.selectedCountry.value,
                            password: passwordController.text,
                          );
                          controller.register(signupModel: signupModel).then((value){
                            if(value){
                              Get.dialog(
                                  AlertDialog(
                                    title: Text('signup_screen.alert_title'.tr()),
                                    content: Text(controller.signupModel.value.message.toString()),
                                    actions: [
                                      OutlinedButton(
                                          onPressed: () => Get.back(), child: Text('signup_screen.alert_ok'.tr(),style: KAppStyle.ksize14text.copyWith(fontSize: 16),),),
                                    ],
                                  ));
                            }
                          });
                        }
                      },
                      text:controller.isLoading.value
                          ? CircularProgressIndicator(
                        color: KAppStyle.backgroundColor,
                      )
                          : Text(
                        "signup_screen.submit".tr(),
                        style: KAppStyle.ksize14text
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    countryController.dispose();
    passwordController.dispose();
  }
}
