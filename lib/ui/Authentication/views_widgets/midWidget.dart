import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/providers/authentication_provider.dart';
import 'package:bazarli/ui/Authentication/widgets/textFormField_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginMidWidget extends StatelessWidget {
  GlobalKey<FormState> homeKey ;
  LoginMidWidget(this.homeKey);
  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: homeKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                  SizedBox(
                    height: 33.h,
                  ),

                 Text('Name',
                   style: TextLabelStyle,
                 ).tr(),
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
                      hint: 'Name'.tr(),
                   textInputType:TextInputType.text,
                   save:Provider.of<AuthenticationProvider>(context, listen: false).saveName,
                   validator:Provider.of<AuthenticationProvider>(context, listen: false).validateEmail,
                 ),),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text('Email',
                        style: TextLabelStyle,
                      ).tr(),
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
                      hint: 'Email'.tr(),
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
                            Text('Password',
                              style: TextLabelStyle,
                            ).tr(),

                            Text('Forgot_Password',
                              style: SignInTextStyle,
                            ).tr(),
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
                   hint: 'Password'.tr(),
                   textInputType:TextInputType.visiblePassword,
                   save: Provider.of<AuthenticationProvider>(context, listen: false).savePassword,
                   validator: Provider.of<AuthenticationProvider>(context, listen: false).validatePassword,
                   contraller: Provider.of<AuthenticationProvider>(context, listen: false).passwordContraller,
                   // isPassword: Provider.of<AuthenticationProvider>(context).isObscure,
                 ),),

                ]),
              )

    );
  }
}
