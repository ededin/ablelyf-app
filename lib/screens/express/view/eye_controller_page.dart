import '../../../ablelyf.dart';

class EyeControllerPage extends StatefulWidget {
  const EyeControllerPage({super.key});

  @override
  State<EyeControllerPage> createState() => _EyeControllerPageState();
}

class _EyeControllerPageState extends State<EyeControllerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 0.12.sh,
          ),
          const Text(
            ExprssEyeControllerStrings.eyeControlApp,
            style: TextStyle(
                fontSize: 26, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            ExprssEyeControllerStrings.controllYourComputerwithYoureyes,
            style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.normal),
          ),
          Padding(
            padding: EdgeInsets.only(top: 0.06.sh, bottom: 0.1.sh),
            child:
                Image.network('https://etimg.etb2bimg.com/photo/99033076.cms'),
          ),
          InkWell(
            onTap: () {
              Get.to(const EyeTypePage());
            },
            child: Container(
              width: 350,
              height: 55,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 50),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                ExprssEyeControllerStrings.getStarted,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(ExprssEyeControllerStrings.alreayUsing),
              SizedBox(
                width: 20,
              ),
              Text(ExprssEyeControllerStrings.sign)
            ],
          )
        ],
      ),
    );
  }
}
