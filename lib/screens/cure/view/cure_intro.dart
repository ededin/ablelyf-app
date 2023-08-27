import '../../../ablelyf.dart';

class AbleToCure extends StatefulWidget {
  const AbleToCure({super.key});

  @override
  State<AbleToCure> createState() => _AbleToCureState();
}

class _AbleToCureState extends State<AbleToCure> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFF114FFF),
      body: SafeArea(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(200),
                bottomRight: Radius.circular(200),
              ),
              child: Image.asset(CureImages.doctor),
            ),
            Text(
              "\nDoctor's Helpline\n\n",
              style: TextStyle(
                color: constants.themeColor,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const CureHome()));
              },
              child: Text(
                '\tGet Started\t',
                style: TextStyle(
                  color: constants.themeColor,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
