import 'package:newp/ablelyf.dart';
import 'package:newp/screens/learn/view/edumov/speech/view/sppech_home.dart';

List<String> title = [
  "GB - ABA",
  "VS - ER",
  "MS",
  "ST"
  // "VT - SLP",
  // "IEG - OF",
  // "GC - SST",
  // "SI - MT",
];

List<String> description = [
  "Gesture-Based ABA Learning Board",
  "Visual Story Emotional Regulation",
  "MOOD Synthesizer",
  "Speech Therapy",
  // "Vocal Therapy Speech-Language Principles",
  // "Interactive Exercise Game Occupational Focus",
  // "Gesture-Controlled Social Skills Training",
  // "Sensory ntegration Mindfulness Training",
];

List<dynamic> pages = [
  const GestureGameHome(),
  const VocalGame(),
  const EmotionSynthesisPage(),
];

class EdumoveHome extends StatelessWidget {
  const EdumoveHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Wrap(
          spacing: 15,
          runSpacing: 15,
          children: [
            for (int i = 0; i < title.length; i++)
              InkWell(
                onTap: () {
                  switch (i) {
                    case 0:
                      Get.to(() => const SelectStudentPage());

                      break;
                    case 1:
                      Get.to(() => const VocalGame());

                      break;
                    case 2:
                      Get.to(() => const EmotionSynthesisPage());

                      break;
                    case 3:
                      Get.to(() => const SpeechTherapyHome());

                      break;
                    default:
                  }
                },
                child: Container(
                  width: 0.45.sw,
                  height: 0.45.sw,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            title[i],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            description[i],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
