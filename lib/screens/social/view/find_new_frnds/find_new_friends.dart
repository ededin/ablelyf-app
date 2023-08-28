import '../../../../ablelyf.dart';

class NewFriends extends StatefulWidget {
  const NewFriends({super.key});

  @override
  State<NewFriends> createState() => _NewFriendsState();
}

class _NewFriendsState extends State<NewFriends> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              ListTile(
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                      data?['profile'] ??
                                          constants.profileImage),
                                ),
                                title: Text(
                                  data?['name'] ?? "",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                width: 0.90.sw,
                                height: 0.65.sh,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  image: DecorationImage(
                                    image: NetworkImage(data!['media']),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              /*  Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0)),
                                child: Container(
                                  height: 50,
                                  width: 0.90.sw,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black45),
                                      borderRadius: BorderRadius.circular(25.0),
                                      color: Colors.white),
                                  child: const Row(
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            'https://images5.alphacoders.com/404/404490.jpg'),
                                      ),
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            'https://images5.alphacoders.com/404/404490.jpg'),
                                      ),
                                      Spacer(),
                                      Text(
                                        'Join the',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                             */
                            ],
                          )
                        : const Center(
                            child: Text(
                              'No Posts Found',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic),
                            ),
                          );
                  },
                ),
              )
            ],
          );
        }
      },
    ));
  }
}


 // Container(
              //     alignment: Alignment.center,
              //     width: 0.80.sw,
              //     height: 50,
              //     padding: const EdgeInsets.all(8),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(20.0),
              //       color: Colors.black,
              //     ),
              //     child: const Text(
              //       'Join the Community',
              //       style: TextStyle(
              //           color: Colors.white,
              //           fontWeight: FontWeight.bold,
              //           fontSize: 19),
              //     )),
