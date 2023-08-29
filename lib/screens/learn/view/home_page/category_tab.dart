import '../../../../ablelyf.dart';

class CategoryTab extends StatefulWidget {
  final void Function(String) onTap;
  const CategoryTab({super.key, required this.onTap});

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future:
              FirebaseFirestore.instance.collection('learnCategories').get(),
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
                      contentPadding: EdgeInsets.all(10.0),
                      onTap: () {
                        widget.onTap.call(snapshot.data!.docs[index]['id']);
                        // Get.to(() {
                        //   return SubCategory(
                        //     userId: snapshot.data!.docs[index]['id'],
                        //     topic: snapshot.data!.docs[index]['name'],
                        //   );
                        // });
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      tileColor: Colors.blueGrey[200],
                      title: Text(
                        '${snapshot.data!.docs[index]['name']}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      trailing: CircleAvatar(
                        radius: 25.0,
                        backgroundImage:
                            NetworkImage(snapshot.data!.docs[index]['image']),
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
