import 'package:newp/ablelyf.dart';

class SeeCameraPage extends StatelessWidget {
  const SeeCameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CachedNetworkImage(
        imageUrl:
            'https://uploads-ssl.webflow.com/624ac40503a527cf47af4192/6355c00cd7135d206b033692_Object%20Detection%20and%20Person%20Detection%20in%20Computer%20Vision.png',
        height: 1.sh,
        width: 1.sw,
        fit: BoxFit.fitHeight,
        placeholder: (context, url) {
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const AbleSeeCreateAccount());
        },
        child: const Icon(Icons.home),
      ),
    );
  }
}
