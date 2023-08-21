import 'package:newp/screens/see/view/see_camera_page.dart';

import '../../../ablelyf.dart';

class AbleToSee extends StatefulWidget {
  const AbleToSee({Key? key}) : super(key: key);

  @override
  _AbleToSeeState createState() => _AbleToSeeState();
}

class _AbleToSeeState extends State<AbleToSee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: 0.95.sw,
            height: 0.58.sh,
            child: Image.network(
              'https://etimg.etb2bimg.com/photo/99033076.cms',
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 0.08.sh, bottom: 0.02.sh),
            child: const Text(
              AbleseeStrings.abletosee,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Text(
            AbleseeStrings.navigateYourSurroundingsWith,
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(
            height: 0.09.sh,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 0.12.sw,
                height: 0.12.sw,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.black),
                child: const Icon(
                  Icons.view_array_rounded,
                  color: Colors.white,
                ),
              ),
              Container(
                width: 0.12.sw,
                height: 0.12.sw,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.black),
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const SeeCameraPage());
                  // Get.to(const AbleSeeCreateAccount());
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 13, horizontal: 70),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.black),
                    child: const Text(
                      AbleseeStrings.getStarted,
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
