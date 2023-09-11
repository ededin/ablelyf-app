import 'package:newp/screens/learn/view/talk_intro_page.dart';

import '../../../ablelyf.dart';

class AbletoLearn extends StatefulWidget {
  const AbletoLearn({super.key});

  @override
  State<AbletoLearn> createState() => _AbletoLearnState();
}

class _AbletoLearnState extends State<AbletoLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 0.6.sh,
              width: 1.sw,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://etimg.etb2bimg.com/photo/99033076.cms'),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'Able To Talk',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Autism',
            style: TextStyle(
                color: Colors.black26,
                fontWeight: FontWeight.w700,
                fontSize: 17,
                fontStyle: FontStyle.normal),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    color: Colors.black, shape: BoxShape.circle),
                child: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    color: Colors.black, shape: BoxShape.circle),
                child: const Icon(
                  Icons.tag,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TalkIntroPage(),
                    ),
                  );
                },
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
                      'Get started',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )),
              )
            ],
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
