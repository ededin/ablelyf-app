import '../../../../ablelyf.dart';

class SubCategory extends StatefulWidget {
  const SubCategory({
    super.key,
    required this.categoryId,
    required this.selectedWord,
  });

  final String categoryId;

  final void Function(String?) selectedWord;

  @override
  State<SubCategory> createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  String text = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            widget.selectedWord.call(null);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('learnPharses')
              .where('category', isEqualTo: widget.categoryId)
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
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                crossAxisCount: 3,
              ),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      text = snapshot.data!.docs[index].data()['pharse'];
                      widget.selectedWord.call(text);
                    },
                    child: Container(
                      height: 80,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '${snapshot.data!.docs[index].data()['pharse']}',
                        textAlign: TextAlign.center,
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
