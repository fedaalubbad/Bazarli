import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:flutter/material.dart';
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
  TextEditingController contraller;
  // TextEditingController passwordContraller ;

  CustomTextfieldWidget(
      {this.isPassword , this.label, this.save, this.validator,this.icon,this.hint,
        this.textInputType,this.contraller});

  @override
  Widget build(BuildContext context) {
  return TextFormField(
         // controller: contraller,
         decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          border: InputBorder.none,
          hintText: hint,
           hintStyle:
           translator.currentLanguage == 'ar'
                ? GoogleFonts.tajawal(textStyle: SliderTitle2Style)
                :
           GoogleFonts.poppins(textStyle: SliderTitle2Style),

          focusedBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color:PrimaryColor,
              width: 1.0,
            ),
          ),

          // suffixIcon: IconButton(
          //     icon:  Provider.of<AuthenticationProvider>(context).vaidate
          //         ?SvgPicture.asset(
          //        ' assets/svg/error.svg'): Image.asset('assets/icons/true.png'),
          //     onPressed: () {
          //       Provider.of<AuthenticationProvider>(context, listen: false)
          //           .switchObscure();
          //     }),
          //

        ),

        keyboardType:textInputType,
        validator: validator,
        onSaved: save,

    );
  }

}