import 'package:newp/ablelyf.dart';

List<String> title = [
  "Fruit game",
  "Season game",
  "Character game",
];

List<String> urls = [
  "http://fruit-game.s3-website.eu-north-1.amazonaws.com/",
  "http://season-game.s3-website.eu-north-1.amazonaws.com/",
  "http://character-game.s3-website.eu-north-1.amazonaws.com/",
];

class GestureGameHome extends StatelessWidget {
  const GestureGameHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gesture-Based ABA Learning Board")),
      body: Center(
        child: Wrap(
          spacing: 15,
          runSpacing: 15,
          children: [
            for (int i = 0; i < title.length; i++)
              InkWell(
                onTap: () {
                  Get.to(() => GestureGamePage(url: urls[i]));
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
                    child: Center(
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
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
