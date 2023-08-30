import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellbe/provider/DoctorUserProvider/doctor_user_provider.dart';
import 'package:wellbe/provider/JournalProvider/journal_provider.dart';
import 'package:wellbe/provider/MoodProvider/mood_provider.dart';
import 'package:wellbe/provider/PodcastsProvider/podcasts_provider.dart';
import 'package:wellbe/provider/ThoughtProvider/thought_provider.dart';
import 'package:wellbe/provider/audio_provider.dart';
import 'package:wellbe/provider/consult_provider.dart';
import 'package:wellbe/provider/keyboard_visibility_provider.dart';
import 'package:wellbe/provider/profile_provider.dart';
import 'package:wellbe/provider/ventout_provider.dart';
import 'package:wellbe/provider/video_player_provider.dart';
import 'package:wellbe/screens/Profile/profile_screen.dart';
import 'package:wellbe/screens/homepage/Consult/appointment.dart';
import 'package:wellbe/screens/homepage/Consult/doctor_appointment.dart';
import 'package:wellbe/screens/homepage/Consult/booking%20confirmed.dart';
import 'package:wellbe/screens/homepage/Consult/doctor_details.dart';
import 'package:wellbe/screens/homepage/Consult/payment_confirmation.dart';
import 'package:wellbe/screens/homepage/MIndFul/mindful_landing_screen.dart';
import 'provider/auth_provider.dart';
import 'provider/homepage_provider.dart';
import 'provider/insight_provider.dart';
import 'provider/meditation_provider.dart';
import 'provider/mindful_provider.dart';
import 'provider/theme/theme_provider.dart';
import 'di_container.dart' as di;
import 'screens/Splash/splash.dart';
import 'utilites/app_constant.dart';
import 'utilites/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => HomePageProvider()),
      ChangeNotifierProvider(create: (context) => InsightProvider()),
      ChangeNotifierProvider(create: (context) => MeditationProvider()),
      ChangeNotifierProvider(create: (context) => MoodSpaceProvider()),
      ChangeNotifierProvider(create: (context) => di.sl<AuthProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ThemeProvider>()),
      ChangeNotifierProvider(create: (context) => ConsultProvider()),
      ChangeNotifierProvider(create: (context) => VentoutProvider()),
      ChangeNotifierProvider(create: (context) => ProfileProvider()),
      ChangeNotifierProvider(create: (context) => di.sl<MoodProvider>()),
      ChangeNotifierProvider(create: (context) => VideoPlayerProvider()),
      ChangeNotifierProvider(create: (context) => KeyboardVisibilityProvider()),
      ChangeNotifierProvider(create: (context) => di.sl<DoctorUserProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<JournalProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<PodcastsProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ThoughtProvider>()),

      // ChangeNotifierProvider(create: (context) => AudioProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // List<Locale> _locals = [];
    // for (var language in AppConstant.languages) {
    //   _locals.add(Locale(language.languageCode, language.countryCode));
    // }

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white, // Color for Android
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness:
            Brightness.light, // Dark == white status bar -- for IOS.
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "WellBe",
      home: Splash(),
      // builder: EasyLoading.init(),
      theme: Provider.of<ThemeProvider>(context).darkTheme
          ? AppTheme.getDarkModeTheme()
          : AppTheme.getLightModeTheme(),
      // theme: ThemeData(
      //     appBarTheme: AppBarTheme(backgroundColor: whiteColor, iconTheme: IconThemeData(color: blackColor)),
      //     bottomAppBarColor: Colors.transparent,
      //     scaffoldBackgroundColor: scaffoldBackgroundColor,
      //     canvasColor: scaffoldBackgroundColor,
      //     primaryColor: kPrimaryColor,
      //     primarySwatch: primarySwatch,
      //     fontFamily: 'medium',
      //     splashColor: Colors.transparent,
      //     highlightColor: Colors.transparent,
      //     splashFactory: InkRipple.splashFactory,
      //     focusColor: Colors.transparent,
      //     dividerColor: Colors.transparent,
      //     colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kPrimaryColor)),
    );
  }
}

class ActiveTimerScreen extends StatefulWidget {
  const ActiveTimerScreen({super.key, required this.seconds});

  final int seconds;

  @override
  State<ActiveTimerScreen> createState() => _ActiveTimerScreenState();
}

class _ActiveTimerScreenState extends State<ActiveTimerScreen> {
  int _timeLeft = 0;
  bool timerStarted = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timeLeft = widget.seconds;

    /// Have timer start by default.
    timerStarted = true;
    toggleTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: double.infinity),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.3,
              ),
              child: Text(
                '${_timeLeft ~/ 60} : ${(_timeLeft % 60).toString().padLeft(2, '0')}',
                style: TextStyle(color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 80.0,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    if (timerStarted) {
                      timerStarted = false;
                      _timer?.cancel();
                    } else {
                      timerStarted = true;
                      toggleTimer();
                    }
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    !timerStarted ? Icons.play_arrow : Icons.pause,
                    size: 100,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(
                    color: Colors.white,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(24),
                    ),
                  ),
                ),
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void toggleTimer() {
    const oneSec = Duration(seconds: 1);
    _timer?.cancel();
    _timer = Timer.periodic(oneSec, (Timer t) {
      if (_timeLeft < 1) {
        t.cancel();
      } else {
        setState(() {
          _timeLeft = _timeLeft - 1;
        });
      }
    });
  }
}
