import '../../../../ablelyf.dart';

class SubCategory extends StatefulWidget {
  const SubCategory({super.key, required this.userId, required this.topic});

  final String userId;
  final String topic;

  @override
  State<SubCategory> createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
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
            if (snapshot.data!.docs.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
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
                      onTap: () {},
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
