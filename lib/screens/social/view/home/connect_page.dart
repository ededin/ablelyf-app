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
    // tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'NewsFeed',
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
            .collection('users')
            .doc(constants.myId)
            .collection('posts')
            .get(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        var data = snapshot.data?.docs[index].data();

                        return (snapshot.data?.docs ?? []).isNotEmpty
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const ListTile(
                                    leading: CircleAvatar(
                                      radius: 30,
                                      backgroundImage: NetworkImage(
                                          'https://i.pinimg.com/564x/ce/ef/76/ceef76224c4de5c2255e42f6c733abc5.jpg'),
                                    ),
                                    title: Text(
                                      'SATHISH',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                      'INDIA,Pollachi',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    trailing: Text(
                                      'Posted 5',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Container(
                                    width: 0.90.sw,
                                    height: 0.65.sh,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                                data!['media']),
                                            fit: BoxFit.cover)),
                                  ),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0)),
                                    child: Container(
                                      height: 50,
                                      width: 0.90.sw,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black45),
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          color: Colors.white),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ListView(
                                            children: [Text(data['caption'])]),
                                      ),
                                      // const Row(
                                      //   children: [
                                      //     SizedBox(
                                      //       width: 10,
                                      //     ),
                                      //     CircleAvatar(
                                      //       backgroundImage: NetworkImage(
                                      //           'https://images5.alphacoders.com/404/404490.jpg'),
                                      //     ),
                                      //     CircleAvatar(
                                      //       backgroundImage: NetworkImage(
                                      //           'https://images5.alphacoders.com/404/404490.jpg'),
                                      //     ),
                                      // Text(
                                      //   'Join the',
                                      //   style:
                                      //       TextStyle(color: Colors.grey),
                                      // ),
                                      // SizedBox(
                                      //   width: 10,
                                      // ),
                                      //   ],
                                      // ),
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
                      }),
                )
              ],
            );
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
