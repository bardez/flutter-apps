import 'package:flutter/material.dart';
import 'package:youtube/app/app_module.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await DotEnv().load('.env');
  runApp(AppModule());
}