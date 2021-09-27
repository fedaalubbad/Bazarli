import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/ViewModel/home_provider.dart';
import 'package:bazarli/ViewModel/Product_provider.dart';
import 'package:bazarli/view/home/Home/get_home_categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'component/dotted_slider.dart';
import 'component/home_title_widget.dart';
import 'get_brands.dart';
import 'get_selected_categories.dart';
import 'get_top_products.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  TabController _tabController;

  @override
  void initState() {
    Provider.of<HomeProvider>(
      context,
      listen: false,
    ).getAllCategories(context);

    Provider.of<HomeProvider>(
      context,
      listen: false,
    ).getSliders(context);
    Provider.of<HomeProvider>(
      context,
      listen: false,
    ).getAllBrandss(context);

    Provider.of<ProductProvider>(
      context,
      listen: false,
    ).getAllProducts();


    /////////////
    Provider.of<HomeProvider>(
      context,
      listen: false,
    ).tabController = new TabController(
      length: Provider.of<HomeProvider>(
        context,
        listen: false,
      ).categoriesList.length,
      vsync: this,
      initialIndex:  Provider.of<HomeProvider>(
        context,
        listen: false,
      ).getInitialIndex(context),
    )..addListener(() {
        print("New Index ${_tabController.index}");
        PageStorage.of(context).writeState(context, _tabController.index);
      });
    ////////////////
    super.initState();
  }




//////////refresh
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //         builder: (BuildContext context) =>
    //             HomeMainScreen(selectedPageIndex: 0)));
    // monitor network fetch
    Provider.of<HomeProvider>(
      context,
      listen: false,
    ).getAllCategories(context);

    Provider.of<HomeProvider>(
      context,
      listen: false,
    ).getSliders(context);
    Provider.of<HomeProvider>(
      context,
      listen: false,
    ).getAllBrandss(context);

    Provider.of<ProductProvider>(
      context,
      listen: false,
    ).getAllProducts();
    await Future.delayed(Duration(milliseconds: 1000));

    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    if (mounted) setState(() {});

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
            height: 55.h,
            child: Center(child: body),
          );
        },
      ),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GetHomeCategories(),
              Divider(
                color: DividerColor,
                height: 1.h,
              ),
              SizedBox(
                height: 10.5.h,
              ),
              GetBrands(),
              SizedBox(
                height: 15.h,
              ),
              dottedSlider(),
              SizedBox(
                height: 30.h,
              ),
              BuildHomeTitle(
                titleText: 'Flash Sale\nUP TO 80% OFF',
                buttonText: 'ShopNow',
              ),
              SizedBox(
                height: 30.h,
              ),
              GetTopProducts(),
              SizedBox(
                height: 10.h,
              ),
              BuildHomeTitle(
                titleText: 'Tops',
              ),
              SizedBox(
                height: 30.h,
              ),
              GetSelectedCategories(),
              SizedBox(
                height: 80.h,
              ),
            ],
          ),
          // )
        ),
      ),
    );
  }

  dottedSlider() {
    // ProductResponse.fromJson(widget.product).imagesList.add(ProductResponse.fromJson(widget.product).image);
    return DottedSlider(color: BlueDarkColor,maxHeight: 140.h, children:[
      ...Provider.of<HomeProvider>(
        context,
        listen: false,
      ).sliderList.map((e) => _productSlideImage(e.imageUrl))
    ]

    );
  }

  _productSlideImage(String imageUrl) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      height: 140.h,
      width: ScreenUtil.defaultSize.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          ScreenUtil().radius(2),
        ),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }



}
