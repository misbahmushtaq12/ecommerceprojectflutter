import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class RoundedButton extends StatelessWidget{
  final String btnName;
  final Icon ?icon;
  final Color? bgcolor;
  final TextStyle? textStyle;
  final VoidCallback? callBack;


  RoundedButton(
  {required this.btnName,
      this.callBack,
      this.icon,
      this.textStyle,
      this.bgcolor=Colors.pink});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed:(){
          callBack!();
          },
    child:icon
        !=null ? Row(
      children: [
        icon!,
        Text(
          btnName,style: textStyle,)
      ],
    )
        :Text(btnName,style: textStyle,)
    ,
      style: ElevatedButton.styleFrom(
      primary: bgcolor,
      shadowColor: bgcolor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(21),
          bottomLeft: Radius.circular(21),
        )
      )
    ),
    );
  }

}