import 'package:newp/ablelyf.dart';

class SelectStudentPage extends StatefulWidget {
  const SelectStudentPage({super.key});

  @override
  State<SelectStudentPage> createState() => _SelectStudentPageState();
}

class _SelectStudentPageState extends State<SelectStudentPage> {
  int? selectStudent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Student"),
      ),
      body: Center(
        child: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection("students")
              .orderBy('studentId')
              .withConverter(
            fromFirestore: (snapshot, options) {
              return Student.fromJson(snapshot.data() ?? {});
            },
            toFirestore: (value, options) {
              return value.toJson();
            },
          ).get(),
          builder: (context, snapshot) {
            if (snapshot.hasData && (snapshot.data?.docs ?? []).isNotEmpty) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropdownButton<int>(
                    hint: const Text("Select Student"),
                    value: selectStudent,
                    items: snapshot.data?.docs
                        .map(
                          (e) => DropdownMenuItem<int>(
                            value: e.data().studentId,
                            child: Text(e.data().name),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectStudent = value;
                      });
                      // Get.to(() => const GestureGamePage(
                      //     url: 'https://ablelyf-project.web.app/'));
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => GestureGamePage(
                          url:
                              'https://ablelyf-project.web.app/?userId=$selectStudent'));
                    },
                    child: const Text("Go"),
                  ),
                ],
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

class Student {
  final int studentId; // Add studentId field
  final String name;
  final int age;
  final String dob;

  Student({
    required this.studentId,
    required this.name,
    required this.age,
    required this.dob,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      studentId: json['studentId'] ?? 0,
      name: json['name'] ?? '',
      age: json['age'] ?? 0,
      dob: json['dob'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'studentId': studentId,
      'name': name,
      'age': age,
      'dob': dob,
    };
  }
}
