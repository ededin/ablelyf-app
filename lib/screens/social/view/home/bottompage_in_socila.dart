import '../../../../ablelyf.dart';

class BottomPageSocial extends StatefulWidget {
  const BottomPageSocial({super.key});

  @override
  State<BottomPageSocial> createState() => _BottomPageSocialState();
}

class _BottomPageSocialState extends State<BottomPageSocial> {
  int selectIndex = 0;

  final List _children = [
    const ConnectPage(),
    // const SearchPage(),
    const NotificationPage(),
    // Get.dialog(UploadPost()),
    Container(),

    const MessagePage(),
    const ProfilePage(),
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
                  icon: selectIndex != 2
                      ? InkWell(
                          onTap: () {
                            Get.bottomSheet(const UploadPost());
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                                border: Border.all(color: Colors.white)),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                              border: Border.all(color: Colors.white)),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                  label: '',
                  backgroundColor: Colors.black,
                ),
                BottomNavigationBarItem(
                  icon: selectIndex == 3
                      ? const Icon(
                          Icons.message,
                          color: Colors.white,
                          size: 30,
                        )
                      : const Icon(
                          Icons.message,
                          color: Colors.white,
                          size: 25,
                        ),
                  label: '',
                  backgroundColor: Colors.black,
                ),
                BottomNavigationBarItem(
                  icon: selectIndex == 4
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
