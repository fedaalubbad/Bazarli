import 'package:bazarli/ViewModel/home_provider.dart';
import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/models/brand_model/brand_model.dart';
import 'package:bazarli/view/home/Home/component/brand_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class GetBrandsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Selector<HomeProvider, BrandResponse>(
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
          } else if (response.brands.length == 0) {
            return Container(height: 0,);
          } else {
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
                itemBuilder: (context, index) => BrandItem(
                  icon: Provider.of<HomeProvider>(
                    context,
                    listen: false,
                  ).brandList[index].smallBrandLogo,
                ),
              ),
            );
          }
        }, selector: (context, provider) {
      return provider.brandResponse;
    });
  }

}

