
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jobfinder/Controller/Provider/register_provider.dart';
import 'package:jobfinder/View/login_page/login_page.dart';
import 'package:jobfinder/View/register_pages/type_of_work.dart';
import 'package:jobfinder/View/widgets/google_facebook.dart';
import 'package:jobfinder/View/widgets/headers.dart';
import 'package:jobfinder/View/widgets/inputfield.dart';
import 'package:jobfinder/View/widgets/logo_arrowback.dart';
import 'package:jobfinder/View/widgets/main_button.dart';
import 'package:jobfinder/styles/app_theme.dart';
import 'package:jobfinder/utilities/app_images.dart';
import 'package:jobfinder/utilities/app_strings.dart';
import 'package:provider/provider.dart';
import '../home_search/home_page.dart';
import '../widgets/other_options.dart';

class register_page extends StatefulWidget {
  @override
  State<register_page> createState() => _register_pageState();
}

class _register_pageState extends State<register_page> {
 // const register_page({Key? key}) : super(key: key);
  bool inputfieldsnotfilled = true;

   TextEditingController username_controller =TextEditingController();

  TextEditingController email_controller =TextEditingController();

  TextEditingController password_controller =TextEditingController();

  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();

  final success_bar = SnackBar(content: Text(' Successfully Registered'));

  final failed_bar = SnackBar(content: Text('Registration failed'));

  bool correctpassword = false;

  bool incorrectpassword = false;

  bool passwordcharacters = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:
      //Consumer<RegisterProvider>(
       // builder: (context, value, child,){
       // return
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: registerKey,
                child: Column(


    children: [
   logo_arrowback(),
    headers(header1: AppStrings.Createaccount, header2: AppStrings.Createaccountdetails),
        inputfield(label: AppStrings.Username, prefixicon:Image.asset(AppImages.profile),controller: username_controller, validate: (value) {
          if (value.isEmpty) {
            return 'Please enter a Username';
          }
          return null;
        } ),
        SizedBox(height: 10,),
        inputfield(label: AppStrings.Email, prefixicon:Image.asset(AppImages.sms),controller: email_controller,validate: (value) {
    if (value.isEmpty || !value.contains('@')) {
    return 'Please enter a valid email address';
    }
    return null;

        },),
        SizedBox(height: 10,),
        inputfield(label: AppStrings.Password, prefixicon:Image.asset(AppImages.lock),isPasswordField: true,isObscureText: true,controller: password_controller,validate: (value) {

            if (value.isEmpty || value.length < 8) {
              return 'Password must be at least 8 characters long';
            }
            return null;
          },



        ),
        SizedBox(height: 10,),
Container( alignment: AlignmentDirectional.topStart,
    child: Text(AppStrings.passwordletters,style: TextStyle(color:
   AppTheme.lightunclickedColor),)), // color if condition

  SizedBox(height: 100,),
        other_options(option: AppStrings.haveanaccount, buttontext: AppStrings.Login,page:login_page()),
                  InkWell(
                          onTap: () {
                        setState(() {
                              if (username_controller.text.length > 0 &&
                               email_controller.text.length > 0 &&
                               password_controller.text.length > 0) {
                               inputfieldsnotfilled = !inputfieldsnotfilled;
                              }
                         });
    if (registerKey.currentState!.validate()) {
      Provider.of<RegisterProvider>(
          context, listen: false).Registeration(
          username_controller.text, email_controller
          .text,
          password_controller.text, context);

      //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>type_of_work(),));
    }   },
                         // },
                          child: main_button(label: AppStrings.Createaccount,color: inputfieldsnotfilled? AppTheme.unclickedbuttonColor:AppTheme.PrimaryColor,textcolor:inputfieldsnotfilled? AppTheme.unclickedColor: Colors.white,)),
     google_facebook(text: AppStrings.signupwithanaccount),
                  ],
                ),
              ),
            ),
          ),
        ),
  //}
   // )
    );
  }
}

