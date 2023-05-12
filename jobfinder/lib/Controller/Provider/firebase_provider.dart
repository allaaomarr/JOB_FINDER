

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
class FirebaseProvider extends ChangeNotifier {
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  var snapshot;
  ImagePicker imagePicker = ImagePicker();

  //UserModel registerUser = UserModel();
  GoogleSignIn googleSignIn = GoogleSignIn();
  List AllMassages = [];

  // List<UserModel>users=[];
  var scrollController = ScrollController();
  XFile? userImage;

  Image_Picker(String Camera) async {
    if (Camera == "cam") {
      userImage = await imagePicker.pickImage(source: ImageSource.camera);
      notifyListeners();
      // await firebaseStorage.ref().child("images/").child("${registerUser.id}")
      //  .putFile(File(userImage!.path));
      //   registerUser.photo=await firebaseStorage.ref().child("images/")
      //     .child("${registerUser.id}").getDownloadURL();
      return userImage!.readAsBytes();
    }
    else {
      userImage = await imagePicker.pickImage(source: ImageSource.gallery);
      notifyListeners();
      //   await firebaseStorage.ref().child("images/").child("${registerUser.id}")
      //  .putFile(File(userImage!.path));
    }
  }
}