import '../../../ablelyf.dart';

class AbleToBuy extends StatelessWidget {
  const AbleToBuy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection('buyCategory')
                      .get(),
                  builder: (context, snapshot) {
                    return CarouselSlider(
                      options: CarouselOptions(
                        height: 200,
                        viewportFraction: 0.8,
                        enlargeCenterPage: true,
                        autoPlay: true,
                      ),
                      items: List.generate(
                          snapshot.data!.docs.length,
                          (index) => Container(
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Image.network(
                                  snapshot.data!.docs[index]['products_image'],
                                  fit: BoxFit.cover,
                                ),
                              )),
                    );
                  }),
              const Text(
                '\n\nFeatured Products',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 300,
                child: FutureBuilder(
                    future:
                        FirebaseFirestore.instance.collection('buytypes').get(),
                    builder: (context, snapshot) {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            return ProductCard(
                              image: snapshot.data!.docs[index]
                                  ['products_image'],
                              name: snapshot.data!.docs[index]['products_type'],
                              price:
                                  '\$ ${snapshot.data!.docs[index]['products_price']}',
                              description:
                                  'Inspired by recent successes in integrating semantic topics into this task, this paper develops a plug-and-play hierarchical-topic-guided image paragraph generation framework, which couples a visual extractor with a deep topic model to guide the learning of a language model.',
                            );
                          });
                    }),
              ),
              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 150,
                child: FutureBuilder(
                    future: FirebaseFirestore.instance
                        .collection('buyCategory')
                        .get(),
                    builder: (context, snapshot) {
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  Get.to(ProductsList(
                                    category: snapshot.data!.docs[index].data(),
                                  ));
                                },
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: constants.themeColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      snapshot.data!.docs[index].data()['name'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final String description;

  const ProductCard({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    this.description = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetailsPage(
                  productDescription: description,
                  productImage: image,
                  productName: name,
                  productPrice: price,
                )));
      },
      child: Container(
        width: 200,
        margin: EdgeInsets.only(right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              image,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8),
            Text(
              name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              price,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
