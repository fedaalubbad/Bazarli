import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/providers/authentication_provider.dart';
import 'package:bazarli/ui/Authentication/widgets/textFormField_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginMidWidget extends StatelessWidget {
  LoginMidWidget();

  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: Provider.of<AuthenticationProvider>(context, listen: false).formStateKey,
              child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                  SizedBox(
                    height: 33.h,
                  ),

                 Text(translator.translate('Name'),
                   style: translator.currentLanguage == 'ar'
                       ? GoogleFonts.tajawal(textStyle: TextLabelStyle)
                       : GoogleFonts.poppins(textStyle: TextLabelStyle),
                 ),
                      SizedBox(
                        height: 10.h,
                      ),
                Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                      color:TextFormFieldColor ,
                      borderRadius:  BorderRadius.circular(ScreenUtil().radius(5)),
                    ),
                    child:
                    CustomTextfieldWidget(
                      contraller: Provider.of<AuthenticationProvider>(context, listen: false).nameContraller,
                      hint: translator.translate('Name'),
                   textInputType:TextInputType.text,
                   save:Provider.of<AuthenticationProvider>(context, listen: false).saveName,
                   validator:Provider.of<AuthenticationProvider>(context, listen: false).validateEmail,
                 ),),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(translator.translate('Email'),
                        style: translator.currentLanguage == 'ar'
                            ? GoogleFonts.tajawal(textStyle: TextLabelStyle)
                            : GoogleFonts.poppins(textStyle: TextLabelStyle),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                    color:TextFormFieldColor ,
                      borderRadius:  BorderRadius.circular(ScreenUtil().radius(5)),
                    ),
                    child: CustomTextfieldWidget(
                      contraller: Provider.of<AuthenticationProvider>(context, listen: false).emailContraller,
                      hint: translator.translate('Email'),
                   textInputType:TextInputType.emailAddress,
                   save:Provider.of<AuthenticationProvider>(context, listen: false).saveEmail,
                   validator:Provider.of<AuthenticationProvider>(context, listen: false).validateName,
                 ),
                ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                        width: ScreenUtil.defaultSize.width,
                        height: 20.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(translator.translate('Password'),
                              style: translator.currentLanguage == 'ar'
                                  ? GoogleFonts.tajawal(textStyle: TextLabelStyle)
                                  : GoogleFonts.poppins(textStyle: TextLabelStyle),
                            ),

                            Text(translator.translate('Forgot_Password'),
                              style: translator.currentLanguage == 'ar'
                                  ? GoogleFonts.tajawal(textStyle: SignInTextStyle)
                                  : GoogleFonts.poppins(textStyle: SignInTextStyle),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),

                Container(
                height: 50.h,
                decoration: BoxDecoration(
                  color:TextFormFieldColor ,
                  borderRadius:  BorderRadius.circular(ScreenUtil().radius(5)),
                ),
                child:
                CustomTextfieldWidget(
                   hint: translator.translate('Password'),
                   textInputType:TextInputType.visiblePassword,
                   save: Provider.of<AuthenticationProvider>(context, listen: false).savePassword,
                   validator: Provider.of<AuthenticationProvider>(context, listen: false).validatePassword,
                   contraller: Provider.of<AuthenticationProvider>(context, listen: false).passwordContraller,
                   // isPassword: Provider.of<AuthenticationProvider>(context).isObscure,
                 ),),

                ]),
              )
    )

    );
  }
}
