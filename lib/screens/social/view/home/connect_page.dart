import '../../../../ablelyf.dart';

class ConnectPage extends StatefulWidget {
  const ConnectPage({super.key});

  @override
  State<ConnectPage> createState() => _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage>
    with TickerProviderStateMixin {
  // TabController? tabController;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  void initState() {
    firebaseFirestore
        .collectionGroup('posts')
        .orderBy('time', descending: true)
        .get();
    // tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Text(
          'News Feed',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.to(const NotificationPage());
            },
            child: const Icon(Icons.notifications),
          ),
          const SizedBox(
            width: 10,
          )
        ],
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: firebaseFirestore
            .collectionGroup('posts')
            .orderBy('time', descending: true)
            .get(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return (snapshot.data?.docs ?? []).isNotEmpty
                ? Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            var data = snapshot.data?.docs[index].data();

                            return Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ListTile(
                                    leading: CircleAvatar(
                                      radius: 30,
                                      backgroundImage: NetworkImage(
                                          data?['profile'] ??
                                              constants.profileImage),
                                    ),
                                    title: Text(
                                      data?['name'] ?? "",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(data?['caption'] ?? ''),
                                  ),
                                  Container(
                                    width: 0.90.sw,
                                    height: 0.65.sh,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                            data!['media']),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  )
                : const Center(
                    child: Text(
                    'No Posts Found',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic),
                  ));
          }
        },
      ),
    );
  }
}
// Expanded(
//   child: TabBarView(controller: tabController, children: [
//     const NewFriends(),
//     Container(),
//   ]),
// )
// SizedBox(
//   height: 10,
// ),
// TabBar(
//     unselectedLabelColor: Colors.black45,
//     indicatorColor: Colors.black45,
//     labelColor: Colors.black,
//     controller: tabController,
//     tabs: const [
//       Text(
//         'Find New Friends',
//         style: TextStyle(
//             // color: Colors.black,
//             fontWeight: FontWeight.w600,
//             fontSize: 17),
//       ),
//       Text(
//         'Share Your Stories',
//         style: TextStyle(
//             // color: Colors.black,
//             fontWeight: FontWeight.w600,
//             fontSize: 17),
//       )
//     ]),
