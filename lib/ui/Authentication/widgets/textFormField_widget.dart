import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class CustomTextfieldWidget extends StatelessWidget{
  Function validator;
  Function save;
  bool isPassword;
  TextInputType textInputType;
  Icon icon;
  String hint;
  String label;
  TextEditingController contraller =TextEditingController();
  TextEditingController passwordContraller ;

  CustomTextfieldWidget(
      {this.isPassword = false, this.label, this.save, this.validator,this.icon,this.hint,
        this.textInputType,this.passwordContraller});

  @override
  Widget build(BuildContext context) {
  return Container(
      height: 50.h,
      decoration: BoxDecoration(
      color:TextFormFieldColor ,
      borderRadius:  BorderRadius.circular(ScreenUtil().radius(5)),
    ),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
          border: InputBorder.none,
          hintText: hint,
           hintStyle: translator.currentLanguage == 'ar'
                ? GoogleFonts.tajawal(textStyle: SliderTitle2Style)
                : GoogleFonts.poppins(textStyle: SliderTitle2Style),

          focusedBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(ScreenUtil().radius(5)),
            borderSide: BorderSide(
              color:PrimaryColor,
              width: 1.0,
            ),
          ),

        ),
        keyboardType:textInputType,
        validator: validator,
        onSaved: save,
      ),
    );
  }

}