import 'dart:ui';
import 'package:bazarli/models/cart_model/HomeCategoriesResponse.dart';
import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/navigation_service/navigation_service.dart';
import 'package:bazarli/view/home/categories/sub_caategories_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class selectedCategoryItem extends StatelessWidget{
  Category category;
  selectedCategoryItem({this.category});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        NavigationService.navigationService.navigateToWidget(SubCategoriesScreen(categoryResponse: category,));
      },
      child: Container(
        // margin: EdgeInsets.all(10),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(ScreenUtil().radius(10)),
              child: Container(
                decoration: BoxDecoration(
                  color: WhiteColor,
                  borderRadius: BorderRadius.circular(ScreenUtil().radius(10)),
                  image: DecorationImage(
                    // colorFilter: ColorFilter.mode(
                    //     MyColors.blackColor.withOpacity(0.3), BlendMode.darken),
                    fit: BoxFit.cover,
                    image: NetworkImage(category.imageUrl.toString()),
                  ),
                ),
                // margin: EdgeInsets.symmetric(horizontal: 5),
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                // height: 77.h,
                padding: EdgeInsets.all(ScreenUtil().radius(10)),
                decoration: BoxDecoration(
                  // color: WhiteColor.withOpacity(0.3),
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(ScreenUtil().radius(10)),bottomLeft:Radius.circular(ScreenUtil().radius(10))),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: GradientColors)
                ),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(width:0.5.sw,
                        child: Text(category.title==null?'':category.title,style:TitlesInHome,maxLines: 2,)),
                    Container(width:0.5.sw,
                        child: Text(category.description.toString(),style:SliderTitle2Style,)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}