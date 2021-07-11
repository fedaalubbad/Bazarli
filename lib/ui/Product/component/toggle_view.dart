import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'customer_rview_carousel_slider.dart';

class OverViewAndCustomerReviewToggleView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return OverViewAndCustomerReviewToggleState();
  }

}
class OverViewAndCustomerReviewToggleState extends State<OverViewAndCustomerReviewToggleView >{
  List<bool> isSelected;
  @override
  void initState() {
    isSelected = [true, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
    child: Column(
    children:[
      overViewToggleButtonWidget(context),
       SizedBox(height: 20.h,),
         isSelected[1]?
         CustomerReviewWidget()
         :
         OverviewWidget()
        ],

    ),
    );
  }

  overViewToggleButtonWidget(BuildContext context){
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 20.w),
      alignment: Alignment.center,
      height: 45.h,
      width: ScreenUtil.defaultSize.width,
      decoration: BoxDecoration(
          color: PrimaryColor,
          borderRadius:
          BorderRadius.circular(ScreenUtil().radius(5))),
      child: ToggleButtons(
        children: [
          togglebtun(0,'OverView'),
          // SizedBox(width:20.w),
          togglebtun(1,'CustomerReview')
        ],
        onPressed: (int index) {
          setState(() {
            for (int i = 0; i < isSelected.length; i++) {
              isSelected[i] = i == index;
            }
          });
        },
        isSelected: isSelected,
      ),

    );
  }

    togglebtun(int index,String text){
      return  isSelected[index] ?
        Container(
        margin:context.locale.toString()=='en'? EdgeInsets.only(left: 2):EdgeInsets.only(right: 2),
        height: 40.h,
        width: 0.4.sw,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color:HomeBackgroundColor,
            borderRadius:
            BorderRadius.circular(ScreenUtil().radius(5))),
        child: Text(
         text, style: TabsTextStyle,).tr(),
      ):
      Container(
        width: 0.4.sw,
        alignment: Alignment.center,
        child: Text(text,style: WhiteButtonStyle,).tr(),
      );
    }

  buildReviewBtn(BuildContext context){
   return Container(
     alignment: context.locale.toString()=='en'?Alignment.centerLeft:Alignment.centerRight,
      child: InkWell(
          onTap: () {
            // NavigationService.navigationService
            //     .navigateToWidget(HomeMainScreen());
          },
          child: Container(
            // margin: EdgeInsets.symmetric(horizontal: 20.w),
            alignment: Alignment.center,
            height: 50.h,
            width: 157.w,
            decoration: BoxDecoration(
                color: PrimaryColor,
                borderRadius:
                BorderRadius.circular(ScreenUtil().radius(5))),
            child: Text(
              'WriteAReview',
              style: SliderNextStyle,
            ).tr(),
          )),
    );
  }


  CustomerReviewWidget(){
    return Column(
      children: [
        Container(
          // height: 240.h,
            child: BuildCustomerReviewCarouselSlider(currentIndex: 0,)
        ),
        SizedBox(height: 20.h,),
        buildReviewBtn(context),
      ],
    );
  }
  OverviewWidget(){
    return Container(
      alignment: context.locale.toString()=='en'?Alignment.centerLeft:Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Details',style: ProductTitleStyle,).tr(),
          detailsRowWidget('ItemId','#BWB203154D2'),
          detailsRowWidget('Occasion','Casual'),
          detailsRowWidget('Elasticity','Nonelastic'),
          detailsRowWidget('Style','Vintage'),
          detailsRowWidget('Material','Polyester'),
          detailsRowWidget('Fast Fashion',' No'),
          detailsRowWidget('Belts','No'),
          detailsRowWidget('Waistline','High Waist'),
          detailsRowWidget('Fitness','Loose'),
          detailsRowWidget('Pattern','Patchwork'),
          detailsRowWidget('Length','Midi'),

        ],
      ),
    );
  }

  detailsRowWidget(text1,text2){
    return  Column(
      children: [
        SizedBox(height: 10.h,),

        Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                width:0.4.sw,
                child: Text(text1,style: TextLabelStyle,).tr()),
            // SizedBox(width:65.w ,),
            Container(
                width:0.4.sw,
                child: Text(text2,style:DescriptionStyle ,))
          ],
        ),
      ],
    );
  }
}