import 'package:newp/ablelyf.dart';

class NextPage extends StatelessWidget {
  final String title;
  const NextPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        print('DIDPOP: ${didPop}');
        if (didPop) {
          return;
        }
        Get.to(() => const Page1());
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
            ),
          ),
        ),
      ),
    );
  }
}
