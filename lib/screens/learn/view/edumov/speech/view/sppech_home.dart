import 'package:newp/ablelyf.dart';

class SpeechTherapyHome extends StatefulWidget {
  const SpeechTherapyHome({super.key});

  @override
  State<SpeechTherapyHome> createState() => _SpeechTherapyHomeState();
}

class _SpeechTherapyHomeState extends State<SpeechTherapyHome>
    with TickerProviderStateMixin {
  TabController? controller;

  final FlutterTts flutterTts = FlutterTts();

  bool speechOn = false;

  @override
  void initState() {
    flutterTts.setLanguage("en-US");

    super.initState();
  }

  Future<void> speak(text) async {
    await flutterTts.setVoice({"name": "en-IN-Standard-D", "locale": "en-IN"});
    await flutterTts.setVolume(0.5);
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.4);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          /* IconButton(
              onPressed: () {
                // scanKtp();
              },
              icon: const Icon(Icons.scanner)), */
          IconButton(
              onPressed: () {
                Get.dialog(const AddSentence()).then((value) {
                  setState(() {});
                });
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: FirebaseFirestore.instance.collection("speech").get(),
          builder: (c, snapshot) {
            List<String> sentence = [];
            print('SNAPSHOT.DATA?.DOCS.LENGTH: ${snapshot.data?.docs.length}');
            if ((snapshot.data?.docs.length ?? 0) > 0) {
              controller = TabController(
                  length: snapshot.data!.docs.length, vsync: this);

              return TabBarView(
                controller: controller,
                children: [
                  for (int i = 0; i < snapshot.data!.docs.length; i++)
                    Builder(builder: (context) {
                      sentence = snapshot.data?.docs[i]
                              .data()['sentence']
                              .split(" ") ??
                          [];
                      return Center(
                        child: Wrap(
                          children: [
                            for (int i = 0; i < sentence.length; i++)
                              InkWell(
                                onTap: () {
                                  if (speechOn) {
                                    speak(sentence[i]);
                                  }
                                  Get.dialog(WordRef(word: sentence[i]));
                                },
                                child: Text(
                                  "${sentence[i]} ",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                          ],
                        ),
                      );
                    }),
                ],
              );
            }

            return const SizedBox();
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SwitchListTile(
          title: const Text("Speak"),
          value: speechOn,
          onChanged: (value) {
            setState(() {
              speechOn = value;
            });
          },
        ),
      ),
    );
  }
}

class WordRef extends StatelessWidget {
  final String word;
  const WordRef({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CachedNetworkImage(
        imageUrl: "https://source.unsplash.com/200x200/?$word",
      ),
    );
  }
}

class AddSentence extends StatefulWidget {
  const AddSentence({super.key});

  @override
  State<AddSentence> createState() => _AddSentenceState();
}

class _AddSentenceState extends State<AddSentence> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Add Sentence"),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(hintText: 'Sentence'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String id = DateTime.now().millisecondsSinceEpoch.toString();
                FirebaseFirestore.instance.collection("speech").doc(id).set(
                  {"sentence": controller.text, "id": id},
                );

                Get.close(1);
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
