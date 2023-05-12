import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jobfinder/View/widgets/transparent_button.dart';
import 'package:provider/provider.dart';

import '../../Controller/Provider/register_provider.dart';
import '../../styles/app_theme.dart';
import '../../utilities/app_images.dart';
import '../../utilities/app_strings.dart';

class google_facebook extends StatefulWidget {
  String text;
 google_facebook({required this.text});

  @override
  State<google_facebook> createState() => _google_facebookState();
}
FirebaseStorage firebaseStorage = FirebaseStorage.instance;
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore fireStore = FirebaseFirestore.instance;
var snapshot;


GoogleSignIn googleSignIn = GoogleSignIn();
List AllMassages=[];
Map<String, dynamic>? _userData;
AccessToken? _accessToken;
bool _checking = true;
var scrollController =ScrollController();
class _google_facebookState extends State<google_facebook> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15,),
        Row(
          children: [
            Expanded(
              child: Divider(
                indent: 1.0,
                endIndent: 10.0,
                thickness: 1,
              ),
            ),
            Text(widget.text,style: TextStyle(color: AppTheme.lightunclickedColor),),
            Expanded(
              child: Divider(
                indent: 10.0,
                endIndent: 1.0,
                thickness: 1,
              ),
            ),
          ],
        ),
        SizedBox(height: 15,),
        Row(
          children: [
            InkWell(
              onTap: () async {



                  GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
                  GoogleSignInAuthentication googleSignInAuthentication =
                  await googleSignInAccount!.authentication;
                  AuthCredential authCredential = GoogleAuthProvider.credential(
                    idToken: googleSignInAuthentication.idToken,
                    accessToken: googleSignInAuthentication.accessToken,
                  );
//----------------------------------------
              /*    var user = await auth.signInWithCredential(authCredential);
                  registerUser.name = googleSignInAccount.displayName;
                  registerUser.email = googleSignInAccount.email;
                  registerUser.password = googleSignInAccount.serverAuthCode;
                  registerUser.id = googleSignInAccount.id;
                  registerUser.photo = googleSignInAccount.photoUrl;
                  fireStore
                      .collection("users")
                      .doc(registerUser.id)
                      .set(registerUser.toJson());*/
                },

                child: transparent_button(label: AppStrings.Google, image: Image.asset(AppImages.google,height: 20,))),
            Spacer(),
            InkWell(
              onTap: () async {

                  final LoginResult result = await FacebookAuth.instance.login();

                  if (result.status == LoginStatus.success) {
                    _accessToken = result.accessToken;

                    final userData = await FacebookAuth.instance.getUserData();
                    _userData = userData;
                     print(userData);
                    print(_userData!['email']);
                    print(_userData!['email']);
                   var  email = _userData!['email'];
                   var  name = _userData!['name'];
                    Provider.of<RegisterProvider>(
                        context, listen: false).Registeration(
                       name, email,
                        "12345678",context);
                  } else {
                    print(result.status);
                    print(result.message);
                  }
                  setState(() {
                    _checking = false;
                  });

              },
              child: transparent_button(label: AppStrings.Facebook, image: Image.asset(AppImages.facebook,height: 20,),
              ),
            ),
          ],
        )
      ],
    );
  }
}
/// todo  save data to api and the app
