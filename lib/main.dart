import 'dart:async';

import 'ablelyf.dart';
import 'firebase_options.dart';

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    constants = Constants();

    await constants.init();

    await Firebase.initializeApp(options: DefaultFirebaseOptions.android);

    // Pass all uncaught errors from the framework to Crashlytics.
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

    runApp(const MyApp());
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        constants.screenHeight = constrains.maxHeight;
        constants.screenWidth = constrains.maxWidth;
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'AbleLyf',
          theme: ThemeData(
            primaryColor: constants.themeColor,
            appBarTheme: AppBarTheme(
              color: constants.themeColor,
              titleTextStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
            ),
            radioTheme: RadioThemeData(
              fillColor: MaterialStatePropertyAll(constants.themeColor),
              overlayColor: MaterialStatePropertyAll(constants.themeColor),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                elevation: const MaterialStatePropertyAll(0),
                shadowColor: const MaterialStatePropertyAll(Colors.transparent),
                backgroundColor: MaterialStatePropertyAll(constants.themeColor),
                foregroundColor: MaterialStatePropertyAll(constants.secondary),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            progressIndicatorTheme:
                ProgressIndicatorThemeData(color: constants.themeColor),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: constants.secondary,
                foregroundColor: constants.themeColor),
            scaffoldBackgroundColor: Colors.white,
            colorScheme: ColorScheme.fromSeed(seedColor: constants.themeColor),
            useMaterial3: true,
          ),
          home: const ModuleSelect(),
        );
      },
    );
  }
}

extension ScreenUtil on num {
  double get sh => constants.screenHeight * this;
  double get sw => constants.screenWidth * this;
}
