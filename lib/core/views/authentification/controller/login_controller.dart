// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:locahub/core/views/homepage/view/widget/bottom_navbar/home.dart';

// class LoginController extends GetxController {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn googleSignIn = GoogleSignIn();

//   loginWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleSignInAccount =
//           await googleSignIn.signIn();
//       final GoogleSignInAuthentication? googleSignInAuthentication =
//           await googleSignInAccount?.authentication;
//       final AuthCredential? credential = googleSignInAuthentication != null
//           ? GoogleAuthProvider.credential(
//               accessToken: googleSignInAuthentication.accessToken,
//               idToken: googleSignInAuthentication.idToken,
//             )
//           : null;
//       final authResult = credential != null
//           ? await _auth.signInWithCredential(credential)
//           : null;
//       if (authResult == null) {
//         throw Exception('Failed to sign in with Google');
//       }

//       final User? user = authResult.user;
//       assert(user?.isAnonymous != true);
//       assert(await user?.getIdToken() != null);
//       final User? currentUser = _auth.currentUser;
//       assert(user?.uid == currentUser?.uid);

//       Get.offAll(() => const Home());
//     } catch (e) {
//       throw e;
//     }
//   }

//   Future<void> logoutGoogle() async {
//     await googleSignIn.signOut();
//     Get.back(); // navigate to your wanted page after logout.
//   }
// }

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:locahub/core/services/network_services/api_services.dart';
import 'package:locahub/core/views/homepage/view/widget/bottom_navbar/home.dart';

import '../../../services/pref_services/user_pref_service.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;
      final AuthCredential? credential = googleSignInAuthentication != null
          ? GoogleAuthProvider.credential(
              accessToken: googleSignInAuthentication.accessToken,
              idToken: googleSignInAuthentication.idToken,
            )
          : null;
      final authResult = credential != null
          ? await _auth.signInWithCredential(credential)
          : null;
      if (authResult == null) {
        throw Exception('Failed to sign in with Google');
      }
      String? accessToken = googleSignInAuthentication?.accessToken;
      String? username = googleSignInAccount?.email.split('@').first;
      final User? user = authResult.user;
      assert(user?.isAnonymous != true);
      assert(await user?.getIdToken() != null);
      // String? tok = await user?.getIdToken();
      // final User? currentUser = _auth.currentUser;
      ApiService().postData(uri: "login-sosmed", body: {
        'email': googleSignInAccount?.email,
        'password': accessToken,
        'provider_by': 'google',
        'provider_id': accessToken,
        'username': username,
        'name': googleSignInAccount?.displayName
      }).then((value) {
        print(value.body);
        if (value.statusCode == 200) {
          var jsonData = jsonDecode(value.body);
          UserPrefService().writeToken(jsonData["data"]["access_token"]);
          UserPrefService().writeUser(jsonData["data"]["user"]);
          Get.offAll(() => const Home());
        } else {
          throw Exception('Failed to sign in with Google');
        }
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logoutGoogle() async {
    await googleSignIn.signOut();
    Get.back(); // navigate to your wanted page after logout.
  }
}
