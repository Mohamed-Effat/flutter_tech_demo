import 'dart:io';

import 'package:flutter/material.dart';

import 'src/app.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(App());
}

//this forces flutter to allow bad servers Certificates
//this is required to be able to get the trainer's image
//https://skillzycp.com/upload/trainer/389_BaseImage_636896408382239890.jpg
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}