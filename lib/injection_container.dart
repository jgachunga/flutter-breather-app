import 'package:dio/dio.dart';
import 'package:flutter_demo_app/breath_list/data/datasources/breath_data_source.dart';
import 'package:flutter_demo_app/breath_list/repo/breath_service.dart';
import 'package:flutter_demo_app/breath_list/view_models/breath_view_model.dart';
import 'package:flutter_demo_app/core/services/api_service.dart';
import 'package:flutter_demo_app/database/db_helper_dynamic.dart';
import 'package:flutter_demo_app/helpers/breath_session_state_updater.dart';

import 'core/network/network_info.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:get_it/get_it.dart';

// service locator
final sl = GetIt.instance;

Future<void> init() async {
  //! Features - NumberTrivia
  sl.registerFactory<BreathHistoryViewModel>(
      () => BreathHistoryViewModel(breathService: sl(), breathSessionStateUpdater: sl() ));

  // service
  sl.registerLazySingleton(
      () => BreathService(breathDataSource: sl()));
  sl.registerLazySingleton(
          () => BreathSessionStateUpdater());

  // Data sources
  sl.registerLazySingleton<BreathDataSource>(
          () => BreathLocalDataSource(dbHelper: sl()));

  //DB helper
  sl.registerLazySingleton(() => DatabaseHelper());
  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => ApiService(dio: sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio);
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
