import 'package:flutter/material.dart';
import 'package:jobfinder/styles/app_theme.dart';

class inputfield extends StatefulWidget {
  String? label;
  TextEditingController? controller;
  TextInputType? keyboard;
  IconData? icon;
  IconButton? iconButton;
  Image? prefixicon;
  Color  focuscolor;
  Function? validate;
  double edge1;
  double edge2;
  double edge3;
  double edge4;
  int max;
  bool isPasswordField;
  bool isObscureText;
  double borderradius;
  Widget? page;
  Function?  function;
  String? labels;
  inputfield(
      {required this.label,
        this.labels,
      this.controller,
      this.isPasswordField = false,
      this.isObscureText = false,
      this.keyboard,
      this.validate,
      this.iconButton,
      this.edge1 = 17,
      this.edge2 = 17,
      this.edge3 = 17,
      this.edge4 = 17,
        this.borderradius =7,
      this.max = 1,
     this.prefixicon,
      this.focuscolor = AppTheme.PrimaryColor,this.page,
      this.function});

  @override
  State<inputfield> createState() => _inputfieldState();
}

class _inputfieldState extends State<inputfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      /*onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) =>widget.page!,),);
      },*/
       /* onFieldSubmitted: (value){
       widget.function;
        },*/
        textAlignVertical: TextAlignVertical.top,
        obscureText: widget.isObscureText,
       // enableInteractiveSelection: false,
        cursorColor: AppTheme.PrimaryColor,
        validator: (s) => widget.validate!(s),
        controller: widget.controller,
        keyboardType: widget.keyboard,
        // expands: true,
        maxLines: widget.max,
        decoration: InputDecoration(
          labelText: widget.labels,
        /*  labelStyle: TextStyle(
            fontSize: 20,
            color: Colors.orange,
          ),*/
          hintText: widget.label,
          hintStyle: TextStyle(fontSize: 15, color: AppTheme.lightunclickedColor),
          prefixIcon: widget.prefixicon,
          suffixIconColor: AppTheme.PrimaryColor,
          suffixIcon: widget.isPasswordField
              ? IconButton(
                  icon: Icon((widget.isObscureText)
                      ? Icons.visibility_off
                      : Icons.visibility),
                  color: AppTheme.lightunclickedColor,
                  onPressed: () {
                    setState(() {
                      widget.isObscureText = !widget.isObscureText;
                    });
                  })
              : widget.iconButton,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.focuscolor ),
            borderRadius: BorderRadius.circular(widget.borderradius),
          ),
          contentPadding: EdgeInsets.fromLTRB(
              widget.edge1, widget.edge2, widget.edge3, widget.edge4),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderradius),
            borderSide: BorderSide(color: AppTheme.PrimaryColor),
          ),
        ));
  }
}
