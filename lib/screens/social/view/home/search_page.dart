import '../../../../ablelyf.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with TickerProviderStateMixin {
  List<String> words = ['Come', 'Pet Lover', 'Out Door', 'Health', 'Entert'];
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Search',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 18.0),
            child: Text(
              'Hello, how can we support you?',
              style: TextStyle(
                  color: Colors.black45,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              child: SizedBox(
                height: 46,
                width: 0.90.sw,
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
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      fillColor:
                          Theme.of(context).inputDecorationTheme.fillColor,
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Search',
                      hintStyle:
                          const TextStyle(color: Colors.grey, fontSize: 17)),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                        image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.5),
                                BlendMode.dstATop),
                            image: const NetworkImage(
                                'https://t4.ftcdn.net/jpg/05/47/97/81/360_F_547978128_vqEEUYBr1vcAwfRAqReZXTYtyawpgLcC.jpg'),
                            fit: BoxFit.cover,
                            opacity: 10.0),
                      ),
                      child: Text(
                        words[index],
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
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
          TabBar(
              controller: tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black45,
              indicatorColor: Colors.black,
              tabs: const [
                Text('214K Photos'),
                Text('25 Videos'),
                Text('7 users'),
              ]),
          Expanded(
            child: TabBarView(controller: tabController, children: [
              const PhotoShowing(),
              Container(),
              Container(),
            ]),
          )
        ],
      ),
    );
  }
}
