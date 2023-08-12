import 'ablelyf.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  constants = Constants();

  await constants.init();

  runApp(const MyApp());
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
