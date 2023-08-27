import '../../../ablelyf.dart';

class DoctorList extends StatefulWidget {
  const DoctorList({super.key, required this.doctorId});

  final String doctorId;

  @override
  State<DoctorList> createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor List'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 20,
            )),
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('therapyDoctor')
              .where('category', isEqualTo: widget.doctorId)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text('No Doctor Avaiale'),
              );
            }

            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> data = snapshot.data!.docs[index].data();

                return Container(
                  margin: const EdgeInsetsDirectional.all(8),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 0.07.sw,
                        backgroundColor: constants.themeColor2,
                        backgroundImage:
                            CachedNetworkImageProvider(data['image']),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dr ${data['doctor_name']}",
                              style: TextStyle(
                                color: constants.themeColor,
                              ),
                            ),
                            Text(
                              data['phone'],
                              style: const TextStyle(),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          }),
    );
  }
}
