import '../../ablelyf.dart';

class ModuleSelect extends StatelessWidget {
  const ModuleSelect({super.key});

  @override
  Widget build(BuildContext context) {
    List<Pharses> modules = [
      Pharses(message: "Able to Talk", image: ModulesImages.talk),
      Pharses(message: "Able to Express", image: ModulesImages.express),
      Pharses(message: "Able to See", image: ModulesImages.see),
      Pharses(message: "Able to Buy", image: ModulesImages.buy),
      Pharses(message: "Able to Cure", image: ModulesImages.cure),
      Pharses(message: "Able to Learn", image: ModulesImages.learn),
      Pharses(message: "Able To Socialize", image: ModulesImages.social),
    ];
    return Scaffold(
      backgroundColor: const Color(0xffF2F5FF),
      appBar: AppBar(
        title: Image.asset(
          AppIcons.logo,
          width: 0.4.sw,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Wrap(
              children: [
                for (int i = 0; i < 6; i++)
                  InkWell(
                    onTap: () {
                      switch (i) {
                        case 0:
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AbleToTalk()));
                          break;
                        case 1:
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AbleToExpress()));
                          break;
                        case 2:
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AbleToSee()));
                          break;
                        case 3:
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AbleToBuy()));
                          break;
                        case 4:
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AbleToCure()));
                          break;

                        case 5:
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AbletoLearn()));
                          break;
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.all(0.05.sw),
                      height: 0.4.sw,
                      width: 0.4.sw,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Image.asset(
                              modules[i].image,
                              height: 0.22.sw,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(modules[i]
                                    .message
                                    .split(' ')
                                    .sublist(0, 2)
                                    .join(' ')),
                                Text(
                                  ' ${modules[i].message.split(' ').last}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AbleToSocial(),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 0.05.sw,
                      vertical: 0.03.sw,
                    ),
                    height: 0.35.sw,
                    width: 0.8.sw + 0.1.sw,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          modules[6].image,
                          height: 0.22.sw,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 8),
                              child: Row(
                                children: [
                                  Text(modules[6]
                                      .message
                                      .split(' ')
                                      .sublist(0, 2)
                                      .join(' ')),
                                  Text(
                                    ' ${modules[6].message.split(' ').last}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Pharses {
  final String message;
  final String image;

  Pharses({required this.message, required this.image});

  factory Pharses.fromJson(String pharses) {
    Map<String, dynamic> json = jsonDecode(pharses);

    return Pharses(message: json['message'], image: json['image']);
  }

  String toJson() => jsonEncode({'message': message, 'image': image});
}
