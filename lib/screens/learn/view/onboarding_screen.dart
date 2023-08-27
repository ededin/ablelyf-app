import '../../../ablelyf.dart';

class OnBoardingScreeen extends StatefulWidget {
  const OnBoardingScreeen({super.key});

  @override
  State<OnBoardingScreeen> createState() => _OnBoardingScreeenState();
}

class _OnBoardingScreeenState extends State<OnBoardingScreeen> {
  String _selectedwords = 'Words';
  String _selectedpharases = 'pharases';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 23.0),
              child: Text(
                'What would you like to say?',
                style: TextStyle(
                    fontSize: 27,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Expand your vocabulary by selecting new words and pharases to learn. Chosse from a variety of categories and resources to improve your commnications skills and express yourself more effectively.',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 50,
            ),
            ListTile(
              leading: Radio<String>(
                overlayColor: const MaterialStatePropertyAll(Colors.black),
                activeColor: Colors.black,
                value: 'Words',
                groupValue: _selectedwords,
                onChanged: (value) {
                  setState(() {
                    _selectedwords = value!;
                  });
                },
              ),
              title: const Text('Words'),
            ),
            const Divider(
              endIndent: 30,
              indent: 30,
            ),
            ListTile(
              leading: Radio<String>(
                overlayColor: const MaterialStatePropertyAll(Colors.black),
                autofocus: true,
                activeColor: Colors.black,
                value: 'pharases',
                groupValue: _selectedpharases,
                onChanged: (value) {
                  setState(() {
                    _selectedpharases = value!;
                  });
                },
              ),
              title: const Text('pharases'),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 160.0),
                child: Container(
                    alignment: Alignment.center,
                    width: 0.44.sw,
                    height: 50,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.black,
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )),
              ),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
