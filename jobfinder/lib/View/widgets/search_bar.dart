import 'package:flutter/cupertino.dart';
import 'package:jobfinder/View/widgets/inputfield.dart';
import 'package:jobfinder/utilities/app_images.dart';
import 'package:jobfinder/utilities/app_strings.dart';
import 'package:sizer/sizer.dart';

import '../../styles/app_theme.dart';

class search_bar extends StatefulWidget {
  const search_bar({Key? key}) : super(key: key);

  @override
  State<search_bar> createState() => _search_barState();
}

class _search_barState extends State<search_bar> {
  @override
  Widget build(BuildContext context) {
    return  inputfield(label: AppStrings.search, prefixicon: Image.asset(AppImages.search),edge1: 20,);
  }
}