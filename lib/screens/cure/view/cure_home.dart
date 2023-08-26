import '../../../ablelyf.dart';

class CureHome extends StatefulWidget {
  const CureHome({super.key});

  @override
  State<CureHome> createState() => _CureHomeState();
}

class _CureHomeState extends State<CureHome> {
  List<Image> categoryImage = [
    Image.asset(
      CureImages.bone,
      height: 0.06.sh,
    ),
    Image.asset(
      CureImages.brain,
      height: 0.06.sh,
      color: Colors.white,
    ),
    Image.asset(
      CureImages.therapy,
      height: 0.06.sh,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text('Cure'),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() {
                  return const MyBookings();
                });
              },
              icon: const Icon(
                Icons.history,
                size: 25,
              )),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 10,
              ),
              child: TextField(
                // focusNode: focusNode,
                // controller: controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: constants.bg,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide(color: constants.bg),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide(color: constants.bg),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide(color: constants.bg),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide(color: constants.bg),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide(color: constants.bg),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide(color: constants.bg),
                  ),
                  hintText: 'Search / Type New...',
                  hintStyle: const TextStyle(color: Colors.black26),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: constants.themeColor,
                      ),
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                'Categories',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: constants.themeColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FutureBuilder(
                future: FirebaseFirestore.instance.collection('therapy').get(),
                builder: (context, snapData) {
                  print('snapData:------- ${snapData.data}');
                  if (snapData.data == null) {
                    return const SizedBox();
                  }

                  return SizedBox(
                    height: 150,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> therapyName =
                              snapData.data!.docs[index].data();

                          return Padding(
                            padding: const EdgeInsets.only(left: 30, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.to(CategoryList(
                                          catname:
                                              therapyName['typeof_therapy'],
                                          catId: therapyName['id'],
                                        ));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: constants.themeColor2,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: categoryImage[index]),
                                      ),
                                    ),
                                    Text(
                                      '\n${therapyName['typeof_therapy']}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: constants.themeColor2
                                            .withOpacity(0.5),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                  );
                }),
            Center(
              child: Text(
                'Specialist',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: constants.themeColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('therapyDoctor')
                    .get(),
                builder: (context, snap) {
                  if (snap.data == null) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return SizedBox(
                    height: 400,
                    child: ListView.builder(
                        itemCount: snap.data!.docs.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> doctorDetails =
                              snap.data!.docs[index].data();
                          return FutureBuilder(
                              future: FirebaseFirestore.instance
                                  .collection('therapyCategory')
                                  .where('id',
                                      isEqualTo: doctorDetails['category'])
                                  .get(),
                              builder: (context, snapshot) {
                                if (snapshot.data == null) {
                                  return const SizedBox();
                                }
                                return InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            AppointmentBookScreen(
                                          doctorid: doctorDetails['id'],
                                          name: doctorDetails['doctor_name'],
                                          specalist: snapshot.data!.docs[0]
                                              .data()['name'],
                                          image: doctorDetails['image'],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: const EdgeInsetsDirectional.all(8),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 0.07.sw,
                                          backgroundColor:
                                              constants.themeColor2,
                                          backgroundImage:
                                              CachedNetworkImageProvider(
                                                  doctorDetails['image']),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 25),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Dr ${doctorDetails['doctor_name']}",
                                                style: TextStyle(
                                                  color: constants.themeColor,
                                                ),
                                              ),
                                              Text(
                                                snapshot.data!.docs[0]
                                                    .data()['name'],
                                              ),
                                              Text(
                                                doctorDetails['phone'],
                                                style: const TextStyle(),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                        }),
                  );
                })
          ],
        ),
      ),
    );
  }
}
