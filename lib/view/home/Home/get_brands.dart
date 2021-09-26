import 'package:bazarli/ViewModel/home_provider.dart';
import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/models/brand_model/brand_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'component/brand_item.dart';

class GetBrands extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return  Selector<HomeProvider, BrandResponse>(
        builder: (context, response, widget) {
          if (response == null) {
            return Container(
              height: 40.h,
              child: ListView.builder(
                controller: Provider.of<HomeProvider>(
                  context,
                  listen: false,
                ).scrollController,
                scrollDirection: Axis.horizontal,
                // physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                return Container(
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
                );
                }
              ),
            );
          } else if (response.brands.length == 0) {
            return Container(height: 0,);
          } else {
            return Row(
              children: [
                InkWell(
                  onTap: () {
                    // setState(() {
                      Provider.of<HomeProvider>(
                        context,
                        listen: false,
                      ).toBack();
                    // });
                  },
                  child: Container(
                    width: 0.15.sw,
                    child: CircleAvatar(
                      backgroundColor: WhiteColor,
                      radius: ScreenUtil().radius(15),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: BlueDarkColor,
                        size: ScreenUtil().radius(15),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 0.7.sw,
                  // margin: EdgeInsets.symmetric(horizontal: 33.5.w),
                  height: 40.h,
                  child: ListView.builder(
                    controller: Provider.of<HomeProvider>(
                      context,
                      listen: false,
                    ).scrollController,
                    scrollDirection: Axis.horizontal,
                    // physics: NeverScrollableScrollPhysics(),
                    itemCount: response.brands.length,
                    itemBuilder: (context, index) => BrandItem(
                        icon:  response.brands[index].smallBrandLogo,
                        press: () {}),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // setState(() {
                    Provider.of<HomeProvider>(
                      context,
                      listen: false,
                    ).toNext();
                    // });
                  },
                  child: Container(
                    width: 0.15.sw,
                    child: CircleAvatar(
                      backgroundColor: WhiteColor,
                      radius: ScreenUtil().radius(15),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: BlueDarkColor,
                        size: ScreenUtil().radius(15),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        }, selector: (context, provider) {
      return provider.brandResponse;
    });
  }

}

