import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jobfinder/Controller/data/Network/dio.dart';
import 'package:jobfinder/View/home_search/home_page.dart';
import 'package:jobfinder/View/login_page/reset_password.dart';
import 'package:jobfinder/View/register_pages/register_page.dart';
import 'package:jobfinder/View/widgets/headers.dart';
import 'package:jobfinder/utilities/app_strings.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../Controller/Provider/login_provider.dart';
import '../../styles/app_theme.dart';
import '../../utilities/app_images.dart';
import '../widgets/google_facebook.dart';
import '../widgets/inputfield.dart';
import '../widgets/main_button.dart';
import '../widgets/other_options.dart';

class login_page extends StatefulWidget {
  const login_page({Key? key}) : super(key: key);

  @override
  State<login_page> createState() => _login_pageState();
}
bool? isCheck = false;

TextEditingController email_controller =TextEditingController();
TextEditingController password_controller =TextEditingController();
final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
class _login_pageState extends State<login_page> {
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Consumer<LoginProvider>(
        builder: (context, value, child) {
          return
            SafeArea(


                child: SingleChildScrollView(
                  child: Form(
                    key: loginKey,

                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                      child: Column(
                        children: [
                          Row(children: [
                            Icon(null,),
                            Spacer(),
                            Image.asset(
                              AppImages.Logo, height: 19.sp, width: 81.sp,),
                          ],),
                          SizedBox(height: 30,),
                          headers(header1: AppStrings.Login, header2: AppStrings
                              .Logindetails),
                          inputfield(
                            label: AppStrings.Email,
                            prefixicon: Image.asset(
                                AppImages.sms),
                            controller: email_controller,
                            validate: (value) {
                              if (value.isEmpty || !value.contains('@')) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },),
                          SizedBox(height: 10,),
                          inputfield(label: AppStrings.Password,
                            prefixicon: Image.asset(AppImages.lock),
                            isPasswordField: true,
                            isObscureText: true,
                            controller: password_controller,
                            validate: (value) {
                              if (value.isEmpty || value.length < 8) {
                                return 'Password must be at least 8 characters long';
                              }
                              return null;
                            },),
                          Row(
                            children: [
                              Checkbox(
                                  value: isCheck,
                                  activeColor: AppTheme.PrimaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),

                                  ),

                                  onChanged: (bool? value) {
                                    setState(() {
                                      isCheck = value;
                                    });
                                  }),
                              Text(AppStrings.rememberme, style: TextStyle(
                                  fontSize: 11.5.sp,
                                  fontWeight: FontWeight.w400),),


                              Spacer(),
                              TextButton(onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => reset_password(),));
                              },
                                child: Text(
                                    AppStrings.forgotpassword, style: TextStyle(
                                    color: AppTheme.PrimaryColor,
                                    decoration: TextDecoration.underline,
                                    fontSize: 11.5.sp)),),
                            ],
                          ),
                          SizedBox(height: 160.sp),
                          //   Spacer(),
                          other_options(option: AppStrings.donothaveanaccount,
                              buttontext: AppStrings.register,
                              page: register_page()),
                          InkWell( // color if condition
                              onTap: () {
                                //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>type_of_work(),));
                                // setState(() {
                                if (loginKey.currentState!.validate()) {
                                  Provider.of<LoginProvider>(
                                      context, listen: false).PostDatalogin(
                                      email_controller.text,
                                      password_controller.text,context);
                                }


                               


                              },



                              child: main_button(label: AppStrings.Login,)),
                          google_facebook(text: AppStrings.loginwithanaccount),
                        ],
                      ),
                    ),
                  ),


                ));
        }  ),
 );
  }
}
