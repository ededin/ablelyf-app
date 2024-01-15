import '../../../ablelyf.dart';

class SocialScreen extends StatefulWidget {
  const SocialScreen({super.key});

  @override
  State<SocialScreen> createState() => _SocialScreenState();
}

class _SocialScreenState extends State<SocialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 0.6.sh,
            width: 1.sw,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: NetworkImage(
                  'https://www.answerlab.com/hubfs/Imported_Blog_Media/Featured%20Image%20w%20Background.png',
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Welcome to\nAble to Social',
            style: TextStyle(
                color: Colors.black45,
                fontSize: 24,
                fontWeight: FontWeight.w400),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Get.to(const IntrestScreens());
            },
            child: Container(
                alignment: Alignment.center,
                width: 0.70.sw,
                height: 50,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.black,
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                )),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
