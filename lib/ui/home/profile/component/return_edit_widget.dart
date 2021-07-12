import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/ui/Authentication/widgets/textFormField_widget.dart';
import 'package:bazarli/ui/home/Home/component/star_rating.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:easy_localization/easy_localization.dart';
class ReturnEditWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text('Ordered on Oct 10, 2021',style: DescriptionStyle,)),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: ShadowColor,
                        // spreadRadius: 5,
                        blurRadius: 7.0,
                        offset: Offset(0.0, 8)
                    ),
                  ],
                  color: WhiteColor,
                  borderRadius: BorderRadius.circular(ScreenUtil().radius(10)),),
                child: Container(
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(ScreenUtil().radius(10)),
                            child: Container(
                              height:118.h,
                              width: 70.w,
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(ScreenUtil().radius(10)),
                                image: DecorationImage(
                                  // colorFilter: ColorFilter.mode(
                                  //     MyColors.blackColor.withOpacity(0.3), BlendMode.darken),
                                  fit: BoxFit.cover,
                                  image: NetworkImage('https://www.hausvoneden.de/wp-content/uploads/2020/04/slow-fashion-700x850.jpg'),
                                ),
                              ),
                            )
                        ),

                        Row(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(width: 40.w,height: 40.h,
                                margin: EdgeInsets.only(left:2.w,),
                                child: Image.network('https://www.hausvoneden.de/wp-content/uploads/2020/04/slow-fashion-700x850.jpg')),


                            Container(
                              margin: EdgeInsets.only(left:5.w,),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(width:200.w,
                                      child: Text('Regular Fit Collared Neck Long Sleeve Shirt Grey',style:TabsTextStyle,maxLines:2,)),
                                  SizedBox(width: 10.h,),
                                  Text('EGP 479.00',style:PriceTextStyle,),
                                  SizedBox(height: 6.h,),

                                  Row(
                                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      StarRating(rating: 3.5,size: ScreenUtil().radius(15),),
                                      Container(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          // crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            SizedBox(width: 30.w,),
                                            SvgPicture.asset('assets/svg/delete.svg'),
                                            SizedBox(width: 15.w,),
                                            Text('QTY',style: QTYStyle,),
                                            SizedBox(width: 6.w,),
                                            incAnddescWidget(),
                                            SizedBox(width: 10.w,),
                                            SvgPicture.asset('assets/svg/add.svg'),
                                          ],

                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),


                      ]

                  ),
                ),
              ),
              SizedBox(height:10.h ,),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                // height: 100.h,
                decoration: BoxDecoration(
                  color:TextFormFieldColor ,
                  borderRadius:  BorderRadius.circular(ScreenUtil().radius(5)),
                ),
                child:
                CustomTextfieldWidget(
                  // hint: 'Name'.tr(),
                  textInputType:TextInputType.text,
                ),),
              SizedBox(height:10.h ,),

              buildReturnNowButton(context),
              SizedBox(height:10.h ,),
              buildCancelButton(context),
              SizedBox(height:10.h ,),

            ],
          ),

    );
  }

  buildReturnNowButton(BuildContext context){
    return Container(
      child: InkWell(
          onTap: () {
          },
          child: Container(
            alignment: Alignment.center,
            height: 50.h,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              color: PrimaryColor,
              borderRadius:
              BorderRadius.circular(ScreenUtil().radius(5)),
            ),
            child: Text(
              'Return',
              style:WhiteButtonStyle,
            ).tr(),
          )),
    );
  }

  buildCancelButton(BuildContext context){
    return Container(
      child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            // margin: EdgeInsets.symmetric(horizontal: 20.w),
            alignment: Alignment.center,
            height: 50.h,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
                color: WhiteColor,
                borderRadius:
                BorderRadius.circular(ScreenUtil().radius(5)),
                border: Border.all(color:PrimaryColor)
            ),
            child: Text(
              'Cancel',
              style:SignInTextStyle,
            ).tr(),
          )),
    );
  }

  incAnddescWidget(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('1',style: DiscountOffStyle,),
        SizedBox(
          width: 5.w,
        ),
        // Divider(color:GrayLiteColor,height: 31.h),
        Container(
          height: 31.h,
          color: GrayLiteColor,
          width: 0.5,
        ),
        SizedBox(
          width:5.w,
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: SvgPicture.asset('assets/svg/arrow_up.svg',color: PrimaryColor,width: 6.w,height:6.h,),
              onTap: () {},
            ),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
              child: SvgPicture.asset('assets/svg/arrow_down.svg',color: PrimaryColor,width: 6.w,height:6.h,),
              onTap: () {},
            )
          ],
        )
      ],
    );
  }
}