import 'package:bazarli/constants/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class BrandItem extends StatelessWidget {
  const BrandItem({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: WhiteColor,
              ),
              child: Image.network(icon,fit: BoxFit.cover,),
              )

    );
  }
}