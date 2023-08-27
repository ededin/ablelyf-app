import '../../../ablelyf.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key, required this.category});

  final Map<String, dynamic> category;

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category['name']),
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
              .collection('buytypes')
              .where('category', isEqualTo: widget.category['id'])
              .get(),
          builder: (context, snapshot) {
            if (snapshot.data!.docs.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return GridView.builder(
                itemCount: snapshot.data!.docs.length,
                // itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 5, mainAxisSpacing: 5, crossAxisCount: 2),
                itemBuilder: (context, index) {
                  var showList = snapshot.data!.docs[index].data();
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        // ProductDetailsPage(productDescription: ,)
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 120,
                            width: 180,
                            child: CachedNetworkImage(
                              imageUrl: showList['products_image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            showList['products_type'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$${showList['products_price']}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
