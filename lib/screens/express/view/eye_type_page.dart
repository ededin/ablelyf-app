import '../../../ablelyf.dart';

class EyeTypePage extends StatefulWidget {
  const EyeTypePage({super.key});

  @override
  State<EyeTypePage> createState() => _EyeTypePageState();
}

class _EyeTypePageState extends State<EyeTypePage>
    with SingleTickerProviderStateMixin {
  TextEditingController serachController = TextEditingController();
  TabController? searchtab;

  @override
  void initState() {
    searchtab = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              height: 0.08.sh,
            ),
            TextField(
              controller: serachController,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Type hera to search',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              height: 10,
            ),
            TabBar(
                controller: searchtab,
                labelStyle: const TextStyle(color: Colors.black, fontSize: 16),
                unselectedLabelStyle:
                    TextStyle(color: constants.lightgrey, fontSize: 13),
                tabs: const [
                  Tab(text: 'Text'),
                  Tab(text: 'voice'),
                  Tab(text: 'Eye-Tracking')
                ]),
            Expanded(
              child: TabBarView(controller: searchtab, children: const [
                ExpressTabPageview(),
                ExpressTabPageview(),
                ExpressTabPageview()
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class ExpressTabPageview extends StatefulWidget {
  const ExpressTabPageview({super.key});

  @override
  State<ExpressTabPageview> createState() => _ExpressTabPageviewState();
}

class _ExpressTabPageviewState extends State<ExpressTabPageview> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 160,
              height: 150,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 50),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Custom Settings',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            Container(
              width: 160,
              height: 150,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 50),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Notes',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 160,
              height: 150,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 50),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'List',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            Container(
              width: 160,
              height: 150,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 50),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Recordings',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: 160,
              height: 150,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 50),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Cummunicate',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            const SizedBox(
              width: 100,
            ),
            Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 50),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.add)),
          ],
        ),
      ],
    );
  }
}
