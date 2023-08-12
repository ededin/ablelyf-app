import 'package:newp/screens/talk/view/find_screen.dart';

import '../../../ablelyf.dart';

class TalkWelcomeScreen extends StatefulWidget {
  const TalkWelcomeScreen({super.key});

  @override
  State<TalkWelcomeScreen> createState() => _TalkWelcomeScreenState();
}

class _TalkWelcomeScreenState extends State<TalkWelcomeScreen> {
  List selectionList = [
    {
      "title": "Language selection",
      "image":
          "https://www.signsolutions.uk.com/wp-content/uploads/2020/06/Signing-Image.png",
    },
    {
      "title": "Interpreter search",
      "image":
          "https://www.iti.org.uk/static/5b439033-f12e-4f8b-ad218cded110460d/d6d26792-0b8b-48fc-99544fe97c6e47e3/400x264_highestperformance__f6c393495c06/Why-use-a-professional.jpg",
    },
    {
      "title": "Video interpreting",
      "image":
          "https://luna360.com/wp-content/uploads/2020/02/VRIInterpretingServices-1.jpg",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  "Welcome to Able to talk",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Center(
                child: Text(
                  "\n\nFind and connect with professional interpreters in your area. Explore a wide range of languages, skills, and subjects to enhance your communication and understanding. Choose from a diverse selection of",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              for (int i = 0; i < selectionList.length; i++)
                ListTile(
                  title: Text(selectionList[i]['title']),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: selectionList[i]['image'],
                      width: 0.1.sw,
                    ),
                  ),
                  trailing: Radio(
                    value: true,
                    groupValue: true,
                    onChanged: (value) {},
                  ),
                ),
              const Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const TalkFindScreen());
                  },
                  child: const Text(
                    "Get Started",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              const SizedBox(height: 15)
            ],
          ),
        ),
      ),
    );
  }
}
