import '../../ablelyf.dart';

class ModuleSelect extends StatefulWidget {
  const ModuleSelect({super.key});

  @override
  State<ModuleSelect> createState() => _ModuleSelectState();
}

class _ModuleSelectState extends State<ModuleSelect> {
  SpeechToText _speechToText = SpeechToText();

  final FlutterTts flutterTts = FlutterTts();

  // PicovoiceManager? _picovoiceManager;
  final String accessKey =
      "7U7m5Sq3m7FpFAnCQr2fu7Z7FoNYPYLy4LzpmOxngufx1yx3EZyveg==";
  bool _speechEnabled = false;

  bool wordFound = false;

  String _lastWords = '';

  List<Pharses> modules = [
    Pharses(
      message: "Able to Talk",
      image: ModulesImages.talk,
      commands: 'talk',
      page: const AbletoLearn(),
    ),
    Pharses(
      message: "Able to Express",
      image: ModulesImages.express,
      commands: "express",
      page: const AbleToExpress(),
    ),
    Pharses(
      message: "Able to See",
      image: ModulesImages.see,
      commands: "see",
      page: const AbleToSee(),
    ),
    Pharses(
      message: "Able to Buy",
      image: ModulesImages.buy,
      commands: "buy",
      page: const AbleToBuy(),
    ),
    Pharses(
      message: "Able to Cure",
      image: ModulesImages.cure,
      commands: "cure",
      page: const AbleToCure(),
    ),
    Pharses(
      message: "Able to Learn",
      image: ModulesImages.learn,
      commands: "learn",
      page: const AbleToTalk(),
    ),
    Pharses(
      message: "Able To Socialize",
      image: ModulesImages.social,
      commands: "social",
      page: const SocialScreen(),
    ),
  ];

  Future<void> speak(text) async {
    await flutterTts.setVolume(1);
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.4);
    await flutterTts.speak(text);
  }

  @override
  void initState() {
    flutterTts.setLanguage("en-US");

    wordFound = false;

    _initSpeech();

    super.initState();
  }

  void _initSpeech() async {
    /*   _picovoiceManager = await PicovoiceManager.create(
      accessKey,
      'assets/hey_eva.ppn',
      () {
        print("Word Found");

        setState(() {
          wordFound = true;
        });

        // speak("How can I help you");
        // _startListening();
      },
      'assets/hey_eva.rhn',
      (inference) {
        setState(() {
          wordFound = false;
        });
        if (inference.isUnderstood ?? false) {
          speak("Yeah Sure");

          int index =
              modules.indexWhere((e) => e.commands == (inference.intent ?? ""));

          if (index != -1) {
            print('_LASTWORDS: ${_lastWords}');

            Get.to(() => modules[index].page);
          }
        }
      },
      // endpointDurationSec: 0.5,
    );
    print('_PICOVOICEMANAGER: ${_picovoiceManager?.start()}');
    _speechEnabled = await _speechToText.initialize(
      onStatus: (status) {
        print('STATUS: ${status}');
        if (status == 'done') {
          _picovoiceManager?.start();
        }
      },
    ); */
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    await _speechToText.stop();
    // _picovoiceManager?.start();

    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    _lastWords = result.recognizedWords;

    int index = modules
        .indexWhere((e) => e.commands.contains(_lastWords.toLowerCase()));

    if (index != -1) {
      print('_LASTWORDS: ${_lastWords}');
      Get.to(() => modules[index].page);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F5FF),
      appBar: AppBar(
        title: Image.asset(
          AppIcons.logo,
          width: 0.4.sw,
        ),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: wordFound
          ? FloatingActionButton(
              onPressed: () {
                _startListening();
              },
              child: Icon(Icons.graphic_eq),
            )
          : null,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Wrap(
              children: [
                for (int i = 0; i < 6; i++)
                  InkWell(
                    onTap: () {
                      switch (i) {
                        case 0:
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AbletoLearn()));
                          break;
                        case 1:
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AbleToExpress()));
                          break;
                        case 2:
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AbleToSee()));
                          break;
                        case 3:
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AbleToBuy()));
                          break;
                        case 4:
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AbleToCure()));
                          break;

                        case 5:
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AbleToTalk()));
                          break;
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.all(0.05.sw),
                      height: 0.4.sw,
                      width: 0.4.sw,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Image.asset(
                              modules[i].image,
                              height: 0.22.sw,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(modules[i]
                                    .message
                                    .split(' ')
                                    .sublist(0, 2)
                                    .join(' ')),
                                Text(
                                  ' ${modules[i].message.split(' ').last}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SocialScreen(),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 0.05.sw,
                      vertical: 0.03.sw,
                    ),
                    height: 0.35.sw,
                    width: 0.8.sw + 0.1.sw,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          modules[6].image,
                          height: 0.22.sw,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 8),
                              child: Row(
                                children: [
                                  Text(modules[6]
                                      .message
                                      .split(' ')
                                      .sublist(0, 2)
                                      .join(' ')),
                                  Text(
                                    ' ${modules[6].message.split(' ').last}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Pharses {
  final String message;
  final String image;
  final String commands;
  final Widget page;

  Pharses({
    required this.message,
    required this.image,
    required this.commands,
    required this.page,
  });

  /*  factory Pharses.fromJson(String pharses) {
    Map<String, dynamic> json = jsonDecode(pharses);

    return Pharses(message: json['message'], image: json['image']);
  } */

  String toJson() => jsonEncode({'message': message, 'image': image});
}
