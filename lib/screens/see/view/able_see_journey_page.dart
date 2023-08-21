import '../../../ablelyf.dart';

class AbleSeeJourneyPage extends StatefulWidget {
  const AbleSeeJourneyPage({super.key});

  @override
  State<AbleSeeJourneyPage> createState() => _AbleSeeJourneyPageState();
}

class _AbleSeeJourneyPageState extends State<AbleSeeJourneyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 45, bottom: 20),
              child: Row(
                children: [
                  Container(
                    width: 0.12.sw,
                    height: 0.05.sh,
                    margin: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                        color: Colors.black, shape: BoxShape.circle),
                    child: const Icon(
                      Icons.directions_walk,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    AbleSeeJourneyStrings.journeyStatistics,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Container(
              width: 1.sw,
              height: 0.11.sh,
              decoration: BoxDecoration(
                  color: constants.lightgrey,
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your journey details',
                        style: TextStyle(fontSize: 11),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          'Total time: 1h 30',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 0.45.sw,
                    height: 0.05.sh,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(50)),
                    child: const Text(
                      'Start tracking journey',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 25, bottom: 10),
              child: Text(
                AbleSeeJourneyStrings.thisWeekStatistics,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              width: 1.sw,
              height: 0.3.sh,
              padding: const EdgeInsets.only(left: 20, top: 10),
              decoration: BoxDecoration(
                  color: constants.lightgrey,
                  borderRadius: BorderRadius.circular(25)),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AbleSeeJourneyStrings.averageJourneytime,
                    style: TextStyle(fontSize: 15),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      '${72} ${AbleSeeJourneyStrings.minutesOnAverage}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 25, bottom: 10),
              child: Text(
                AbleSeeJourneyStrings.friendJourneyActivity,
                style: TextStyle(fontSize: 20),
              ),
            ),
            for (int i = 0; i <= 1; i++)
              InkWell(
                onTap: () {
                  Get.to(() {
                    return const AbleSeeProfilePage();
                  });
                },
                child: Container(
                    width: 1.sw,
                    height: 0.12.sh,
                    margin: const EdgeInsets.only(bottom: 8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: constants.lightgrey,
                        borderRadius: BorderRadius.circular(25)),
                    child: ListTile(
                      leading: const CircleAvatar(
                        maxRadius: 20,
                        backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww&w=1000&q=80'),
                      ),
                      title: const Text(
                        'John Kumar',
                        style: TextStyle(fontSize: 18),
                      ),
                      subtitle: const Text(
                        'moring commute',
                        style: TextStyle(fontSize: 12),
                      ),
                      trailing: Container(
                        height: 0.05.sh,
                        width: 0.3.sw,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(50)),
                        child: const Text(
                          AbleSeeJourneyStrings.sendChallenge,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )),
              ),
          ],
        ),
      ),
    );
  }
}
