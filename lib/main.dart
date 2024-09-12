import 'dart:async';
import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:taks_daily_app/app.dart';
import 'package:taks_daily_app/firebase_options.dart';
import 'package:taks_daily_app/src/db/db_config.dart';
import 'package:taks_daily_app/src/injection.dart' as di;

late List<CameraDescription> cameras;
FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.configureDependencies();
  final databaseHelper = DatabaseHelper();
  await databaseHelper.database;
  cameras = await availableCameras();
  log(cameras.toString());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDateFormatting('es_ES');
  runApp(const App());
}
