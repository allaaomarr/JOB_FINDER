import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utilities/app_images.dart';

class logo_arrowback extends StatelessWidget {
  const logo_arrowback({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          IconButton(onPressed: (){Navigator.pop(context);}, icon: ImageIcon(
            AssetImage(AppImages.arrowback),)),
          Spacer(),
          Image.asset(AppImages.Logo,height: 19.sp,width: 81.sp,),
        ],),
        SizedBox(height: 30,),
      ],
    );
  }
}
