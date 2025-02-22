import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi{

  static final googleSignIn=  GoogleSignIn();
  static Future<GoogleSignInAccount?> login()=> googleSignIn.signIn();
}




// Future<void> GoogleSignInApi() async {
//   try {
//      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//     if (googleUser == null) {
//       print("Google Sign-In was canceled or failed.");
//       return;
//     }

//      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

//     // Ensure tokens are not null
//     if (googleAuth.accessToken == null || googleAuth.idToken == null) {
//       print("Access token or ID token is null.");
//       return;
//     }else{
//     print("=========================================");
//     print(googleAuth.accessToken);
//     print(googleAuth.idToken);
//     print("==============================================");
//     }

//     // Send tokens to your backend API
//      String accessToken = googleAuth.accessToken!;
//      String idToken = googleAuth.idToken!;

//     // Call your API to authenticate the user
//     // await yourApiLoginMethod(accessToken, idToken);
//   } catch (error) {
//     print("Error signing in with Google: $error");
//   }
// }
