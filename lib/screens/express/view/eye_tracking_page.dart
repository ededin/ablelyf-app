import '../../../ablelyf.dart';

class AbleToExpress extends StatefulWidget {
  const AbleToExpress({super.key});

  @override
  State<AbleToExpress> createState() => _AbleToExpressState();
}

class _AbleToExpressState extends State<AbleToExpress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: 1.sh,
            height: 1.sh,
            child: const Image(
              image: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvQYt5KjizQTCevV7ge8fFeb_Gx_1KNRN3zQ&usqp=CAU'),
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(const EyeControllerPage());
                  },
                  child: Container(
                    width: 250,
                    height: 250,
                    margin: const EdgeInsets.only(bottom: 50),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white, width: 5)),
                  ),
                ),
                const Text(
                  ExpressStrings.eyeTrackingCalibration,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
