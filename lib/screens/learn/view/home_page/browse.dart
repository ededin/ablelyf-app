import '../../../../ablelyf.dart';

class BrowsePage extends StatefulWidget {
  const BrowsePage({super.key});

  @override
  State<BrowsePage> createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {
  List categoriesList = [
    'Greetings',
    'Phrases',
    'Emotions',
    'Needs and',
  ];

  List<Icon> categoriesIcon = const [
    Icon(
      Icons.message,
      size: 30,
    ),
    Icon(
      Icons.groups,
      size: 30,
    ),
    Icon(
      Icons.search,
      size: 30,
    ),
    Icon(
      Icons.groups_2,
      size: 30,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  child: SizedBox(
                    height: 46,
                    width: 0.70.sw,
                    child: TextField(
                      maxLines: 1,
                      style: const TextStyle(fontSize: 17),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          filled: true,
                          prefixIcon: Icon(Icons.search,
                              color: Theme.of(context).iconTheme.color),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          fillColor:
                              Theme.of(context).inputDecorationTheme.fillColor,
                          contentPadding: EdgeInsets.zero,
                          hintText: 'Search words and phrases',
                          hintStyle: const TextStyle(
                              color: Colors.grey, fontSize: 17)),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(13),
                decoration: const BoxDecoration(
                    color: Colors.black, shape: BoxShape.circle),
                child: const Icon(
                  Icons.filter_b_and_w,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ],
          ),
          const Text(
            '  Poplar words and phrases',
            style: TextStyle(
                color: Colors.black38,
                fontSize: 20,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            child: SizedBox(
              height: 220,
              child: ListView.builder(
                shrinkWrap: true,
                addAutomaticKeepAlives: false,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Container(
                      height: 220,
                      width: 350,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: NetworkImage(
                                  'https://images.unsplash.com/photo-1517842645767-c639042777db?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bm90ZXN8ZW58MHx8MHx8fDA%3D&w=1000&q=80'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.3),
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  child: const Text(
                                    'Premium',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.3),
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                    child: const Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '4.9',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 80,
                            width: 1.sw,
                            decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                )),
                            child: const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Basic greetings',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 25),
                                  ),
                                  Text(
                                    'John Doe',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 150.0),
            child: Text(
              '  Emotion and feekings',
              style: TextStyle(
                  color: Colors.black38,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            child: SizedBox(
              height: 260,
              child: ListView.builder(
                shrinkWrap: true,
                addAutomaticKeepAlives: false,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Container(
                      height: 260,
                      width: 250,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: NetworkImage(
                                  'https://e0.pxfuel.com/wallpapers/747/277/desktop-wallpaper-cute-baby-girl-kids-cute-baby-boy-cute-baby-girl-baby-girl-little-kids.jpg'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  child: const Text(
                                    '',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.3),
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                    child: const Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '4.9',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 80,
                            width: 1.sw,
                            decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                )),
                            child: const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Expressing needs',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 25),
                                  ),
                                  Text(
                                    'Sarah Johnson',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 150.0),
            child: Text(
              '   Categories',
              style: TextStyle(
                  color: Colors.black38,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i <= 3; i++)
                  Column(
                    children: [
                      Container(
                        height: 80,
                        width: 0.2.sw,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 231, 230, 230),
                            borderRadius: BorderRadius.circular(25)),
                        child: categoriesIcon[i],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        categoriesList[i],
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
