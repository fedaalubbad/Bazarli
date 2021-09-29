import 'package:bazarli/ViewModel/HomeCategoriesResponse.dart';
import 'package:bazarli/ViewModel/home_provider.dart';
import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/view/home/categories/component/selectedCategoryItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_placeholder_textlines/placeholder_lines.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetSelectedCategories extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Selector<HomeProvider, HomeCategoriesResponse>(
        builder: (context, response, widget) {
          if (response == null) {
            return Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                child: StaggeredGridView.countBuilder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) =>
                      _buildGridItem(),
                  staggeredTileBuilder: (int index) =>
                      StaggeredTile.count(2, index.isEven ? 2.5 : 2),
                  mainAxisSpacing: 10.w,
                  crossAxisSpacing: 10.h,
                ));
          } else if (response.categories.length == 0) {
            return Container(height: 0,);
          } else {
            return Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                child: StaggeredGridView.countBuilder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  itemCount: response.categories.length,
                  itemBuilder: (BuildContext context, int index) =>selectedCategoryItem(
                    category: response.categories[index],
                  ),
                  staggeredTileBuilder: (int index) =>
                      StaggeredTile.count(2, index.isEven ? 2.5 : 2),
                  mainAxisSpacing: 10.w,
                  crossAxisSpacing: 10.h,
                ));
          }
        }, selector: (context, provider) {
      return provider.homeCategoriesResponse;
    });
  }

  _buildGridItem() {
    return Container(
      height: 180.h,
      color: Colors.white,
      // margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            flex: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                ScreenUtil().radius(10),
              ),
              child: Container(
                // height: 140.h,
                decoration: BoxDecoration(
                  // color: WhiteColor.withOpacity(0.3),
                  // borderRadius: BorderRadius.only(
                  // topLeft: Radius.circular(ScreenUtil().radius(10)),
                  // topRight:Radius.circular(ScreenUtil().radius(10))),
                ),
                child: SvgPicture.asset(
                  'assets/svg/image_placeholder.svg',
                  color: CurveColor,
                ),
                // margin: EdgeInsets.symmetric(horizontal: 5),
              ),
            ),
          ),
          // Positioned(
          //   bottom: 0,
          Expanded(
            flex: 30,
            child: Container(
              padding: EdgeInsets.all(
                ScreenUtil().radius(10),
              ),
              child: PlaceholderLines(
                count: 1,
                animate: true,
                color: PrimaryColor.withOpacity(0.3),
              ),
            ),
          )
        ],
      ),
    );
  }
}

