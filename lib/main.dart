import 'package:aakscience_test/appStyle/theme_data.dart';
import 'package:aakscience_test/routes/route_initialization.dart';
import 'package:aakscience_test/translations/tr_settings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'view/sigup_screen/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('en'),
      ],
      path: '_', // You can replace `_` with 'assets/translations' if preferred
      assetLoader: MapAssetLoader(), // Use your custom asset loader
      fallbackLocale: const Locale('en', 'US'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Test',
      getPages: getPages,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: KAppStyle.primaryColor),
        fontFamily: KAppStyle.fontFamily,
        useMaterial3: true,
      ),
      home: SignupScreen(),
    );
  }
}
