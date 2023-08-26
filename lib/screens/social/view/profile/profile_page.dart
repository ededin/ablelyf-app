import '../../../../ablelyf.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  List<String> images = [
    'https://media.istockphoto.com/id/1297011595/photo/farmer-with-cow.jpg?s=612x612&w=0&k=20&c=kJun0skl3Zn3v7zapjr2bs0JMbxxU7apFLLAigkVqWQ=',
    'https://c1.wallpaperflare.com/preview/870/253/196/family-children-sunset-silhouette.jpg',
    'https://images.unsplash.com/photo-1609220136736-443140cffec6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA%3D%3D&w=1000&q=80',
  ];

  List<String> video = [
    'https://images.pexels.com/videos/2334654/free-video-2334654.jpg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://i.pinimg.com/originals/43/7e/45/437e45bee2148572f496298ac21ab2e5.jpg',
    'https://images.unsplash.com/photo-1611162616475-46b635cb6868?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8dmlkZW9zfGVufDB8fDB8fHww&w=1000&q=80',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: firebaseFirestore.collection('users').doc(constants.myId).get(),
      builder: (BuildContext context,
          AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
        var dataa = snapshot.data?.data();
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return FutureBuilder(
            future: firebaseFirestore
                .collection('users')
                .doc(constants.myId)
                .collection('posts')
                .get(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                    sathishshot) {
              return ListView(
                children: [
                  Stack(children: [
                    Container(
                      width: 1.sw,
                      height: 0.27.sh,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://images.unsplash.com/photo-1609220136736-443140cffec6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA%3D%3D&w=1000&q=80'),
                            fit: BoxFit.cover),
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.lightBlue),
                              child: const Icon(Icons.add),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        top: 50,
                        child: Transform.translate(
                          offset: const Offset(0, 150),
                          child: Container(
                            height: 200,
                            width: 1.sw,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0))),
                          ),
                        )),
                  ]),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(dataa?['profileImage']),
                    ),
                    title: Text(dataa?['name'],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    subtitle: const Text('Software Engineer',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black45,
                            fontSize: 18)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            (sathishshot.data?.docs ?? []).length.toString(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          const Text(
                            'Posts',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.normal,
                                fontSize: 18),
                          ),
                        ],
                      ),
                      const Column(
                        children: [
                          Text(
                            '50',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            'Followers',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.normal,
                                fontSize: 18),
                          ),
                        ],
                      ),
                      const Column(
                        children: [
                          Text(
                            '100',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            'Following',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.normal,
                                fontSize: 18),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          width: 0.44.sw,
                          height: 50,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.black,
                          ),
                          child: const Text(
                            'Chat',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )),
                      Container(
                          alignment: Alignment.center,
                          width: 0.44.sw,
                          height: 50,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.black,
                          ),
                          child: const Text(
                            'Follow',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )),
                    ],
                  ),
                  const ListTile(
                    leading: Text(
                      'Photos',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                    ),
                  ),
                  Builder(
                    builder: (
                      BuildContext context,
                    ) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return (sathishshot.data?.docs ?? []).isNotEmpty
                            ? Align(
                                child: SizedBox(
                                  height: 0.20.sh,
                                  child: ListView.builder(
                                    itemCount: sathishshot.data?.docs.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var data =
                                          sathishshot.data?.docs[index].data();
                                      return Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0)),
                                        child: Container(
                                          height: 0.20.sh,
                                          width: 0.40.sw,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      data?['media']),
                                                  fit: BoxFit.cover),
                                              borderRadius:
                                                  BorderRadius.circular(15.0)),
                                        ),
                                      );
                                    },
                                  ),
                                ),
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
                  const SizedBox(
                    height: 15,
                  ),
                  const ListTile(
                    leading: Text(
                      'Videos',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                    ),
                  ),
                  Align(
                    child: SizedBox(
                      height: 0.30.sh,
                      child: ListView.builder(
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Container(
                              height: 0.30.sh,
                              width: 0.40.sw,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(video[index]),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(15.0)),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              );
            },
          );
        }
      },
    ));
  }
}
