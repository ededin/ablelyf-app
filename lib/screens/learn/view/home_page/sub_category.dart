import '../../../../ablelyf.dart';

class SubCategory extends StatefulWidget {
  const SubCategory({super.key, this.userId, required this.topic});

  final String? userId;
  final String topic;

  @override
  State<SubCategory> createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  final FlutterTts flutterTts = FlutterTts();
  String text = '';
  @override
  void initState() {
    flutterTts.setLanguage("en-US");
    super.initState();
  }

  Future<void> speak() async {
    await flutterTts.setVolume(0.5);
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.4);
    await flutterTts.speak(text);
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.topic),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 20,
            )),
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('learnPharses')
              .where('category', isEqualTo: widget.userId)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text('No Category list'),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: 80,
                    child: ListTile(
                      onTap: () {
                        // print('--------');
                        text = snapshot.data!.docs[index]['pharse'];
                        speak();
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      tileColor: Colors.blueGrey[200],
                      title: Text(
                        '${snapshot.data!.docs[index]['pharse']}',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
