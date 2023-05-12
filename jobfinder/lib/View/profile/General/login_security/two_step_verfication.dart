import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:jobfinder/View/widgets/inputField.dart';
import 'package:jobfinder/View/widgets/main_button.dart';
import 'package:jobfinder/utilities/app_images.dart';
import 'package:jobfinder/utilities/app_sizes.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

import '../../../../styles/app_theme.dart';
import '../../../../utilities/app_strings.dart';
import '../../../widgets/arrowback_title.dart';



class two_step_verfication extends StatefulWidget {
  const two_step_verfication({Key? key}) : super(key: key);

  @override
  State<two_step_verfication> createState() => _two_step_verficationState();
}

final List<bool> steps = <bool>[true, false, false, false];
bool status = false;
int index = 0;
String? selectedValue;
final List<String> items = [
  AppStrings.telephonenumbersms,
  'Item2',
];
var phone_number = TextEditingController();

class _two_step_verficationState extends State<two_step_verfication> {
  var onTapRecognizer;

  /// this [StreamController] will take input of which function should be called

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              index == 0
                  ? arrowback_title(title: AppStrings.Twostepverification)
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (index < 5) {
                                    index = index - 1;
                                    print(index);
                                  }
                                  steps[index + 1] = !steps[index + 1];
                                  steps[index] = !steps[index];
                                });
                              },
                              icon: ImageIcon(
                                AssetImage(AppImages.arrowback),
                              )),
                          Spacer(),
                          Container(
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              AppStrings.Twostepverification,
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: 30.sp,
                            child: Text(
                              "",
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    steps[0] == true
                        ? tworules()
                        : steps[1] == true
                            ? select_verfication_method()
                            : steps[2] == true
                                ? enter_phone_number()
                                : Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          FocusScope.of(context)
                                              .requestFocus(new FocusNode());
                                        },
                                        child: Container(
                                          height:
                                              MediaQuery.of(context).size.height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: ListView(
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 0),
                                                child: Text(
                                                  AppStrings.Enterthe6digitcode,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: AppSizes.title1),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(0, 10, 0, 0,),
                                                child: RichText(
                                                  text: TextSpan(
                                                      text: AppStrings
                                                          .Enterthe6digitcodedetails,

                                                      children: [
                                                        TextSpan(
                                                            text: "  011101111",
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: AppSizes.title1)),
                                                      ],
                                                      style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: AppSizes.title2)),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                          vertical: 0,
                                                          horizontal: 0),
                                                  child: PinCodeTextField(

                                                    length: 6,
                                                    obscureText: false,
                                                    animationType:
                                                        AnimationType.fade,

                                                    pinTheme: PinTheme(
                                                      shape:
                                                          PinCodeFieldShape.box,
                                                      borderWidth: 1.2,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      fieldHeight: 42,
                                                      fieldWidth: 42,
                                                    //  fieldOuterPadding: EdgeInsets.all(0),
                                                      activeFillColor: Colors.white,
                                                          disabledColor: AppTheme.unclickedColor,
                                                          inactiveColor:AppTheme.unclickedbuttonColor,
                                                          activeColor: AppTheme.unclickedColor

                                                    ),
                                                    animationDuration: Duration(
                                                        milliseconds: 300),

                                                    appContext: context,
                                                    onChanged: (String value) {
                                                      setState(() {
                                                        currentText = value;
                                                      });
                                                    },
                                                  )),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 0),
                                                // error showing widget
                                                child: Text(
                                                  hasError
                                                      ? "*Please fill up all the cells properly"
                                                      : "",
                                                  style: TextStyle(
                                                    color: Colors.red.shade300,
                                                      fontSize: AppSizes.title1),
                                                ),
                                              ),
                                              RichText(
                                                textAlign: TextAlign.start,
                                                text: TextSpan(
                                                    text:
                                                        AppStrings.Resendcode,
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: AppSizes.title1),
                                                    children: [
                                                      TextSpan(
                                                          text: " 42s",
                                                          recognizer:
                                                              onTapRecognizer,
                                                          style: TextStyle(
                                                              color: AppTheme.PrimaryColor,
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontSize: 16))
                                                    ]),
                                              ),
                                              SizedBox(
                                                height: 300.sp,
                                              ),
                                              Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 0,
                                                        horizontal: 0),
                                                child: ButtonTheme(
                                                  height: 50,
                                                  child: InkWell(
                                                    onTap :(){
    if (currentText.length !=
    6 ||
    currentText !=
    "towtow") {
    setState(() {
    hasError = true;
    });
    } else {
    setState(() {
    hasError = false;
    /* scaffoldKey.currentState?.showSnackBar(SnackBar(
                                              content: Text("Aye!!"),
                                              duration: Duration(seconds: 2),
                                            ));*/
    });}
    },
  child:  InkWell(


      child: main_button(label: AppStrings.Verify,)),
    ),

                                              ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                    //    SizedBox(height: 280.sp,),
                  ],
                ),
              ),
           index <3?   InkWell(
                  onTap: () {
                    setState(() {
                      if (index < 4) {
                        index = index + 1;
                        print(index);
                      }
                      steps[index - 1] = !steps[index - 1];
                      steps[index] = !steps[index];
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: main_button(
                        label: steps[2] == true
                            ? AppStrings.SendCode
                            : AppStrings.Next),
                  )):Padding(padding: EdgeInsets.all(0)),
            ],
          ),
        ),
      ),
    );
  }
}

