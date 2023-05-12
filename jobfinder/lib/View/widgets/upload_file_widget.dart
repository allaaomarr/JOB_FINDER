import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:jobfinder/Controller/data/Network/dio.dart';
//import 'package:easy_stepper/easy_stepper.dart';
import 'package:jobfinder/View/widgets/success_widget.dart';
import 'package:jobfinder/styles/app_theme.dart';
import 'package:jobfinder/utilities/app_images.dart';
import 'package:jobfinder/utilities/app_strings.dart';
import 'package:sizer/sizer.dart';
import "package:filesystem_picker/filesystem_picker.dart";
import 'package:permission_handler/permission_handler.dart';
class upload_file_widget extends StatefulWidget {
  const upload_file_widget({Key? key}) : super(key: key);

  @override
  State<upload_file_widget> createState() => _upload_file_widgetState();
}

class _upload_file_widgetState extends State<upload_file_widget> {
  Directory? rootPath;
  String? dirPath;
  @override
  void initState() {
    super.initState();
    _prepareStorage();
  }
  Future<void> _prepareStorage() async
  {
    rootPath = Directory('/storage/emulated/0/');
    setState(() {});
  }
  Future<void> _pickDir(BuildContext context) async
  {
    String? path = await FilesystemPicker.open(
      title: 'Select folder',
      context: context,
      rootDirectory: rootPath!,
      fsType: FilesystemType.all,
      pickText: 'Select this folder',
      folderIconColor: AppTheme.PrimaryColor,

      requestPermission: () async =>
      await Permission.storage.request().isGranted,
    );
    setState(() {
      dirPath = path;
      print(dirPath);

    });
  }
  @override
  Widget build(BuildContext context) {
    return   DottedBorder(
      borderType: BorderType.RRect,
      strokeWidth: 1.5,
      dashPattern: [6, 3.5],
      radius: Radius.circular(10),
    //  padding: EdgeInsets.all(6),
      color: AppTheme.PrimaryColor,
      child: Container(
        alignment: AlignmentDirectional.center,
        height: 180.sp,
        width: 286.sp,
        decoration: BoxDecoration(
          color:Color(0xffECF2FF),
borderRadius: BorderRadiusDirectional.circular(10),

        ),

          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Column
              (
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                success_widget(header1: AppStrings.uploadfile, header2: AppStrings.filesize, image: AppImages.uploadfile,headersize1: 16,headersize2: 11,sizebox1: 10,sizebox2: 10,),
                SizedBox(height: 25,),
            InkWell(
              onTap: (rootPath != null) ? () => _pickDir(context) : null,

              child: Container(
                width: 290,
                height: 40,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                color: AppTheme.PrimaryColorBackground,
                borderRadius: BorderRadius.circular(50),
                 border: Border.all(
                   width: 1,
                color:  AppTheme.PrimaryColor,
                 )
              ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.share,color:AppTheme.PrimaryColor ,alignment: Alignment.center,),
                      SizedBox(width: 10,),
                      Text(AppStrings.addfile,style: TextStyle(color:
                      AppTheme.PrimaryColor,fontWeight: FontWeight.w500,fontSize: 14),textAlign: TextAlign.center,),
                    ],
                  ),
                ),
              ),
            ),
              ],
            ),
          ),

      ),
    );
  }
}
/// TODO FILE UPLOAD  add to database