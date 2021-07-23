import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/navigation_service/navigation_service.dart';
import 'package:bazarli/providers/authentication_provider.dart';
import 'package:bazarli/ui/Authentication/widgets/textFormField_widget.dart';
import 'package:bazarli/ui/forget_password/forget_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginMidWidget extends StatelessWidget {
  LoginMidWidget();
  @override
  Widget build(BuildContext context) {
    return  Container(
        child: Form(
          key:Provider.of<AuthenticationProvider>(context, listen: false).formStateKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                  SizedBox(
                    height: 33.h,
                  ),

          if(Provider.of<AuthenticationProvider>(context).authMode==AuthMode.signUp)
                 Text('FirstName',
                   style: TextLabelStyle,
                 ).tr(),
           if(Provider.of<AuthenticationProvider>(context).authMode==AuthMode.signUp)
                        SizedBox(
                        height: 10.h,
                      ),
           if(Provider.of<AuthenticationProvider>(context).authMode==AuthMode.signUp)

                    CustomTextfieldWidget(
                      linesNo: 1,
                      isObscure: false,
                      isPassword: false,
                      contraller: Provider.of<AuthenticationProvider>(context, listen: false).fNameContraller,
                      hint: 'FirstName'.tr(),
                   textInputType:TextInputType.text,
                   save:Provider.of<AuthenticationProvider>(context, listen: false).saveFName,
                   validator:Provider.of<AuthenticationProvider>(context, listen: false).validateFName,
                 ),

           if(Provider.of<AuthenticationProvider>(context, listen: false).authMode==AuthMode.signUp)
                        SizedBox(
                        height: 15.h,
                      ), if(Provider.of<AuthenticationProvider>(context).authMode==AuthMode.signUp)
                 Text('LastName',
                   style: TextLabelStyle,
                 ).tr(),
          if(Provider.of<AuthenticationProvider>(context).authMode==AuthMode.signUp)
                        SizedBox(
                        height: 10.h,
                      ),
           if(Provider.of<AuthenticationProvider>(context).authMode==AuthMode.signUp)
                    CustomTextfieldWidget(
                      linesNo: 1,
                      isObscure: false,
                      isPassword: false,
                      contraller: Provider.of<AuthenticationProvider>(context, listen: false).lNameContraller,
                      hint: 'LastName'.tr(),
                   textInputType:TextInputType.text,
                   save:Provider.of<AuthenticationProvider>(context, listen: false).saveLName,
                   validator:Provider.of<AuthenticationProvider>(context, listen: false).validateLName,
                 ),

            if(Provider.of<AuthenticationProvider>(context, listen: false).authMode==AuthMode.signUp)
                        SizedBox(
                        height: 15.h,
                      ),


                      Text('Email',
                        style: TextLabelStyle,
                      ).tr(),
                      SizedBox(
                        height: 10.h,
                      ),

                  CustomTextfieldWidget(
                    linesNo: 1,
                    isObscure: false,
                      isPassword: false,
                      contraller: Provider.of<AuthenticationProvider>(context, listen: false).emailContraller,
                      hint: 'Email'.tr(),
                   textInputType:TextInputType.emailAddress,
                   save:Provider.of<AuthenticationProvider>(context, listen: false).saveEmail,
                   validator:Provider.of<AuthenticationProvider>(context, listen: false).validateEmail,
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
                            Text('Password',
                              style: TextLabelStyle,
                            ).tr(),

                            InkWell(
                              onTap: (){
                                NavigationService.navigationService.navigateToWidget(ForgetPasswordScreen());
                              },
                              child: Text('Forgot_Password',
                                style: SignInTextStyle,
                              ).tr(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),


                CustomTextfieldWidget(
                  linesNo: 1,
                  isObscure: Provider.of<AuthenticationProvider>(context, listen: false).isObscure,
                  isPassword: true,
                  hint: 'Password'.tr(),
                   textInputType:TextInputType.visiblePassword,
                   save: Provider.of<AuthenticationProvider>(context, listen: false).savePassword,
                   validator: Provider.of<AuthenticationProvider>(context, listen: false).validatePassword,
                   contraller: Provider.of<AuthenticationProvider>(context, listen: false).passwordContraller,
                   // isPassword: Provider.of<AuthenticationProvider>(context).isObscure,
                 ),


                   SizedBox(
                        height: 10.h,
                      ),
          if(Provider.of<AuthenticationProvider>(context).authMode==AuthMode.signUp)
                        Text('ConfirmPassword',
                        style: TextLabelStyle,
                      ).tr(),
          if(Provider.of<AuthenticationProvider>(context).authMode==AuthMode.signUp)
                        SizedBox(
                        height: 10.h,
                      ),
         if(Provider.of<AuthenticationProvider>(context).authMode==AuthMode.signUp)
                CustomTextfieldWidget(
                  linesNo: 1,
                  isObscure: Provider.of<AuthenticationProvider>(context, listen: false).isObscure,
                  isPassword:true,
                  hint: 'ConfirmPassword'.tr(),
                   textInputType:TextInputType.visiblePassword,
                   save: Provider.of<AuthenticationProvider>(context, listen: false).saveConfirmPassword,
                   validator: Provider.of<AuthenticationProvider>(context, listen: false).validateConfirmPassword,
                   contraller: Provider.of<AuthenticationProvider>(context, listen: false).confirmPasswordContraller,
                   // isPassword: Provider.of<AuthenticationProvider>(context).isObscure,
                 ),

                ]),
              )

    );
  }
}
