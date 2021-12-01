import 'package:bazarli/ViewModel/categories_with_brands_provider.dart';
import 'package:bazarli/ViewModel/home_provider.dart';
import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/models/Categories_model/categories_with_brands_response.dart';
import 'package:bazarli/navigation_service/navigation_service.dart';
import 'package:bazarli/view/home/Home/component/brand_item.dart';
import 'package:bazarli/view/home/categories/sub_caategories_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class GetBrandsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Selector<CategoriesWithBrandsProvider, List<Brand>>(
        builder: (context, response, widget) {
          if (response == null) {
            return Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 20.h,
              ),
              child: GridView.builder(
                itemCount: 6,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 10.w,
                  childAspectRatio: 1.h,
                ),
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 30.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    color: WhiteColor,
                  ),
                  child: Shimmer.fromColors(
                    baseColor: CurveColor,
                    highlightColor: PrimaryColor.withOpacity(0.3),
                    child: SvgPicture.asset(
                      'assets/svg/image_placeholder.svg',
                    ),
                  ),
                ),
              ),
            );
          } else if (response.length == 0) {
            return Container(height: 0,);
          } else {
            return Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 20.h,
              ),
              child: GridView.builder(
                itemCount: response.length,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 10.w,
                  childAspectRatio: 1.h,
                ),
                itemBuilder: (context, index) => BrandItem(
                  icon: 'https://test.bazarli.com/storage/'+response[index].swatchValue,
                  press: (){
                    NavigationService.navigationService.navigateToWidget(SubCategoriesScreen(brand: response[index],));

                  },
                ),
              ),
            );
          }
        }, selector: (context, provider) {
      return provider.brands;
    });
  }

}

