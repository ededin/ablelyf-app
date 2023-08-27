
import '../../../ablelyf.dart';

class AbleToTalk extends StatefulWidget {
  const AbleToTalk({Key? key}) : super(key: key);

  @override
  AbleToTalkState createState() => AbleToTalkState();
}

class AbleToTalkState extends State<AbleToTalk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Center(
            child: Icon(
              Icons.forum,
              color: Colors.blue,
              size: 0.35.sh,
            ),
          ),
          Text(
            "Able to Talk",
            style: TextStyle(
              color: constants.themeColor,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Find Interpreters Near You",
            style: TextStyle(
              color: constants.themeColor,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: constants.themeColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.search),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: constants.themeColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.videocam_rounded),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const TalkWelcomeScreen());
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: constants.themeColor),
                    borderRadius: BorderRadius.circular(10),
                    color: constants.themeColor,
                  ),
                  child: const Text(
                    "Search Interpreters",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 0.03.sh)
        ],
      ),
    );
  }
}
