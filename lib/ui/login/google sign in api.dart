// import 'package:google_sign_in/google_sign_in.dart';

// class GoogleSignInApi{

//   static final googleSignIn=  GoogleSignIn();
//   static Future<GoogleSignInAccount?> login()=> googleSignIn.signIn();
// }

import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//  GoogleSignIn _googleSignIn = GoogleSignIn(
//   scopes: ['email', 'profile'],
//   serverClientId: '444295710955-gdf6t4n2vu031tnqktktb4urldf3v194.apps.googleusercontent.com',
//   forceCodeForRefreshToken: true,
// );

Future<void> signInWithGoogle() async {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
    serverClientId:
        '444295710955-gdf6t4n2vu031tnqktktb4urldf3v194.apps.googleusercontent.com',
    forceCodeForRefreshToken: true,
  );
  try {
    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      print("User cancelled login");
      return;
    }

    print("Google displayName: ${googleUser.displayName}");
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    String accessToken = googleAuth.accessToken!;

    print("Google Access Token: $accessToken");
    print("Google ID Token: ${googleAuth.idToken}");
    Map<String, String> authHeaders = await googleUser.authHeaders;
    // print("========================================================");
    authHeaders.forEach((key, value) {
      print("$key: $value");
    });
    // print("========================================================");
    // print("Google ID Token: ${googleAuth.}");
    // Send this token to your backend
    var response = await http.post(
      Uri.parse('https://route-movie-apis.vercel.app/auth/login'),
          headers: authHeaders,
          
      // headers: {
      //   'Content-Type': 'application/json',
      //   'OAuth2.0': '$accessToken',
      // },
      // body: jsonEncode({'token': accessToken}),
    );
    
    

    // if (response.statusCode == 200) {
    //   var data = jsonDecode(response.body);
    //   print("Login successful: $data");
    //   // Save token/session if needed
    // } else {
    //   print("Login failed: ${response.body}");
    // }
  } catch (error) {
    print("Error during Google sign-in: $error");
  }
}

// Future<void> signInWithGoogle() async {
//   try {
//     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//     if (googleUser == null) {
//       print("User cancelled login");
//       return;
//     }

//     final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//     final String accessToken = googleAuth.accessToken!;

//     print("Google Access Token: $accessToken");

//     // Get user info from Google API
//     final userInfoResponse = await http.get(
//       Uri.parse('https://www.googleapis.com/oauth2/v2/userinfo'),
//       headers: {'Authorization': 'Bearer $accessToken'},
//     );

//     if (userInfoResponse.statusCode != 200) {
//       print("Failed to get user info");
//       return;
//     }

//     final userInfo = jsonDecode(userInfoResponse.body);
//     final String email = userInfo['email'];

//     print("User Email: $email");

//     // Send email & token to your backend
//     final response = await http.post(
//       Uri.parse('https://your-api.com/auth/google'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({
//         'email': email,
//         'googleToken': accessToken,
//       }),
//     );

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       print("Login successful: $data");
//     } else {
//       print("Login failed: ${response.body}");
//     }
//   } catch (error) {
//     print("Error during Google sign-in: $error");
//   }
// }
