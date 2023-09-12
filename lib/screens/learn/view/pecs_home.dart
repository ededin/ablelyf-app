import 'package:newp/ablelyf.dart';
import 'package:newp/screens/learn/view/pecs_cards.dart';

class PECSHome extends StatefulWidget {
  const PECSHome({super.key});

  @override
  State<PECSHome> createState() => _PECSHomeState();
}

class _PECSHomeState extends State<PECSHome> {
  final FlutterTts flutterTts = FlutterTts();

  List<String> sentence = [];
  List<String> sentenceImages = [];

  String? selectedCategoryId;

  String? selectedCategoryName;

  @override
  void initState() {
    flutterTts.setLanguage("en-US");

    super.initState();
  }

  Future<void> speak(text) async {
    await flutterTts.setVolume(0.5);
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.4);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (selectedCategoryId == null) {
          return true;
        } else {
          setState(() {
            selectedCategoryId = null;
            selectedCategoryName = null;
          });
          return false;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('PECS'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 0.3.sh,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: sentence.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: CachedNetworkImage(
                                imageUrl: sentenceImages.elementAt(index),
                                height: 0.2.sh,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            sentence.remove(sentence.elementAt(index));
                            sentenceImages
                                .remove(sentenceImages.elementAt(index));
                          });
                        },
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(
                              Icons.close,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    speak(sentence.join(" "));
                  },
                  child: const Icon(
                    Icons.record_voice_over,
                  ),
                ),
              ),
            ),
            if (selectedCategoryName == null)
              const Text(
                "Categories",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )
            else
              Text(
                selectedCategoryName!,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            if (selectedCategoryId == null)
              Expanded(
                child: FutureBuilder(
                    future: FirebaseFirestore.instance
                        .collection('pecsCategories')
                        .get(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                          itemCount: (snapshot.data?.docs ?? []).length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 0.1.sh,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            var category = snapshot.data?.docs[index].data();
                            return InkWell(
                              onTap: () {
                                // Get.to(
                                //   () => PECSCards(
                                //     category: category?['name'],
                                //     id: category?['id'],
                                //   ),
                                // );

                                setState(() {
                                  selectedCategoryId = category?['id'];
                                  selectedCategoryName = category?['name'];
                                });
                              },
                              child: Container(
                                width: 0.4.sw,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: constants.themeColor,
                                ),
                                child: Center(
                                  child: Text(
                                    category?['name'],
                                    style: TextStyle(
                                      color: constants.secondary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }),
              )
            else
              Expanded(
                child: PECSCards(
                  id: selectedCategoryId!,
                  onTap: (image, word) {
                    speak(word);
                    setState(() {
                      sentence.add(word);
                      sentenceImages.add(image);
                    });
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}
