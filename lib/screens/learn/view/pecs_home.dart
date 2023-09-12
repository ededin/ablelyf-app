import 'package:newp/ablelyf.dart';
import 'package:newp/screens/learn/view/pecs_cards.dart';

class PECSHome extends StatelessWidget {
  const PECSHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance.collection('pecsCategories').get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: (snapshot.data?.docs ?? []).length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 0.1.sh,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  var category = snapshot.data?.docs[index].data();
                  return InkWell(
                    onTap: () {
                      Get.to(
                        () => PECSCards(
                          category: category?['name'],
                          id: category?['id'],
                        ),
                      );
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
    );
  }
}
