import '../../../ablelyf.dart';

class LoginControlller extends GetxController {
  bool loading = false;

  void createEmailAccount(
      {required String email,
      required String password,
      String? name,
      String? fullname,
      String? phone}) async {
    try {
      loading = true;
      update();
      if (password.length <= 8) {
        loading = false;
        update();
        commonFunction.snackbar('Enter more then 8 letters in password');
      } else {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        await appSharedPreference.setString(
            SharedPreferenceKeys.userId, credential.user!.uid);

        // constants.myId = credential.user!.uid;

        var user = FirebaseFirestore.instance
            .collection('users')
            .doc(credential.user!.uid)
            .set({
          'id': credential.user!.uid,
          'email': credential.user!.email,
          'name': name,
          'fullname': fullname,
          'phone': phone,
        });

        print('CREDENTIAL: ${credential}');
        print('USER: ${user}');
        commonFunction.snackbar('User Create Sucessfully');
        loading = false;
        update();
        Get.to(() {
          return const LoginPage();
        });
      }
    } on FirebaseAuthException catch (e) {
      loading = false;
      update();
      if (e.code == 'weak-password') {
        commonFunction.snackbar('The password provided is too weak.');

        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        commonFunction.snackbar('The account already exists for that email.');

        print('The account already exists for that email.');
      }
    } catch (e) {
      loading = false;
      update();
      print(e);
    }
  }

  void signinUser({required String name, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: name, password: password);
      print('CREDENTIAL: ${credential}');

      // constants.myId = credential.user!.uid;
      print('CONSTANTS.MYID: ${constants.myId}');
      if (credential.user?.uid != null) {
        Get.to(const ModuleSelect());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        commonFunction.snackbar('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        commonFunction.snackbar('Wrong password provided for that user.');
      }
    }
  }
}
