import 'package:newp/ablelyf.dart';

class PECSCards extends StatelessWidget {
  final String category;
  final String id;
  const PECSCards({super.key, required this.category, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
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
                  return CachedNetworkImage(
                    imageUrl: snapshot.data?.docs[index].data()['image'],
                  );
                },
              ),
            );
          }),
    );
  }
}
