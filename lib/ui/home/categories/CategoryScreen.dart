import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/models/Categories_model/category_response.dart';
import 'package:bazarli/models/brand_model/brand_model.dart';
import 'package:bazarli/providers/home_provider.dart';
import 'package:bazarli/ui/home/Home/component/brand_item.dart';
import 'package:bazarli/ui/home/Home/component/home_title_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';
import 'package:easy_localization/easy_localization.dart';
import '../home_main_screen.dart';
import 'component/category_item.dart';
import 'component/product_shop_item.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CategoriesScreenState();
  }
}

class CategoriesScreenState extends State<CategoriesScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );
  void _onRefresh() async{
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => HomeMainScreen(selectedPageIndex:1)));
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));

    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(
      Duration(milliseconds: 1000),
    );
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    Provider.of<HomeProvider>(context, listen: false).getAllCategories();
    Provider.of<HomeProvider>(context, listen: false).getAllBrandss();
    // items.add((items.length+1).toString());
    // if(mounted)
    //   setState(() {
    //
    //   });
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: WaterDropHeader(waterDropColor: PrimaryColor,),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Text("pull up load");
          } else if (mode == LoadStatus.loading) {
            body = CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text("Load Failed!Click retry!");
          } else if (mode == LoadStatus.canLoading) {
            body = Text("release to load more");
          } else {
            body = Text("No more Data");
          }
          return Container(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: SingleChildScrollView(
        child: Container(
          child: Row(
            // mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                semanticContainer: false,
                shape: BeveledRectangleBorder(
                  // borderRadius: BorderRadius.circular(ScreenUtil().radius(10)),
                  // borderRadius: BorderRadius.only(
                  //   topLeft: Radius.circular(
                  //     ScreenUtil().radius(10),
                  //   ),
                  //   topRight: Radius.circular(
                  //     ScreenUtil().radius(10),
                  //   ),
                  //   bottomLeft: Radius.circular(
                  //     ScreenUtil().radius(10),
                  //   ),
                  // ),
                ),
                shadowColor: ShadowColor,
                elevation: ScreenUtil().radius(10),
                color: WhiteColor,
                child: Container(
                  decoration: BoxDecoration(
                    color: WhiteColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          ScreenUtil().radius(10),
                        ),
                        topRight: Radius.circular(
                          ScreenUtil().radius(10),
                        ),
                        bottomLeft: Radius.circular(
                          ScreenUtil().radius(10),
                        ),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: ShadowColor,
                          // spreadRadius: 5,
                          blurRadius:7.0,
                          offset: Offset(5, 8)
                      ),
                    ],
                  ),
                  height: 0.55.sh,
                  width: 0.47.sw,
                  child: ListView.builder(
                    itemCount: Provider.of<HomeProvider>(context, listen: false)
                        .categoriesList.length,
                    itemBuilder: (context, index) {
                      Category category=Provider.of<HomeProvider>(context, listen: false)
                          .categoriesList[index];
                      return ListTile(
                        onTap: (){

                        },
                        title: Center(
                          child: Text(context.locale.toString()=='en'
                              ?category.translations[1].name
                          :category.translations[0].name)
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    BuildHomeTitle(titleText: 'T-shirt'),
                    SizedBox(
                      height: 10.h,
                    ),
                    ProductShopItem(),
                    SizedBox(
                      height: 20.h,
                    ),
                    BuildHomeTitle(
                      titleText: 'brands you loves',
                    ),
                    // SizedBox(height: 2.h,),
                    getBrands(),
                    SizedBox(
                      height: 10.h,
                    ),
                    BuildHomeTitle(titleText: 'top picked'),
                    // SizedBox(height: 2.h,),
                    getSubCategories(context),
                    // SizedBox(height: 2.h,),
                    BuildHomeTitle(titleText: 'skin care'),
                    SizedBox(
                      height: 2.h,
                    ),
                    getSubCategories(context),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  getSubCategories(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),
      child: GridView.builder(
        itemCount: Provider.of<HomeProvider>(
          context,
          listen: false,
        ).categoriesList.length,
        physics: ScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 10.w,
          childAspectRatio: 0.5.h,
        ),
        itemBuilder: (context, index) => CategoryItem(
          category: Provider.of<HomeProvider>(
            context,
            listen: false,
          ).categoriesList[index],
        ),
      ),
    );
  }

  getBrands() {
    return FutureBuilder<List<Brand>>(
        future: Provider.of<HomeProvider>(
          context,
          listen: false,
        ).getAllBrandss(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
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
          } else if (snapshot.hasError) {
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
          }
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
                  child: SvgPicture.asset('assets/svg/image_placeholder.svg'),
                ),
              ),
            ),
          );
        });
  }
  // getBrands(){
  //   return Container(
  //     margin: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
  //     child:GridView.builder(
  //         itemCount: 6,
  //         physics: ScrollPhysics(),
  //         shrinkWrap: true,
  //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //           crossAxisCount: 3,
  //           mainAxisSpacing:10.h,
  //           crossAxisSpacing: 10.w,
  //           childAspectRatio: 1.h,
  //         ),
  //         itemBuilder: (context, index) =>
  //             BrandItem(icon:Provider.of<BrandProvider>(context, listen: false).brandList[index].smallBrandLogo , )),
  //
  //
  //
  //   );
  //
  //
  // }
}
