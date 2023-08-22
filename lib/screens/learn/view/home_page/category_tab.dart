import '../../../../ablelyf.dart';

class CategoryTab extends StatefulWidget {
  const CategoryTab({super.key});

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(builder: (context, snapshot) {
              var data = FirebaseFirestore.instance
                  .collection('learnCategories')
                  .get();
              // print('DATA: ${data.}');
              return ListView.builder(
                itemCount: 30,
                itemBuilder: (context, index) {
                  return Text('data');
                },
              );
            }),
          )
        ],
      ),
    );
  }
}
