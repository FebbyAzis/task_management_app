import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task_management_app/app/routes/app_pages.dart';

class AuthController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  UserCredential? _userCredential;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController searchFriendsController;

   @override
  void onInit() {
    super.onInit();
    searchFriendsController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    searchFriendsController.dispose();
     }

  Future<void> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

print(googleUser!.email);
  // Once signed in, return the UserCredential
   await auth
  .signInWithCredential(credential)
  .then((value) =>_userCredential = value);

  // firebase

  CollectionReference users = firestore.collection('users');
final cekUsers = await users.doc(googleUser.email).get();
if (!cekUsers.exists) {
  users.doc(googleUser.email).set({
    'uid':_userCredential!.user!.uid,   
    'name':googleUser.displayName,
    'email':googleUser.email,
    'photo':googleUser.photoUrl,
    'createdAt': _userCredential!.user!.metadata.creationTime.toString(),
    'lastLoginAt':
    _userCredential!.user!.metadata.lastSignInTime.toString(),
   // 'list_cari': [A,AZ,AZI,AZIS]
  }).then((value) async {
    String temp = '';
    try {
      for (var i = 0; i < googleUser.displayName!.length; i++) {
        temp = temp + googleUser.displayName![i];
        await users.doc(googleUser.email).set({
          'list_cari': FieldValue.arrayUnion([temp.toUpperCase()])
        }, SetOptions(merge: true));
      }
    } catch (e) {
      print(e);
      
    }
  });
  
} else{
  users.doc(googleUser.email).update({
    'lastLoginAt':
    _userCredential!.user!.metadata.lastSignInTime.toString(),

  });
}

Get.offAllNamed(Routes.HOME);
}

Future logout() async {
  await FirebaseAuth.instance.signOut();
  await GoogleSignIn().signOut();
  Get.offAllNamed(Routes.LOGIN);
}

var kataCari = [].obs;
var hasilPencarian = [].obs;
void searchFriend(String keyword) async{
CollectionReference users = firestore.collection('users');

  if (keyword.isNotEmpty) {
   final hasilQuery =  await users
   .where('list_cari', arrayContains: keyword.toUpperCase())
   .get();
   if (hasilQuery.docs.isNotEmpty) {
     for (var i = 0; i < hasilQuery.docs.length; i++) {
      kataCari.add(hasilQuery.docs[i].data() as Map<String, dynamic>);
       
     }
   }

   if (kataCari.isNotEmpty) {
    hasilPencarian.value = [];
    kataCari.forEach((element) {
      print(element);
      hasilPencarian.add(element);
    });
    kataCari.clear();
     
   }
  } else{
    kataCari.value = [];
    hasilPencarian.value = [];
  }
  kataCari.refresh();
  hasilPencarian.refresh();
}
void addFriends(String_emailFriends) async { 
  CollectionReference friends = firestore.collection('friends');

  final cekFriends = await friends.doc(auth.currentUser!.email).get();
  //cek data ada atau tidak
  if (cekFriends.data() == null) {
    await friends.doc(auth.currentUser!.email).set({
      'emailMe': auth.currentUser!.email,
      'emailFriends': [String_emailFriends],
    }).whenComplete(() => Get.snackbar("Friends", "Friends successfully added"));
  }else{
    await friends.doc(auth.currentUser!.email).set({
      'emailFriends': FieldValue.arrayUnion([String_emailFriends]),
    }, SetOptions(merge: true)).whenComplete(
      () => Get.snackbar("Friends", "Friends successfully added"));
  }
  kataCari.clear();
  hasilPencarian.clear();
  searchFriendsController.dispose();
  Get.back();
}
// Future <QuerySnapshot<Map<String,dynamic>>> getPeople()async{
//   CollectionReference users = firestore.collection('users');

//   return;  
// }
}