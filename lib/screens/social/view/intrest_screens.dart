
import '../../../ablelyf.dart';

class IntrestScreens extends StatefulWidget {
  const IntrestScreens({super.key});

  @override
  State<IntrestScreens> createState() => _IntrestScreensState();
}

class _IntrestScreensState extends State<IntrestScreens> {
  List<String> image = [
    'https://wallpaperaccess.com/full/343567.jpg',
    'https://images.unsplash.com/photo-1606819717115-9159c900370b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YXJ0cyUyMGFuZCUyMGN1bHR1cmV8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
    'https://img.freepik.com/free-photo/close-up-doctor-with-stethoscope_23-2149191355.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdO6Kiazj65p5Nukkkg601W5fcgzKjQKWIOSqo1PEa&s',
  ];

  List<String> title = [
    'Sports And Recreation',
    'Arts And Culture',
    'Health and Wellness',
    'Technology and Innovation',
  ];

  List<String> sub = [
    'Explore new sports',
    'Discover new art forms',
    'Improve your well being',
    'Stay updated with the latest tech trends',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What are your interests?',
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                  fontSize: 27),
            ),
            SizedBox(
              height: 60,
            ),
            const Text(
              'Interest is a feeling or emotion that causes attention to focus on an object, event, or process. In contemporary psychology of interest, the term is used as a general concept that may encompass other more specific psychological terms, such as curiosity and to a much lesser degree surprise.',
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.normal,
                  fontSize: 15),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: image.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        child: Container(
                          height: 70,
                          width: 0.30.sw,
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    image[index],
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title[index],
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(color: Colors.black87, fontSize: 18),
                          ),
                          Text(
                            sub[index],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(color: Colors.black38, fontSize: 11),
                          )
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
            InkWell(
              onTap: (){
                Get.to(BottomPageSocial());

              },
              child: Padding(
                padding: const EdgeInsets.only(left: 170.0),
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
                      'Continue',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )),
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
