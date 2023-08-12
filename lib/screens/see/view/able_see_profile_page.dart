import '../../../ablelyf.dart';

class AbleSeeProfilePage extends StatefulWidget {
  const AbleSeeProfilePage({super.key});

  @override
  State<AbleSeeProfilePage> createState() => _AbleSeeProfilePageState();
}

class _AbleSeeProfilePageState extends State<AbleSeeProfilePage> {
  List<Icon> categoriesIcon = const [
    Icon(
      Icons.toc,
      size: 40,
    ),
    Icon(
      Icons.flag,
      size: 40,
    ),
    Icon(
      Icons.monetization_on,
      size: 40,
    ),
  ];

  List categoriesList = [
    'Achiveme',
    'Journey',
    'Total',
  ];

  List categoriesSubList = [
    'No \n Achivements',
    '0 Km',
    '0',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.settings,
                    size: 30,
                  ),
                  Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        margin: const EdgeInsets.only(top: 50),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: const DecorationImage(
                                image: NetworkImage(
                                    'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                                fit: BoxFit.cover)),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 5),
                        child: Text(
                          'Profile Settings',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      const Text(
                        'Username:@data.com',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.person_add_alt_1,
                    size: 30,
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 25, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text('15'),
                        Text('Followers:89'),
                      ],
                    ),
                    VerticalDivider(
                      thickness: 2,
                      width: 20,
                      color: Colors.grey,
                    ),
                    Column(
                      children: [
                        Text('15'),
                        Text('Following:46'),
                      ],
                    ),
                  ],
                ),
              ),
              const Text(
                'My Statistics',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (int i = 0; i <= 2; i++)
                    Column(
                      children: [
                        categoriesIcon[i],
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          categoriesList[i],
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          categoriesSubList[i],
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Leaderboard',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 19,
                  )
                ],
              ),
              SizedBox(
                width: 1.sw,
                height: 0.3.sh,
                child: DataTable2(
                  dataRowColor: MaterialStateProperty.all(Colors.transparent),
                  columnSpacing: 0.5,
                  columns: [
                    DataColumn(
                      label: Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'All time',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF6B778C),
                          ),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'Today',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF6B778C),
                            ),
                          ),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'Week',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF6B778C),
                            ),
                          ),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          alignment: Alignment.center,
                          child: const Text(
                            'Month',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF6B778C),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                  rows: List<DataRow>.generate(
                    4,
                    (index) => DataRow(
                      cells: [
                        DataCell(
                          Container(
                            alignment: Alignment.center,
                            child: const Text(
                              '#1',
                              style: TextStyle(
                                  color: Color(0xFF172B4D), fontSize: 14),
                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            alignment: Alignment.center,
                            child: const CircleAvatar(
                                radius: 15,
                                backgroundImage: NetworkImage(
                                    'https://image.shutterstock.com/image-photo/young-handsome-man-beard-wearing-260nw-1768126784.jpg')),
                          ),
                        ),
                        DataCell(
                          Container(
                            alignment: Alignment.center,
                            child: const Text(
                              'Clinton',
                              style: TextStyle(
                                  color: Color(0xFF172B4D), fontSize: 10),
                            ),
                          ),
                        ),
                        DataCell(
                          Container(
                            alignment: Alignment.center,
                            child: const Text(
                              '0',
                              style: TextStyle(
                                  color: Color(0xFF172B4D), fontSize: 14),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Text(
                'Achievements',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
              for (int i = 0; i <= 2; i++)
                Container(
                  width: 1.sw,
                  height: 0.15.sh,
                  margin: const EdgeInsets.only(bottom: 10, top: 10),
                  decoration: BoxDecoration(
                      color: constants.lightgrey,
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'No Achievements',
                            style: TextStyle(fontSize: 18),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              'No Achievements',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          Container(
                            width: 0.8.sw,
                            padding: const EdgeInsets.only(top: 10),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Progress',
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  '7347/08',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
