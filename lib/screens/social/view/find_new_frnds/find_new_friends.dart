import '../../../../ablelyf.dart';

class NewFriends extends StatefulWidget {
  const NewFriends({super.key});

  @override
  State<NewFriends> createState() => _NewFriendsState();
}

class _NewFriendsState extends State<NewFriends> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
              alignment: Alignment.center,
              width: 0.80.sw,
              height: 50,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.black,
              ),
              child: const Text(
                'Join the Community',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 19),
              )),
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Column(
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
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'INDIA,Pollachi',
                        style: TextStyle(color: Colors.grey),
                      ),
                      trailing: Text(
                        'Posted 5',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      width: 0.90.sw,
                      height: 0.65.sh,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: const DecorationImage(
                              image: NetworkImage(
                                  'https://c4.wallpaperflare.com/wallpaper/614/675/661/beautiful-pictures-nature-waterfall-wallpaper-preview.jpg'),
                              fit: BoxFit.cover)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: 150,
                            width: 0.30.sw,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        'https://m.media-amazon.com/images/I/51QsquBv8DL.jpg'),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      ),
                    ),
                    Card(
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
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
