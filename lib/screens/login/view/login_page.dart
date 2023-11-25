import '../../../ablelyf.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginControlller loginControlller = Get.put(LoginControlller());

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                  width: 1.sw,
                  height: 0.4.sh,
                  margin: const EdgeInsets.only(bottom: 40),
                  color: Colors.black,
                  child: Image.asset('assets/logo/logo.png')),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    LoginPageString.username,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 0.01.sh,
                  ),
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      hintText: 'Enter Email',
                      hintStyle: const TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.grey)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.grey)),
                    ),
                  ),
                  SizedBox(
                    height: 0.02.sh,
                  ),
                  const Text(
                    LoginPageString.password,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 0.01.sh,
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      hintText: 'Enter password',
                      hintStyle: const TextStyle(color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.grey)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.grey)),
                    ),
                  ),
                  SizedBox(
                    height: 0.03.sh,
                  ),
                  InkWell(
                    onTap: () {
                      if (usernameController.text == '' ||
                          passwordController.text == '') {
                        commonFunction.snackbar('Please Fill The Details');
                      } else {
                        loginControlller.signinUser(
                          name: usernameController.text,
                          password: passwordController.text,
                        );
                      }
                    },
                    child: Container(
                      width: 400,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Text(
                        LoginPageString.login,
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.03.sh,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() {
                        return const AbleSeeCreateAccount();
                      });
                    },
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        LoginPageString.createAnAccount,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 30,
                  // ),
                  InkWell(
                    onTap: () {
                      Get.to(() {
                         return const Page1();
                      });
                    },
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        LoginPageString.createAnAccount,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
