import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final GoogleAuthCredential googleAuthCredential =
          GoogleAuthProvider.credential(
              idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

      await _auth.signInWithCredential(googleAuthCredential);
    } catch (e) {
      print(e);
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.disconnect();
    _auth.signOut();
  }
}
