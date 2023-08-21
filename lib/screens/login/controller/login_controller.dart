import '../../../ablelyf.dart';

class LoginControlller extends GetxController {
  void createEmailAccount(
      {required String email,
      required String password,
      String? name,
      String? fullname,
      String? address}) async {
    try {
      if (password.length <= 8) {
        print('The password provided is too weak.');
      } else {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        print('CREDENTIAL: ${credential}');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
