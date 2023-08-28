import '../../../../ablelyf.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? controller;
  String? selectedCategoryId;

  List<String> sentence = [];

  final FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    flutterTts.setLanguage("en-US");
    controller = TabController(length: 3, vsync: this);
    controller?.addListener(() {
      setState(() {
        selectedCategoryId = null;
      });
    });
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
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size(1.sw, 20),
          child: Container(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.black,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 30,
            backgroundImage:
                NetworkImage('https://images6.alphacoders.com/130/1300248.jpg'),
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
            /*  Text(
              'Choose a word or phone',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
            ), */
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(const SearchAndFilter());
              },
              icon: const Icon(Icons.messenger_rounded))
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /*  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              // height: 70,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: const BorderRadius.all(Radius.circular(12.0))),
              child: Column(
                children: [
                  const Text(
                    'You have 10 words today!\n50% of your daily goal is completed.',
                    style: TextStyle(color: Colors.black45),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  SizedBox(
                    width: 0.60.sw,
                    child: LinearProgressIndicator(
                      backgroundColor: constants.themeColor2,
                      value: 0.6,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(constants.themeColor),
                    ),
                  )
                ],
              ),
            ),
          ),
          */

          Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("\n\t\tSentence to speak\n"),
              ),
              SizedBox(
                height: 0.15.sh,
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
                                child: Text(
                                  sentence.elementAt(index),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              sentence.remove(sentence.elementAt(index));
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
            ],
          ),
          const SizedBox(
            height: 17,
          ),
          TabBar(
              isScrollable: true,
              unselectedLabelColor: Colors.black45,
              labelColor: Colors.black,
              controller: controller,
              indicatorColor: Colors.black,
              indicatorWeight: 1.5,
              tabs: const [
                Text(
                  'Browse',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Categories',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'My Library',
                  style: TextStyle(fontSize: 20),
                ),
              ]),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: [
                const BrowsePage(),
                if (selectedCategoryId == null)
                  CategoryTab(
                    onTap: (id) {
                      setState(() {
                        selectedCategoryId = id;
                      });
                    },
                  )
                else
                  SubCategory(
                    categoryId: selectedCategoryId!,
                    selectedWord: (text) {
                      speak(text);
                      setState(() {
                        if (text != null) {
                          sentence.add(text);
                        } else {
                          selectedCategoryId = text;
                        }
                      });
                    },
                  ),
                Container(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
