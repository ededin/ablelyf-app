import '../../../ablelyf.dart';

class ChooseSituationPage extends StatefulWidget {
  const ChooseSituationPage({super.key});

  @override
  State<ChooseSituationPage> createState() => _ChooseSituationPageState();
}

class _ChooseSituationPageState extends State<ChooseSituationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.arrow_back,
          size: 20,
          color: Colors.black,
        ),
        centerTitle: true,
        title: const Text(
          ChooseSituationPageStrings.eyeControl,
          style: TextStyle(color: Colors.black),
        ),
        actions: const [
          Icon(
            Icons.search,
            size: 20,
            color: Colors.black,
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
                width: 250,
                height: 50,
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 50),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  ChooseSituationPageStrings.chooseYourSituation,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.network(
                          'https://www.pngitem.com/pimgs/m/277-2773333_transparent-eating-clipart-png-black-food-vector-png.png')),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    ChooseSituationPageStrings.breakFast,
                    style: TextStyle(fontSize: 19),
                  )
                ],
              ),
              const SizedBox(
                width: 50,
              ),
              Column(
                children: [
                  Container(
                      width: 100,
                      height: 100,
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgktK7NLwjYw7vYImeQsU4wSL3sd4a_JzUzdVmEeJJ3Y1Zxr6RQWfJP8AaoqFLA2EbYqw&usqp=CAU')),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    ChooseSituationPageStrings.lunch,
                    style: TextStyle(fontSize: 19),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.network(
                          'https://e7.pngegg.com/pngimages/614/789/png-clipart-round-black-spoon-and-fork-buffet-breakfast-food-cafe-restaurant-spoon-and-fork-food-breakfast-thumbnail.png')),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    ChooseSituationPageStrings.dinnerOption,
                    style: TextStyle(fontSize: 19),
                  )
                ],
              ),
              const SizedBox(
                width: 50,
              ),
              Column(
                children: [
                  Container(
                      width: 100,
                      height: 100,
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmvZvhJu7TUfNsfTZ5NV_kyoRJWv2awoYjmA&usqp=CAU')),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    ChooseSituationPageStrings.coffeeShops,
                    style: TextStyle(fontSize: 19),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                      width: 100,
                      height: 100,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.network(
                          'https://cdn-icons-png.flaticon.com/512/4232/4232124.png')),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    ChooseSituationPageStrings.callSomeone,
                    style: TextStyle(fontSize: 19),
                  )
                ],
              ),
              const SizedBox(
                width: 50,
              ),
              Column(
                children: [
                  Container(
                      width: 100,
                      height: 100,
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.network(
                          'https://i.pinimg.com/originals/4d/f5/9f/4df59fdb5006fdbf1a36b0b3521b7937.png')),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    ChooseSituationPageStrings.watchTv,
                    style: TextStyle(fontSize: 19),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
