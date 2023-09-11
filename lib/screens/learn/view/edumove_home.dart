import 'package:newp/ablelyf.dart';

List<String> title = [
  "GB - ABA",
  "VS - ER",
  "VT - SLP",
  "IEG - OF",
  "GC - SST",
  "SI - MT",
];

List<String> description = [
  "Gesture-Based Gesture-Based ABA Learning ABA Learning Board",
  "Visual Story Emotional Regulation",
  "Vocal Therapy Speech-Language Principles",
  "Interactive Exercise Game Occupational Focus",
  "Gesture-Controlled Social Skills Training",
  "Sensory ntegration Mindfulness Training",
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
            for (int i = 0; i < 6; i++)
              InkWell(
                onTap: () {
                  Get.to(() => const HomePage());
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
