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
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'AbleLyf',
          theme: ThemeData(
            primaryColor: constants.themeColor,
            appBarTheme: AppBarTheme(
              color: constants.themeColor,
              titleTextStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Colors.white,
                ),
              ),
            ),
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
