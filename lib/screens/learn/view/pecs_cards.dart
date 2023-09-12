import 'package:newp/ablelyf.dart';

class PECSCards extends StatelessWidget {
  final String id;
  final void Function(String, String) onTap;
  const PECSCards({super.key, required this.id, required this.onTap});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> cards = [
      {
        "name": "Bacon",
        "image":
            "http://www.mypecs.com/ImageServer/ImageService.svc/GetPecsCardImage/41,144",
        "category": id,
      },
      {
        "name": "Muffin",
        "image":
            "http://www.mypecs.com/ImageServer/ImageService.svc/GetPecsCardImage/41,408",
        "category": id,
      },
      {
        "name": "Pancakes",
        "image":
            "http://www.mypecs.com/ImageServer/ImageService.svc/GetPecsCardImage/41,148",
        "category": id,
      },
      {
        "name": "Fried Egg",
        "image":
            "http://www.mypecs.com/ImageServer/ImageService.svc/GetPecsCardImage/41,146",
        "category": id,
      },
      {
        "name": "Waffles",
        "image":
            "http://www.mypecs.com/ImageServer/ImageService.svc/GetPecsCardImage/41,355",
        "category": id,
      },
      {
        "name": "Toast",
        "image":
            "http://www.mypecs.com/ImageServer/ImageService.svc/GetPecsCardImage/41,149",
        "category": id,
      },
      {
        "name": "Boiled Egg",
        "image":
            "http://www.mypecs.com/ImageServer/ImageService.svc/GetPecsCardImage/41,147",
        "category": id,
      },
    ];
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(category),
      // ),
      /*  floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          for (Map<String, dynamic> element in cards) {
            FirebaseFirestore.instance.collection('pecsCard').add(element).then(
                  (value) => FirebaseFirestore.instance
                      .collection('pecsCard')
                      .doc(value.id)
                      .update(
                    {"id": value.id},
                  ),
                );
          }
        },
      ), */
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('pecsCard')
              .where('category', isEqualTo: id)
              .get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            return Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                itemCount: (snapshot.data?.docs ?? []).length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 0.2.sh,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.dialog(
                        Dialog(
                          child: CachedNetworkImage(
                            imageUrl:
                                snapshot.data?.docs[index].data()['image'],
                          ),
                        ),
                      );
                      onTap.call(snapshot.data?.docs[index].data()['image'],
                          snapshot.data?.docs[index].data()['name']);
                    },
                    child: CachedNetworkImage(
                      imageUrl: snapshot.data?.docs[index].data()['image'],
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
