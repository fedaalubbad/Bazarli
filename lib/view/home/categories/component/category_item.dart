import 'package:bazarli/models/Categories_model/categories_with_brands_response.dart';
import 'package:bazarli/navigation_service/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../sub_caategories_Screen.dart';

class CategoryItem extends StatelessWidget {
  Category category;
  CategoryItem({this.category});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        NavigationService.navigationService.navigateToWidget(SubCategoriesScreen(categoryResponse: category,));
      },
      child: Container(
        // height: 50.h,
        child: Column(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(ScreenUtil().radius(10)),
            child: Container(
              height: 60.h,
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(ScreenUtil().radius(10)),
                image: DecorationImage(
                  // colorFilter: ColorFilter.mode(
                  //     MyColors.blackColor.withOpacity(0.3), BlendMode.darken),
                  fit: BoxFit.cover,
                  image: NetworkImage('https://test.bazarli.com/storage/'+category.image),
                ),
              ),
              // margin: EdgeInsets.symmetric(horizontal: 5),
            ),
          ),
          // SizedBox(height: 10.h,),
          Container(
            width: 75.w,
            child: Text(category.name,maxLines: 2,),
          )
        ],
        ),
      ),
    );
  }
}
