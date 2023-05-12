import 'dart:ui';


import 'package:flutter/cupertino.dart';



class Keywords_Grid extends StatefulWidget {
  Color backgroundcolor;
      Color textcolor;
  double size;
  int count;


 Keywords_Grid({required this.backgroundcolor, required this. textcolor, required this.size, required this.count,});

  @override
  State<Keywords_Grid> createState() => _Keywords_GridState();
}

class _Keywords_GridState extends State<Keywords_Grid> {
  List<String> keyword =
  [
  "FullTime",
  "Remote"  ,
  "Design"
  ];
  @override
  Widget build(BuildContext context) {
    return  Flexible(

        child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: widget.count,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: widget.count,
                  childAspectRatio: widget.size,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(3, 0, 5, 0),
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        color: widget.backgroundcolor,
                        borderRadius: BorderRadius.circular(50),
                        //  border: Border.all(
                        //   width: 1.5,
                        // color:  AppTheme.unclickedbuttonColor,
                        //)
                      ),
                      child: Text(
                      keyword[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: widget.textcolor,
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  );
                }),
          
        ),
    );
  }
}
