import '../../../ablelyf.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<String> text = ['Today', 'This week', 'Earlier', 'Tommorow'];
  List<IconData> icon = [
    Icons.heart_broken,
    Icons.share,
    Icons.message,
    Icons.share_sharp
  ];
  List<String> message = [
    'Suagn & 10 others liked your post',
    'sathish & 10 others liked your post',
    'sathish & 10 others comment your post',
    'sugan & 10 others comment your post',
  ];
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
              onPressed: () {
                Get.to(ProfilePage());
              },
              icon: const Icon(
                Icons.tune,
                color: Colors.black,
                size: 25,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        text[index],
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          border: Border.all(color: Colors.black)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.heart_broken),
                          Text('Sathish & 10 others liked your post'),
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://w0.peakpx.com/wallpaper/447/914/HD-wallpaper-rajinikanth-actor-hero-kaala-kollywood-petta-rajini-superstar-tamil-telugu-tollywood-thumbnail.jpg'),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          border: Border.all(color: Colors.black)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(icon[index]),
                          Text(message[index]),
                          const CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://w0.peakpx.com/wallpaper/447/914/HD-wallpaper-rajinikanth-actor-hero-kaala-kollywood-petta-rajini-superstar-tamil-telugu-tollywood-thumbnail.jpg'),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}
