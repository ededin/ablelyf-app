import 'package:flutter/material.dart';
import 'package:newp/ablelyf.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'User name',
                style: TextStyle(fontSize: 13, color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 0.25.sw,
                height: 0.12.sw,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Age',
                style: TextStyle(fontSize: 13, color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 0.25.sw,
                height: 0.12.sw,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Disability Type',
                style: TextStyle(fontSize: 13, color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Get.to(() {
                    return const Page2();
                  });
                },
                child: Container(
                  width: 0.25.sw,
                  height: 0.12.sw,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
