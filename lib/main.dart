import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testovy_zadanie4/core/service/app_data.dart';
import 'package:testovy_zadanie4/core/service/shared_preference.dart';
import 'package:testovy_zadanie4/feature/app/main_route_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  appData.accessToken = SharedPrefsRawProvider(prefs).getString(SharedKeyWords.accessToken) ?? '';

  runApp(MainRouteApp());
}
