import '../../../ablelyf.dart';

class TalkCameraScreen extends StatefulWidget {
  const TalkCameraScreen({super.key});

  @override
  State<TalkCameraScreen> createState() => _TalkCameraScreenState();
}

class _TalkCameraScreenState extends State<TalkCameraScreen> {
  bool index = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const TalkFindScreen());
        },
        child: const Icon(Icons.search),
      ),
      body: SafeArea(
        child: InkWell(
          onTap: () {
            setState(() {
              index = !index;
            });
          },
          child: Image.asset(
            index ? Images.talk1 : Images.talk2,
            height: 1.sh,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
