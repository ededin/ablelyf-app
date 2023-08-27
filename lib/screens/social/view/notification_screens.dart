import '../../../ablelyf.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  List<String> text = ['Today', 'This week', 'Earlier', 'Tommorow'];
  // List<IconData> icon = [
  //   Icons.heart_broken,
  //   Icons.share,
  //   Icons.message,
  //   Icons.share_sharp
  // ];
  // List<String> message = [
  //   'Suagn & 10 others liked your post',
  //   'sathish & 10 others liked your post',
  //   'sathish & 10 others comment your post',
  //   'sugan & 10 others comment your post',
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          centerTitle: true,
          title: const Text(
            'Notification',
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.tune,
                  color: Colors.black,
                  size: 25,
                ))
          ],
        ),
        body: FutureBuilder(
          future: firebaseFirestore.collection('notification').get(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return (snapshot.data?.docs ?? []).isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: snapshot.data?.docs.length,
                                itemBuilder: (context, index) {
                                  var data = snapshot.data?.docs[index];
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Padding(
                                      //   padding:
                                      //       const EdgeInsets.only(left: 15.0),
                                      //   child: Text(
                                      //     text[index],
                                      //     style: const TextStyle(
                                      //         color: Colors.black,
                                      //         fontWeight: FontWeight.bold),
                                      //   ),
                                      // ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 10.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            border: Border.all(
                                                color: Colors.black)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            // const Icon(Icons.heart_broken),
                                            Text(data?['content']),
                                            CircleAvatar(
                                              backgroundImage: NetworkImage(data?[
                                                      'profileImage'] ??
                                                  'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            )
                          ]),
                    )
                  : const Center(
                      child: Text(
                        'No Notification Found',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic),
                      ),
                    );
            }
          },
        ));
  }
}
