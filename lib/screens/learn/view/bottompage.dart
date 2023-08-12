import '../../../ablelyf.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({super.key});

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  int selectIndex = 0;

  final List _children = [
    const HomePage(),
    Container(),
    Container(),
    Container(),
  ];
  void _onTabTapped(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
          // width: 500,
          // height: 200,
          child: _children[selectIndex],
        ),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
                color: Colors.black,
                border:
                    Border.all(color: const Color.fromARGB(31, 65, 64, 64))),
            child: BottomNavigationBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              onTap: _onTabTapped,
              currentIndex: selectIndex,
              unselectedItemColor: Colors.white,
              selectedItemColor: Colors.white,
              unselectedLabelStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
              ),
              selectedLabelStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 14.0,
              ),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: selectIndex == 0
                      ? const Icon(
                          Icons.home,
                          color: Colors.white,
                          size: 30,
                        )
                      : const Icon(Icons.home, color: Colors.white, size: 25),
                  label: '',
                  backgroundColor: Colors.black,
                ),
                BottomNavigationBarItem(
                  icon: selectIndex == 1
                      ? const Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 30,
                        )
                      : const Icon(Icons.search, color: Colors.white, size: 25),
                  label: '',
                  backgroundColor: Colors.black,
                ),
                BottomNavigationBarItem(
                  icon: selectIndex == 2
                      ? const Icon(
                          Icons.heart_broken_rounded,
                          color: Colors.white,
                          size: 30,
                        )
                      : const Icon(
                          Icons.heart_broken,
                          color: Colors.white,
                          size: 25,
                        ),
                  label: '',
                  backgroundColor: Colors.black,
                ),
                BottomNavigationBarItem(
                  icon: selectIndex == 3
                      ? const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 30,
                        )
                      : const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 25,
                        ),
                  label: '',
                  backgroundColor: Colors.black,
                ),
              ],
            )));
  }
}
