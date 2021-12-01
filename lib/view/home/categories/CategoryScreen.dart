import 'package:bazarli/ViewModel/categories_with_brands_provider.dart';
import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/models/Categories_model/categories_with_brands_response.dart';
import 'package:bazarli/view/home/Home/component/home_title_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../home_main_screen.dart';
import 'component/category_item.dart';
import 'get_brands_grid.dart';
import 'package:easy_localization/easy_localization.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CategoriesScreenState();
  }
}

class CategoriesScreenState extends State<CategoriesScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    // Provider.of<CategoriesWithBrandsProvider>(context, listen: false).getCategoriesWithBrands(context.locale.toString());
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  void _onRefresh() async {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
                HomeMainScreen(selectedPageIndex: 1)));
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
    Provider.of<CategoriesWithBrandsProvider>(context, listen: false)
        .getCategoriesWithBrands(lang:context.locale.toString());
    // Provider.of<HomeProvider>(context, listen: false).getAllBrandss(context);
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
      header: WaterDropHeader(
        waterDropColor: PrimaryColor,
      ),
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
          child: Selector<CategoriesWithBrandsProvider,
                  CategoriesWithBrandsResponse>(
              builder: (context, response, widget) {
            if (response == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (response.categories.length == 0) {
              return Container(
                height: 0.55.sh,
                width: 0.47.sw,
              );
            } else {
              return Row(
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
                              blurRadius: 7.0,
                              offset: Offset(5, 8)),
                        ],
                      ),
                      height: 0.55.sh,
                      width: 0.47.sw,
                      child: ListView.builder(
                        itemCount: response.categories.length,
                        itemBuilder: (context, index) {
                          Category category = response.categories[index];
                          return Container(
                              color: Provider.of<CategoriesWithBrandsProvider>(
                                              context)
                                          .selectedIndex ==
                                      index
                                  ? PrimaryColor
                                  : WhiteColor,
                              child: Column(children: [
                                ListTile(
                                  onTap: () async {
                                    await Provider.of<CategoriesWithBrandsProvider>(
                                            context,
                                            listen: false)
                                        .selectIndex(index);
                                    await Provider.of<CategoriesWithBrandsProvider>(
                                            context,
                                            listen: false)
                                        .getBrands(index);
                                  await Provider.of<CategoriesWithBrandsProvider>(
                                            context,
                                            listen: false)
                                        .getSubCategories(index);
                                  },
                                  title: Center(child: Text(category.name)),
                                ),
                                Divider(color: PrimaryColor)
                              ]));
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
                        // BuildHomeTitle(titleText: 'T-shirt'),
                        // SizedBox(
                        //   height: 10.h,
                        // ),
                        // ProductShopItem(),
                        SizedBox(
                          height: 20.h,
                        ),
                        if (Provider.of<CategoriesWithBrandsProvider>(
                              context,
                              listen: false,
                            ).brands !=
                            null)
                          BuildHomeTitle(
                            titleText: 'brands',
                          ),
                        if (Provider.of<CategoriesWithBrandsProvider>(
                              context,
                              listen: false,
                            ).brands !=
                            null)
                          GetBrandsGrid(),
                        SizedBox(
                          height: 10.h,
                        ),
                        if (Provider.of<CategoriesWithBrandsProvider>(
                              context,
                              listen: false,
                            ).children !=
                            null)
                          BuildHomeTitle(titleText: 'categories'),
                        SizedBox(
                          height: 2.h,
                        ),
                        if (Provider.of<CategoriesWithBrandsProvider>(
                              context,
                              listen: false,
                            ).children !=
                            null)
                          getSubCategories(context),
                      ],
                    ),
                  )
                ],
              );
            }
          }, selector: (context, provider) {
            return provider.categoriesWithBrandsResponse;
          }),
        ),
      ),
    );
  }

  getSubCategories(BuildContext context) {
    return Selector<CategoriesWithBrandsProvider,List<Category>>(
        builder: (context, response, widget) {
          if (response == null) {
            return SizedBox();
          } else if (response.length == 0) {
            return SizedBox();
          } else {
            return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),
      child: GridView.builder(
        itemCount: Provider.of<CategoriesWithBrandsProvider>(
          context,
          listen: false,
        ).children.length,
        physics: ScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 10.w,
          childAspectRatio: 0.5.h,
        ),
        itemBuilder: (context, index) => CategoryItem(
          category: Provider.of<CategoriesWithBrandsProvider>(
            context,
            listen: false,
          ).children[index],
        ),
      ),
    );
  }
}, selector: (context, provider) {
return provider.children;
});
  }
}
