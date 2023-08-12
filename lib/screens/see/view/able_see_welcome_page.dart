import '../../../ablelyf.dart';

class AbleSeeWelcomePage extends StatefulWidget {
  const AbleSeeWelcomePage({super.key});

  @override
  State<AbleSeeWelcomePage> createState() => _AbleSeeWelcomePageState();
}

class _AbleSeeWelcomePageState extends State<AbleSeeWelcomePage> {
  TextEditingController searchController = TextEditingController();

  List categoriesList = [
    'Home',
    'Meet \n Someone',
    'Daily \n Activity',
    'Call a \n Friend',
  ];

  List<Icon> categoriesIcon = const [
    Icon(
      Icons.account_balance_outlined,
      size: 30,
    ),
    Icon(
      Icons.groups_2,
      size: 30,
    ),
    Icon(
      Icons.access_time_filled,
      size: 30,
    ),
    Icon(
      Icons.person,
      size: 30,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 0.13.sh,
            width: 1.sw,
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            color: const Color.fromARGB(255, 223, 222, 222),
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 0.12.sw,
                      height: 0.12.sh,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg'),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AbleseeWlcomeStrings.welcome,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Hellooo',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ],
                ),
                const Icon(Icons.pan_tool)
              ],
            ),
          ),
          Container(
            width: 0.9.sw,
            height: 0.15.sh,
            margin: const EdgeInsets.only(top: 15, bottom: 25),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 223, 222, 222),
                borderRadius: BorderRadius.circular(20)),
            child: const Text(
                'Stay Safe on your journey ! \n You have traveled 75% on your route',
                style: TextStyle(fontSize: 18)),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AbleseeWlcomeStrings.explore,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  AbleseeWlcomeStrings.settings,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
                ),
                Text(
                  AbleseeWlcomeStrings.profile,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 0.7.sw,
                  height: 0.07.sh,
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 231, 230, 230),
                        hintText: 'Search for destination',
                        hintStyle: const TextStyle(fontSize: 18),
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 25,
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50))),
                  ),
                ),
                Container(
                  width: 0.15.sw,
                  height: 0.06.sh,
                  decoration: const BoxDecoration(
                      color: Colors.black, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.tune,
                    color: Colors.white,
                    size: 18,
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 15),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                AbleseeWlcomeStrings.categories,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i <= 3; i++)
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() {
                            return const AbleSeeJourneyPage();
                          });
                        },
                        child: Container(
                          height: 0.1.sh,
                          width: 0.2.sw,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 231, 230, 230),
                              borderRadius: BorderRadius.circular(20)),
                          child: categoriesIcon[i],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        categoriesList[i],
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.normal),
                      ),
                    ],
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
