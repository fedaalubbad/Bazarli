import 'dart:ui';
import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class OrderPlacedDialogBox extends StatefulWidget {



  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<OrderPlacedDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ScreenUtil().radius(15)),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    Container(
      padding: EdgeInsets.only(left: 20.w,top: 20.h, right: 20.w,bottom: 20.h
      ),
      margin: EdgeInsets.only(top:20.h),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color:WhiteColor,
          borderRadius: BorderRadius.circular(ScreenUtil().radius(15)),
          boxShadow: [
            BoxShadow(color: Colors.black,offset: Offset(0,10),
                blurRadius: 10
            ),
          ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'OrderPlaced',
            style: TitlesInHome,
          ).tr(),
          SizedBox(
            height: 5,
          ),
          Text(
            'OrderPlacedSuccessfully',
            style: DescriptionStyle,
          ).tr(),
          SizedBox(
            height: 45,
          ),
          // SvgPicture.asset('assets/svg/jumping.svg'),
          SizedBox(
            height: 40,
          ),
          Container(
            child: GestureDetector(
               onTap: (){
                 Navigator.of(context).pop();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50.h,
                  width: 280.w,
                  decoration: BoxDecoration(
                    color: PrimaryColor,
                    borderRadius: BorderRadius.circular(ScreenUtil().radius(5)),
                  ),
                  child: Text(
                    'Done',
                    style: WhiteButtonStyle,
                  ).tr(),
                )),
          )
        ],
      ),
    );
  }
}
