import '../../../ablelyf.dart';

class AbleSeeCreateAccount extends StatefulWidget {
  const AbleSeeCreateAccount({super.key});

  @override
  State<AbleSeeCreateAccount> createState() => _AbleSeeCreateAccountState();
}

class _AbleSeeCreateAccountState extends State<AbleSeeCreateAccount> {
  LoginControlller loginControlller = Get.put(LoginControlller());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                height: 1.sh,
                width: 1.sw,
              ),
              Positioned(
                top: 0,
                child: Container(
                  width: 1.sw,
                  height: 0.35.sh,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://vsthemes.org/uploads/posts/2020-07/1594034787_screenshot_1.webp'),
                          fit: BoxFit.fill)),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AbleCreateaccountStrings.welcome,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          AbleCreateaccountStrings
                              .discoverYourSurroundingsStaySafe,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.normal),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: 1.sw,
                height: 0.7.sh,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 242, 241, 241),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          AbleCreateaccountStrings.createanAccount,
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 0.1.sw,
                          height: 0.1.sw,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.grey[200]),
                          child: const Icon(
                            Icons.remove_red_eye,
                            size: 19,
                          ),
                        ),
                      ],
                    ),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                          hintText: 'Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    TextField(
                      controller: fullnameController,
                      decoration: InputDecoration(
                          hintText: 'Full Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    TextField(
                      controller: phoneController,
                      decoration: InputDecoration(
                          hintText: 'Phome',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    InkWell(
                      onTap: () {
                        if (emailController.text != '' &&
                            passwordController.text != '') {
                          loginControlller.createEmailAccount(
                            email: emailController.text,
                            password: passwordController.text,
                            name: nameController.text,
                            fullname: fullnameController.text,
                            phone: phoneController.text,
                          );
                        } else {
                          commonFunction.snackbar('Please fill yhe details');
                        }
                      },
                      child: Container(
                        width: 1.sw,
                        height: 0.06.sh,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: const Text(
                          'Continue',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
