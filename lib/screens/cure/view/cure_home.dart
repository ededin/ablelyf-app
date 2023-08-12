import '../../../ablelyf.dart';

class CureHome extends StatelessWidget {
  const CureHome({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> names = [
      'Patrick',
      'Mary',
      'William',
      'Arthur',
    ];

    List<String> number = [
      '865-7638-5',
      '652-8734-3',
      '523-7634-2',
      '653-2798-5',
    ];

    List<String> specialist = [
      'Occupational therapist',
      'ENT Specialist',
      'Speech therapist',
      'Orthopedics',
    ];
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text('Cure'),
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
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: constants.secondary,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Image.asset(
                            CureImages.bone,
                            height: 0.06.sh,
                          ),
                        ),
                      ),
                      Text(
                        '\nPhysical',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: constants.secondary.withOpacity(0.5),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: constants.themeColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(15),
                          child: ImageIcon(
                            AssetImage(CureImages.brain),
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        '\nMental care',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: constants.themeColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: constants.secondary,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Image.asset(
                            CureImages.therapy,
                            height: 0.06.sh,
                          ),
                        ),
                      ),
                      Text(
                        '\nTherapy',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: constants.secondary.withOpacity(0.5),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                '\nSpecialist',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: constants.themeColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            for (int i = 0; i < 4; i++)
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AppointmentBookScreen(
                        name: names[i],
                        specalist: specialist[i],
                        image: 'assets/images/cure/doctor$i.png',
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: 0.1.sw,
                        backgroundColor: constants.secondary,
                        backgroundImage:
                            AssetImage('assets/images/cure/doctor$i.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dr ${names[i]}",
                              style: TextStyle(
                                color: constants.themeColor,
                              ),
                            ),
                            Text(
                              specialist[i],
                              style: TextStyle(
                                  // color: constants.themeColor,
                                  ),
                            ),
                            Text(
                              number[i],
                              style: TextStyle(
                                  // color: constants.themeColor,
                                  ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
