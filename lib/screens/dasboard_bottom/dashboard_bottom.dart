import 'package:flutter/material.dart';
import '../learn/view/learn_screen.dart';
// import '../profile/profile.dart';

class DashboardBottom extends StatefulWidget {
  const DashboardBottom({super.key});

  @override
  State<DashboardBottom> createState() => _DashboardBottomState();
}

class _DashboardBottomState extends State<DashboardBottom> {
  int selectIndex = 0;
  bool? clickevent;

  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();

  /*  final List _children = [
    const Homepage(),
    Container(),
    const StudentProfle(),
  ]; */
  void _onTabTapped(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SizedBox(
        child: AbletoLearn(),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          // border: Border.all(color: const Color(0xFF114FFF)),
          color: Color(0xffD4E3FF),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: TextField(
            focusNode: focusNode,
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.white),
              ),
              hintText: 'Search / Type New...',
              hintStyle: const TextStyle(color: Colors.black26),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFF114FFF)),
                  child: const Icon(
                    Icons.volume_up,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),

        /*     child: BottomNavigationBar(
          elevation: 0.0,
          backgroundColor: Color(0xffD4E3FF),
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          onTap: _onTabTapped,
          currentIndex: selectIndex,
          unselectedItemColor: Colors.black,
          selectedItemColor: Color(0xFF114FFF),
          unselectedLabelStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
          ),
          selectedLabelStyle: const TextStyle(
            color: Color(0xFF114FFF),
            fontWeight: FontWeight.w700,
            fontSize: 14.0,
          ),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: selectIndex == 0
                  ? Container(
                      padding: const EdgeInsets.only(
                          left: 18.0, right: 18, top: 4, bottom: 4),
                      decoration: BoxDecoration(
                          color: const Color(0xFFD4E3FF),
                          borderRadius: BorderRadius.circular(15.0)),
                      child: const Icon(
                        Icons.home,
                        color: Color(0xFF114FFF),
                      ))
                  : const Icon(
                      Icons.home,
                      color: Colors.black,
                    ),
              label: 'Home',
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: selectIndex == 1
                  ? Container(
                      padding: const EdgeInsets.only(
                          left: 18.0, right: 18, top: 4, bottom: 4),
                      decoration: BoxDecoration(
                          color: const Color(0xFFD4E3FF),
                          borderRadius: BorderRadius.circular(15.0)),
                      child: const Icon(
                        Icons.security,
                        color: Color(0xFF114FFF),
                      ))
                  : const Icon(
                      Icons.security,
                      color: Colors.black,
                    ),
              label: 'Label',
              backgroundColor: Colors.black,
            ),
            BottomNavigationBarItem(
              icon: selectIndex == 2
                  ? Container(
                      padding: const EdgeInsets.only(
                          left: 18.0, right: 18, top: 4, bottom: 4),
                      decoration: BoxDecoration(
                          color: const Color(0xFFD4E3FF),
                          borderRadius: BorderRadius.circular(15.0)),
                      child: const Icon(
                        Icons.person,
                        color: Color(0xFF114FFF),
                      ))
                  : const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
              label: 'Profile',
              backgroundColor: Colors.black,
            ),
          ],
        ),
    */
      ),
    );
  }
}
