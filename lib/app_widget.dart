import 'package:boletos/modules/barcode_scanner/barcode_scanner_page.dart';
import 'package:boletos/modules/home/home_page.dart';
import 'package:boletos/modules/inser_boleto/insert_boleto_page.dart';
import 'package:boletos/modules/login/login.dart';
import 'package:boletos/modules/splash/splash_page.dart';
import 'package:boletos/shared/models/user_model.dart';
import 'package:boletos/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  AppWidget() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColors.background));
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GoBoletos',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          primaryColor: AppColors.primary,
        ),
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => SplashPage(),
          '/home': (context) => HomePage(
              user: ModalRoute.of(context)!.settings.arguments as UserModel),
          '/login': (context) => LoginPage(),
          '/barcode_scanner': (context) => BarcodeScannerPage(),
          '/insert_boleto': (context) => InsertBoletoPage(
              barcode: ModalRoute.of(context) != null
                  ? ModalRoute.of(context)!.settings.arguments.toString()
                  : null)
        });
  }
}
