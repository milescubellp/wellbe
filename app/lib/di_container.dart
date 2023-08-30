import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellbe/provider/DoctorUserProvider/doctor_user_provider.dart';
import 'package:wellbe/provider/JournalProvider/journal_provider.dart';
import 'package:wellbe/provider/MoodProvider/mood_provider.dart';
import 'package:wellbe/provider/PodcastsProvider/podcasts_provider.dart';
import 'package:wellbe/provider/ThoughtProvider/thought_provider.dart';
import 'package:wellbe/repo/doctor_user_repo.dart';
import 'package:wellbe/repo/journal_repo.dart';
import 'package:wellbe/repo/mood_repo.dart';
import 'package:wellbe/repo/podcasts_repo.dart';
import 'package:wellbe/repo/thought_repo.dart';
import 'datasource/remote/dio/dio_client.dart';
import 'datasource/remote/dio/logging_interceptor.dart';
import 'provider/auth_provider.dart';
import 'provider/theme/theme_provider.dart';
import 'repo/auth_repo.dart';
import 'utilites/app_constant.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  //sl.registerLazySingleton(() => NetworkInfo(sl()));
  sl.registerLazySingleton(() => DioClient(AppConstant.baseUrl, sl(),
      loggingInterceptor: sl(), sharedPreferences: sl()));

  // Repository
  sl.registerLazySingleton(
      () => AuthRepo(dioClient: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(() => MoodRepo(dioClient: sl()));
  sl.registerLazySingleton(() => DoctorUserRepo(dioClient: sl()));
  sl.registerLazySingleton(() => JournalRepo(dioClient: sl()));
  sl.registerLazySingleton(() => PodcastsRepo(dioClient: sl()));
  sl.registerLazySingleton(() => ThoughtRepo(dioClient: sl()));

  // Provider
  sl.registerFactory(() => AuthProvider(authRepo: sl()));
  sl.registerFactory(() => MoodProvider(moodRepo: sl()));
  sl.registerFactory(() => ThemeProvider(sharedPreferences: sl()));
  sl.registerFactory(() => DoctorUserProvider(doctorUserRepo: sl()));
  sl.registerFactory(() => JournalProvider(journalRepo: sl()));
  sl.registerFactory(() => PodcastsProvider(podcastsRepo: sl()));
  sl.registerFactory(() => ThoughtProvider(thoughtRepo: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
}
