import '../../../../ablelyf.dart';

class ConnectPage extends StatefulWidget {
  const ConnectPage({super.key});

  @override
  State<ConnectPage> createState() => _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage>
    with TickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Connect',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        actions: const [
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://i.pinimg.com/564x/ce/ef/76/ceef76224c4de5c2255e42f6c733abc5.jpg'),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          TabBar(
              unselectedLabelColor: Colors.black45,
              indicatorColor: Colors.black45,
              labelColor: Colors.black,
              controller: tabController,
              tabs: const [
                Text(
                  'Find New Friends',
                  style: TextStyle(
                      // color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 17),
                ),
                Text(
                  'Share Your Stories',
                  style: TextStyle(
                      // color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 17),
                )
              ]),
          Expanded(
            child: TabBarView(controller: tabController, children: [
              const NewFriends(),
              Container(),
            ]),
          )
        ],
      ),
    );
  }
}