Widget rules(String title, String image) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
    child: Container(
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(image),
              SizedBox(width: 14),
              Container(
                  width: 252,
                  child: Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppTheme.unclickedColor),
                  )),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget select_verfication_method() {
  return Column(
    children: [
      toggle_container(),
      Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                AppStrings.Selectaverificationmethod,
                style: TextStyle(
                    fontSize: AppSizes.title1,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.start,
              )),
          SizedBox(
            height: 10,
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton2(
              //To avoid long text overflowing.
              isExpanded: true,
              hint: Container(
                // alignment: hintAlignment,
                child: Text(
                  AppStrings.telephonenumbersms,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: AppSizes.title2,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ),
              // value: value,
              items: items
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Container(
                          child: Text(
                            item,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: AppSizes.title2, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ))
                  .toList(),
              //onChanged: onChanged,
              // selectedItemBuilder: selectedItemBuilder,
              icon: const Icon(Icons.keyboard_arrow_down_sharp),
              iconSize: 20.sp,
              // iconEnabledColor: iconEnabledColor,
              iconDisabledColor: Colors.black,
              buttonHeight: 55,
              buttonWidth: 280.sp,
              buttonPadding: const EdgeInsets.only(left: 14, right: 14),
              buttonDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black45,
                ),
              ),
              //buttonElevation: buttonElevation,
              //   itemHeight: itemHeight ?? 40,
              //  itemPadding: itemPadding ?? const EdgeInsets.only(left: 14, right: 14),
              //Max height for the dropdown menu & becoming scrollable if there are more items. If you pass Null it will take max height possible for the items.
              //  dropdownMaxHeight: dropdownHeight ?? 200,
              //   dropdownWidth: dropdownWidth ?? 140,
              //   dropdownPadding: dropdownPadding,
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
              ),
              dropdownElevation: 8,
              scrollbarRadius: const Radius.circular(40),
              //scrollbarThickness: scrollbarThickness,
              // scrollbarAlwaysShow: scrollbarAlwaysShow,
              //Null or Offset(0, 0) will open just under the button. You can edit as you want.
              // offset: offset,
              // dropdownOverButton: false, //Default is false to show menu below button
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                AppStrings.verficationmethodnote,
                style: TextStyle(
                  color: AppTheme.unclickedColor,
                ),
                textAlign: TextAlign.start,
              )),
          SizedBox(
            height: 240,
          ),
        ],
      ),
    ],
  );
}

/// TODO TWO STEP VERFICATION SENT TO MOBILE LOGIC
Widget tworules() {
  return Column(
    children: [
      toggle_container(),
      rules(AppStrings.twostepverificationrule1, AppImages.Loginandsecurity),
      rules(AppStrings.twostepverificationrule2, AppImages.rule),
      SizedBox(
        height: 260.sp,
      ),
    ],
  );
}

Widget arrowbackstate(Function state) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
    child: Row(
      children: [
        IconButton(
            onPressed: () {
              state;

              /// TODO state provider
            },
            icon: ImageIcon(
              AssetImage(AppImages.arrowback),
            )),
        Spacer(),
        Container(
          alignment: AlignmentDirectional.center,
          child: Text(
            AppStrings.Twostepverification,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Spacer(),
        Container(
          width: 30.sp,
          child: Text(
            "",
            textAlign: TextAlign.center,
          ),
        )
      ],
    ),
  );
}

Widget toggle_container() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
    child: Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(10),
                border: Border.all(
                    width: 1.5, color: AppTheme.unclickedbuttonColor)),
            child: Padding(
              padding: const EdgeInsets.all(13),
              child: Row(
                children: [
                  Container(
                      width: 190,
                      child: Text(
                        AppStrings.Secureyouraccount,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppTheme.unclickedColor,
                            fontSize: AppSizes.title1),
                      )),
                  Spacer(),
                  FlutterSwitch(
                    width: 42.0,
                    height: 23.0,
                    padding: 1,
                    // valueFontSize: 18.0,
                    toggleSize: 20.0,
                    value: status,
                    activeColor: AppTheme.PrimaryColor,
                    toggleColor: AppTheme.PrimaryColorBackground,
                    inactiveToggleColor: AppTheme.titlecontainer,
                    inactiveColor: AppTheme.unclickedbuttonColor,
                    onToggle: (val) {
                      /*  setState(() {
                            status = val;
                          });*/
                      /// TODO provider state
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget enter_phone_number() {
  return Column(
    children: [
      Container(
        alignment: AlignmentDirectional.topStart,
        child: Text(
          AppStrings.Addphonenumber,
          style: TextStyle(
              fontSize: AppSizes.title1, color: Colors.black, fontWeight: FontWeight.w500),
          textAlign: TextAlign.start,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        alignment: AlignmentDirectional.topStart,
        child: Text(
          AppStrings.Addphonenumberdetails,
          style: TextStyle(
            fontSize: AppSizes.title2,
            color: AppTheme.unclickedColor,
          ),
          textAlign: TextAlign.start,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      IntlPhoneField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          labelText: AppStrings.phonenumber,
          border: OutlineInputBorder(
            borderSide: BorderSide(),
            borderRadius: BorderRadius.circular(7),
          ),
        ),
        initialCountryCode: 'US',
        onChanged: (phone) {
          print(phone.completeNumber);
        },
      ),
      Container(
        alignment: AlignmentDirectional.topStart,
        child: Text(
          AppStrings.Enteryourpassword,
          style: TextStyle(
              fontSize: AppSizes.title1, color: Colors.black, fontWeight: FontWeight.w500),
          textAlign: TextAlign.start,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      inputfield(
        label: AppStrings.Enteryourpassword,
        isPasswordField: true,
        isObscureText: true,
        prefixicon: Image.asset(AppImages.lock),
      ),
      SizedBox(
        height: 260.sp,
      )
    ],
  );
}

