import '../../../ablelyf.dart';

class AppointmentBookScreen extends StatefulWidget {
  final String name;
  final String specalist;
  final String image;
  const AppointmentBookScreen({
    super.key,
    required this.name,
    required this.specalist,
    required this.image,
  });

  @override
  AppointmentBookScreenState createState() => AppointmentBookScreenState();
}

class AppointmentBookScreenState extends State<AppointmentBookScreen> {
  TextEditingController ageController = TextEditingController();

  var focusNode = FocusNode();
  String? selectedValue = "18-25";
  List<String> dropDownDataList = ["18-25", "25-30", "30-50", "50 Above"];
  static final Map<String, String> genderMap = {
    'male': 'Male',
    'female': 'Female'
  };
  String selectedGender = genderMap.keys.first;

  List slots = ['10-11 AM', '1-2 PM', '2-4 PM', '5-6 PM'];

  int selectedSlot = 0;

  DateTime initialDate = DateTime.now().subtract(const Duration(days: 2));
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /* SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: AppColors.themeColor,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light),
    ); */
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 20,
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 0.1.sw,
                    backgroundColor: constants.themeColor2,
                    backgroundImage: AssetImage(widget.image),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dr ${widget.name}",
                          style: TextStyle(
                            // color: constants.themeColor,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          widget.specalist,
                          style: TextStyle(
                            color: constants.themeColor,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20.0),

            HorizontalCalendar(
              date: DateTime.now().add(const Duration(days: 1)),
              initialDate: initialDate,
              textColor: Colors.black54,
              backgroundColor: Colors.white,
              selectedColor: constants.themeColor,
              showMonth: true,
              locale: Localizations.localeOf(context),
              onDateSelected: (date) {
                // print('DATE: ${(date as DateTime)}');
                // appointmentController.getSlots(date: date);
              },
            ),
            const SizedBox(height: 30.0),

            // if (!appointmentController.loading)
            //   if ((appointmentController.slots?.slots ?? []).isEmpty)
            //     const Center(child: Text('No slots available'))
            //   else
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: constants.bg,
              ),
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(
                    text: 'Available Time',
                    fontColor: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 10.0),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: slots.length,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      crossAxisCount: 2,
                      childAspectRatio: 3,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return timeListItem(
                          data: slots[index],
                          index: index,
                          selectPosition: selectedSlot,
                          onClick: () {
                            setState(() {
                              selectedSlot = index;
                            });
                          });
                    },
                  ),
                ],
              ),
            ),
            /*    const SizedBox(height: 30.0),
            customText(
                text: 'Service',
                fontColor: Colors.black54,
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.start),
            const SizedBox(height: 5),
            Container(
              width: 1.sw,
              decoration: boxDecoration(color: Colors.grey[200], radius: 5.0),
              padding: const EdgeInsets.all(15.0),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<int>(
                  value: appointmentController.selectedService,
                  isDense: true,
                  isExpanded: true,
                  items: (doctorListController.doctor?.services ?? {})
                      .values
                      .map((e) => e.id)
                      .map<DropdownMenuItem<int>>(
                    (int dropDownData) {
                      return DropdownMenuItem<int>(
                        value: dropDownData,
                        child: customText(
                          fontColor: Colors.black,
                          textAlign: TextAlign.start,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                          text: doctorListController
                                  .doctor?.services[dropDownData]?.name ??
                              '',
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (v) {
                    appointmentController.selectedService = v;
                    appointmentController.update();
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            customText(
                text: 'Charges',
                fontColor: Colors.black54,
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.start),
            const SizedBox(height: 5),
            Container(
              width: 1.sw,
              decoration: boxDecoration(color: Colors.grey[200], radius: 5.0),
              padding: const EdgeInsets.all(15.0),
              child: Text((doctorListController
                      .doctor
                      ?.services[appointmentController.selectedService]
                      ?.charges)
                  .toString()),
            ),
            const SizedBox(height: 20),
           customText(
                    text: 'Patient Details',
                    fontColor: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.start),
                const SizedBox(height: 10.0),
                customText(
                    text: 'Full Name',
                    fontColor: Colors.black54,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.start),
                const SizedBox(height: 5),
                SizedBox(
                  height: 50,
                  child: CustomTextfield(
                    controller: ageController,
                    hint: "",
                    fillColor: Colors.grey[200],
                    radius: 5,
                  ),
                ),
                const SizedBox(height: 20),
                customText(
                    text: 'Age',
                    fontColor: Colors.black54,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.start),
                const SizedBox(height: 5),
                dropDownWidget(
                    context: context,
                    onChanged: (val) {
                      setState(() {
                        selectedValue = val;
                      });
                    },
                    selectedValue: selectedValue,
                    selectionList: dropDownDataList),
                const SizedBox(height: 20),
                customText(
                    text: 'Gender',
                    fontColor: Colors.black54,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.start),
                const SizedBox(height: 5),
                CupertinoRadioChoice(
                    choices: genderMap,
                    selectedColor: AppColors.themeColor,
                    notSelectedColor: Colors.black26,
                    onChange: onGenderSelected,
                    initialKeyValue: selectedGender),
                const SizedBox(height: 20), 
            customText(
                text: 'Write Your Problem',
                fontColor: Colors.black54,
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.start),
            const SizedBox(height: 5),*/
            // CustomTextfield(
            //   controller: appointmentController.textController,
            //   padding: const EdgeInsets.symmetric(horizontal: 15),
            //   hint: 'Write Your Problem',
            //   fillColor: Colors.grey[200],
            //   radius: 5,
            // ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const CureHome()));
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: constants.themeColor,
                ),
                width: 0.5.sw,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Book Appointment',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onGenderSelected(String genderKey) {
    setState(() {
      selectedGender = genderKey;
    });
  }
}

RoundedRectangleBorder roundedRectangleBorder({required double radius}) {
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      bottom: Radius.circular(radius),
    ),
  );
}

Widget customText({text, fontSize, fontColor, textAlign, fontWeight}) {
  return Text(
    text.toString(),
    textAlign: textAlign,
    style: TextStyle(
      color: fontColor,
      fontWeight: fontWeight,
      fontSize: fontSize,
    ),
  );
}

BoxDecoration boxDecorationBorder({color, borderColor, radius}) {
  return BoxDecoration(
      color: color,
      // border: Border.all(color: borderColor, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(radius)));
}

Widget timeListItem({onClick, var data, index, selectPosition}) {
  return GestureDetector(
    onTap: onClick,
    child: Container(
      decoration: boxDecorationBorder(
        // borderColor:
        //     selectPosition == index ? constants.themeColor : Colors.grey[400],
        radius: 10.0,
        color: selectPosition == index
            ? constants.themeColor
            : constants.themeColor2,
      ),
      alignment: Alignment.center,
      child: customText(
          text: data,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w400,
          fontSize: 15.0,
          fontColor: selectPosition == index ? Colors.white : Colors.black),
    ),
  );
}
