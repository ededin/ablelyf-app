import 'package:flutter/material.dart';
import 'package:newp/ablelyf.dart';

class Librarypage extends StatefulWidget {
  const Librarypage({super.key, required this.ontap});
  final void Function(String) ontap;

  @override
  State<Librarypage> createState() => _LibrarypageState();
}

class _LibrarypageState extends State<Librarypage> {
  TextEditingController textEditingController = TextEditingController();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () {
              Get.dialog(func());
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            )),
        body: FutureBuilder(
          future: firebaseFirestore
              .collection('users')
              .doc(constants.myId)
              .collection('learnwords')
              .get(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return (snapshot.data!.docs.isNotEmpty)
                  ? GridView.builder(
                      itemCount: snapshot.data?.docs.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            widget.ontap.call(
                                snapshot.data?.docs[index].data()['word']);
                          },
                          child: Card(
                            child: Container(
                              height: 80,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                '${snapshot.data?.docs[index].data()['word']}',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: Text(
                      'No library Found',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic),
                    ));
            }
          },
        ));
  }

  Widget func() {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        const Text(
          'Type a Words',
          style: TextStyle(color: Colors.black),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          onChanged: (value) {},
          controller: textEditingController,
          decoration: InputDecoration(
            hintText: "Type Something",
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(50.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            textEditingController.text.isEmpty
                ? commonFunction.snackbar('Please Enter Something')
                : firebaseFirestore
                    .collection('users')
                    .doc(constants.myId)
                    .collection('learnwords')
                    .add({'word': textEditingController.text});
            Get.back();
          },
          child: Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(40.0)),
            child: const Text(
              'Save',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
          ),
        )
      ]),
    );
  }
}
