import 'package:newp/screens/social/view/notification_screens.dart';

import '../../../../ablelyf.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Column(
          children: [
            Text(
              "Sathish",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              "online",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),
        actions: [
          const Icon(Icons.call),
          const SizedBox(
            width: 10,
          ),
          InkWell(
              onTap: () {
                Get.to(const NotificationPage());
              },
              child: const Icon(Icons.video_call)),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 0.40.sh,
              width: 0.50.sw,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://media.istockphoto.com/id/529363157/photo/happy-family-sitting-on-park-bench.jpg?s=612x612&w=0&k=20&c=gyd4TUyTF5OVwj1FkKHXmh3ASab9-68GQocPwy_Ey7M='),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(25.0))),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  border: Border.all(color: Colors.black45)),
              child: const Text(
                  'I had an Amazing experience here.\nyou should defenitely try it!'),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 230),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(color: Colors.black45)),
                    child: const Text('Sure, Lets plan it.'),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(color: Colors.black45)),
                    child: const Text('great time with u.'),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  border: Border.all(color: Colors.black45)),
              child: const Text('Great..11.05'),
            ),
            const Spacer(),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                const Icon(
                  Icons.more_horiz,
                  weight: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: SizedBox(
                      height: 46,
                      width: 0.80.sw,
                      child: TextField(
                        maxLines: 1,
                        style: const TextStyle(fontSize: 17),
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                            filled: true,
                            suffixIcon: Icon(Icons.mic,
                                color: Theme.of(context).iconTheme.color),
                            // prefixIcon: Icon(Icons.search,
                            //     color: Theme.of(context).iconTheme.color),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            fillColor: Theme.of(context)
                                .inputDecorationTheme
                                .fillColor,
                            contentPadding: EdgeInsets.zero,
                            hintText: '    Type your message here.',
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 17)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
