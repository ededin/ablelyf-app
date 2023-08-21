import 'package:flutter/material.dart';
import 'package:newp/utils/utils.dart';

class TalkFindScreen extends StatelessWidget {
  const TalkFindScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Find Interpreter",
          style: TextStyle(
            color: constants.themeColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(radius: 0.03.sw),
        ),
        actions: [
          Icon(
            Icons.search,
            color: constants.themeColor,
            size: 30,
          ),
          SizedBox(width: 0.05.sw)
        ],
        backgroundColor: constants.secondary,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              contentPadding: const EdgeInsets.only(left: 20, bottom: 20),
              hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 30,
                color: constants.themeColor,
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: constants.themeColor.withOpacity(0.1),
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: constants.themeColor.withOpacity(0.1),
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: constants.themeColor.withOpacity(0.1),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 0.05.sw),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Contacts",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 22,
                  color: constants.themeColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
            child: ListTile(
              tileColor: const Color(0xffF1CDCD),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
              ),
              leading: const CircleAvatar(),
              title: const Text("Mr. Hann"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: constants.secondary,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: constants.themeColor),
                    ),
                    child: Icon(
                      Icons.call,
                      color: constants.themeColor,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: constants.secondary,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: constants.themeColor),
                    ),
                    child: Icon(
                      Icons.mail,
                      color: constants.themeColor,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 2),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
            child: ListTile(
              tileColor: const Color(0xffF1CDCD),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
              leading: const CircleAvatar(),
              title: const Text("Mr. Barker"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: constants.secondary,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: constants.themeColor),
                    ),
                    child: Icon(
                      Icons.call,
                      color: constants.themeColor,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: constants.secondary,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: constants.themeColor),
                    ),
                    child: Icon(
                      Icons.mail,
                      color: constants.themeColor,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
