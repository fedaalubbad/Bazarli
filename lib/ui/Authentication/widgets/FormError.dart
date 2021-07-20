import 'package:bazarli/constants/MyStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key key,
    @required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Container(
        // height:8,
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              errors.length, (index) => formErrorText(error: errors[index])),
        ),
      ),
    );
  }

  Row formErrorText({String error}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "assets/svg/error.svg",
          height:30.h,
          width:30.w,
        ),
        SizedBox(
          width:10.w,
        ),
        Container(
          width: ScreenUtil.defaultSize.width.w/2.w,
            child: Text(error,style: SignInTextStyle,)),
      ],
    );
  }
}