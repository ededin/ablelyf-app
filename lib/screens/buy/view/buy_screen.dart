import '../../../ablelyf.dart';

class AbleToBuy extends StatelessWidget {
  const AbleToBuy({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> carouselImages = [
      'https://www.jiomart.com/images/product/original/rv9au7cn48/kds-surgical-elderly-disabled-man-and-pregnant-woman-iron-shower-and-bathing-room-mobile-commode-chair-with-toilet-seat-comfortable-safe-toilet-stool-anti-skid-without-a-bucket-grey-with-pot-product-images-orv9au7cn48-p590998308-0-202201121425.jpg',
      'https://disabled-advisor.com/sites/default/files/styles/business-list-squa/public/product_images/41RcUZmTaGL_0.jpg',
      'https://disabled-advisor.com/sites/default/files/styles/business-list-squa/public/product_images/4.jpg',
    ];

    final List<String> categories = [
      'Electronics',
      'Clothing',
      'Beauty',
      'Home',
      'Sports',
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  viewportFraction: 0.8,
                  enlargeCenterPage: true,
                  autoPlay: true,
                ),
                items: carouselImages.map((image) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Image.network(
                          image,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Text(
                '\n\nFeatured Products',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    ProductCard(
                      image:
                          'https://www.disabilityfriendlylv.com/wp-content/uploads/2016/04/electric-wheel-chair-33-no-white-1.png',
                      name: 'Wheel chair',
                      price: '\$199.99',
                      description:
                          'Introducing our Lightweight Folding Wheelchair, designed to provide exceptional mobility and comfort for individuals with mobility challenges. This wheelchair is meticulously crafted with precision and care, using high-quality materials to ensure durability and reliability.We believe that everyone deserves independence and freedom of movement, which is why our Lightweight Folding Wheelchair is thoughtfully designed to enhance mobility and improve the quality of life for individuals with mobility limitations. Experience convenience, comfort, and reliability with our exceptional wheelchair.\n\n\nNote: Please consult with a healthcare professional or mobility expert to ensure that this wheelchair meets your specific needs and requirements. Safety should always be a priority when choosing and using mobility aids.',
                    ),
                    ProductCard(
                      image:
                          'https://disabled-advisor.com/sites/default/files/styles/business-list-squa/public/product_images/4.jpg',
                      name: 'SAEBOSTEP',
                      price: '\$149.99',
                      description:
                          'The SAEBOSTEP is an innovative and assistive device designed to help individuals with lower limb weakness or paralysis improve their gait and regain independence in walking. It combines advanced technology and ergonomic design to provide support and facilitate natural walking movements.The SAEBOSTEP has proven to be beneficial for individuals with conditions such as stroke, spinal cord injury, multiple sclerosis, and other neurological or orthopedic conditions affecting lower limb function. By providing external support and promoting natural gait patterns, it offers a path towards improved mobility and quality of life for those with walking impairments.',
                    ),
                    ProductCard(
                      image:
                          'https://disabled-advisor.com/sites/default/files/styles/business-list-squa/public/product_images/Homecraft%20Leather%20Walking%20Stick%20Strap_1.jpg',
                      name: 'Walking stick',
                      price: '\$199.99',
                      description:
                          'The Classic Wooden Walking Stick is a timeless and elegant accessory designed to provide stability and support during walks and hikes. Crafted with precision and care, this walking stick combines functionality with aesthetic appeal.Invest in the Classic Wooden Walking Stick to enhance your walking experience. It not only provides the necessary support but also adds a touch of style to your outdoor activities. Rediscover the joy of walking with confidence and grace.\nFeel free to customize this product description to match the specific features and characteristics of your walking stick.',
                    ),
                  ],
                ),
              ),
              Text(
                'Categories',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: constants.themeColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              categories[index],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
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
