import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/models/Categories_model/category_response.dart';
import 'package:bazarli/models/brand_model/brand_model.dart';
import 'package:bazarli/models/product_model/product_classes/Data.dart';
import 'package:bazarli/navigation_service/navigation_service.dart';
import 'package:bazarli/providers/home_provider.dart';
import 'package:bazarli/providers/Product_provider.dart';
import 'package:bazarli/ui/home/Home/component/brand_item.dart';
import 'package:bazarli/ui/home/Home/component/dotted_slider.dart';
import 'package:bazarli/ui/home/Home/component/product_item.dart';
import 'package:bazarli/ui/home/utils/indicator.dart';
import 'package:bazarli/ui/search/categorySearchScreen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_placeholder_textlines/flutter_placeholder_textlines.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';
import 'component/carousel_slider.dart';
import 'component/home_title_widget.dart';

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
    ).getSliders(context);

    _tabController = new TabController(
      length: Provider.of<HomeProvider>(
        context,
        listen: false,
      ).categoriesList.length,
      vsync: this,
      initialIndex: _getInitialIndex(),
    )..addListener(() {
        print("New Index ${_tabController.index}");
        PageStorage.of(context).writeState(context, _tabController.index);
      });
    super.initState();
  }

  int _getInitialIndex() {
    int initialIndex = PageStorage.of(context).readState(context) ?? 0;
    print("Initial Index ${initialIndex}");
    return initialIndex;
  }

  ScrollController _scrollController = new ScrollController();

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
              getCategories(context),
              Divider(
                color: DividerColor,
                height: 1.h,
              ),
              SizedBox(
                height: 10.5.h,
              ),
              getBrands(),
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
              getTopProducts(context),
              SizedBox(
                height: 10.h,
              ),
              BuildHomeTitle(
                titleText: 'Tops',
              ),
              SizedBox(
                height: 30.h,
              ),
              getSelectedCategorise(context),
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

  // getTop() {
  //   return StreamBuilder<Response>(
  //       stream: Provider.of<ProductProvider>(
  //         context,
  //         listen: false,
  //       ).getTopProducts(),
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.waiting) {
  //           return buildProductItemPlaceholder();
  //         }
  //         // var products = snapshot.data.body;
  //
  //         if (snapshot.hasData) {
  //           print('dataResponse${snapshot.data}');
  //           Response responseBody = snapshot.data;
  //           List<dynamic> mapList = responseBody.data['data'];
  //           if (mapList.length != 0) {
  //             return Container(
  //               //   width: ScreenUtil.defaultSize.width,
  //               child: BuildCarouselSlider(
  //                 product: mapList.map((e) => Product.fromJson(e)).toList(),
  //                 currentIndex: 0,
  //               ),
  //             );
  //           } else {
  //             return buildProductItemPlaceholder();
  //           }
  //         }else{
  //           return buildProductItemPlaceholder();
  //
  //         }
  //       });
  // }

  getTopProducts(BuildContext context) {
    if (Provider.of<ProductProvider>(
          context,
        ).productList.length ==
        0) {
      return FutureBuilder<List<Product>>(
        future: Provider.of<ProductProvider>(context, listen: false)
            .getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
                //   width: ScreenUtil.defaultSize.width,
                child: BuildCarouselSlider(
              product: snapshot.data,
              currentIndex: 0,
            ));
          } else if (snapshot.hasError) {
            return buildProductItemPlaceholder();
          }

          // By default, show a loading spinner. placeholder view
          return buildProductItemPlaceholder();
        },
      );
    } else {
      return Container(
          //   width: ScreenUtil.defaultSize.width,
          child: BuildCarouselSlider(
        product:
            Provider.of<ProductProvider>(context, listen: false).productList,
        currentIndex: 0,
      ));
    }
  }

  // getGrid() {
  //   return StreamBuilder<Response>(
  //       stream: Provider.of<ProductProvider>(
  //         context,
  //         listen: false,
  //       ).getTopProducts(),
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.waiting) {
  //           return Container(
  //             margin: EdgeInsets.symmetric(horizontal: 20.w),
  //             child: StaggeredGridView.countBuilder(
  //               physics: ScrollPhysics(),
  //               shrinkWrap: true,
  //               crossAxisCount: 4,
  //               itemCount: 5,
  //               itemBuilder: (BuildContext context, int index) =>
  //                   _buildGridItem(),
  //               staggeredTileBuilder: (int index) =>
  //                   StaggeredTile.count(2, index.isEven ? 2.5 : 2),
  //               mainAxisSpacing: 10.w,
  //               crossAxisSpacing: 10.h,
  //             ),
  //           );
  //         }
  //         // var products = snapshot.data.body;
  //         if (snapshot.hasData) {
  //           print('dataResponse${snapshot.data}');
  //           Response responseBody = snapshot.data;
  //           List<dynamic> mapList = responseBody.data['data'];
  //           List<Product> products =
  //               mapList.map((e) => Product.fromJson(e)).toList();
  //           return Container(
  //             margin: EdgeInsets.symmetric(horizontal: 20.w),
  //             child: StaggeredGridView.countBuilder(
  //               physics: ScrollPhysics(),
  //               shrinkWrap: true,
  //               crossAxisCount: 4,
  //               itemCount: products.length,
  //               itemBuilder: (BuildContext context, int index) => ProductItem(
  //                 product: products[index],
  //               ),
  //               staggeredTileBuilder: (int index) =>
  //                   StaggeredTile.count(2, index.isEven ? 2.5 : 2),
  //               mainAxisSpacing: 10.w,
  //               crossAxisSpacing: 10.h,
  //             ),
  //           );
  //         } else {
  //           return Container(
  //             margin: EdgeInsets.symmetric(horizontal: 20.w),
  //             child: StaggeredGridView.countBuilder(
  //               physics: ScrollPhysics(),
  //               shrinkWrap: true,
  //               crossAxisCount: 4,
  //               itemCount: 5,
  //               itemBuilder: (BuildContext context, int index) =>
  //                   _buildGridItem(),
  //               staggeredTileBuilder: (int index) =>
  //                   StaggeredTile.count(2, index.isEven ? 2.5 : 2),
  //               mainAxisSpacing: 10.w,
  //               crossAxisSpacing: 10.h,
  //             ),
  //           );
  //         }
  //       });
  // }
  //
  getSelectedCategorise(BuildContext context) {
    if (Provider.of<ProductProvider>(
          context,
        ).productList.length ==
        0) {
      return FutureBuilder<List<Category>>(
        future: Provider.of<HomeProvider>(context, listen: false)
            .getAllCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                child: StaggeredGridView.countBuilder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) => ProductItem(
                    category: snapshot.data[index],
                  ),
                  staggeredTileBuilder: (int index) =>
                      StaggeredTile.count(2, index.isEven ? 2.5 : 2),
                  mainAxisSpacing: 10.w,
                  crossAxisSpacing: 10.h,
                ));
          } else if (snapshot.hasError) {
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
          }
          // By default, show a loading spinner. placeholder view
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
        },
      );
    } else {
      return Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: StaggeredGridView.countBuilder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 4,
            itemCount: Provider.of<HomeProvider>(context, listen: false)
                .categoriesList
                .length,
            itemBuilder: (BuildContext context, int index) => ProductItem(
              category : Provider.of<HomeProvider>(context, listen: false)
                  .categoriesList[index],
            ),
            staggeredTileBuilder: (int index) =>
                StaggeredTile.count(2, index.isEven ? 2.5 : 2),
            mainAxisSpacing: 10.w,
            crossAxisSpacing: 10.h,
          ));
    }
  }

  getCategories(BuildContext context) {
    print('////////////////////////////////function//////////////////////////////////');
    return Container(
      width: ScreenUtil.defaultSize.width.w,
      height: 50.h,
      // color: WhiteColor,
      child: FutureBuilder<List<Category>>(
        future: Provider.of<HomeProvider>(
          context,
          listen: false,
        ).getAllCategories(),
        builder: (context, snapshot) {

          if (snapshot.hasData) {
            _tabController = new TabController(
              length: snapshot.data.length,
              vsync: this,
              initialIndex: _getInitialIndex(),
            )..addListener(() {
                print("New Index ${_tabController.index}");
                PageStorage.of(context).writeState(
                  context,
                  _tabController.index,
                );
              });
            return TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicator: MD2Indicator(
                indicatorSize: MD2IndicatorSize.full,
                indicatorHeight: 4.h,
                indicatorColor: PrimaryColor,
              ),
              indicatorColor: PrimaryColor,
              key: PageStorageKey<Type>(TabBar),
              controller: _tabController,
              isScrollable: true,
              tabs: List<Tab>.generate(snapshot.data.length, (int tabIndex) {
                return Tab(
                  child: InkWell(
                    onTap: () {
                      NavigationService.navigationService.navigateToWidget(
                        CategorySearchScreen(
                          category: snapshot.data[tabIndex],
                        ),
                      );
                    },
                    child: Center(
                      child: Shimmer.fromColors(
                        baseColor: BlueDarkColor,
                        highlightColor: PrimaryColor.withOpacity(0.3),
                        child: Text(
                          context.locale.toString() == 'en'
                              ? snapshot.data[tabIndex].translations[1].title
                              : snapshot.data[tabIndex].translations[0].title,
                          style: TabsTextStyle,
                        ),
                      ),
                    ),
                  ),
                  // text: 'Tab ${tabIndex}',
                );
              }),
            );
          } else if (snapshot.hasError) {
            return Container(
              height: 50.h,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      width: 50,
                      child: Center(
                        child: PlaceholderLines(
                          count: 1,
                          animate: true,
                          color: PrimaryColor.withOpacity(0.3),
                        ),
                      ),
                      // text: 'Tab ${tabIndex}',
                    );
                  }),
            );
          }

          // By default, show a loading spinner. placeholder view
          return Container(
            height: 50.h,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                    width: 50,
                    child: Center(
                      child: PlaceholderLines(
                        count: 1,
                        animate: true,
                        color: PrimaryColor.withOpacity(0.3),
                      ),
                    ),
                    // text: 'Tab ${tabIndex}',
                  );
                }),
          );
        },
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
            return Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _scrollController.animateTo(
                        0,
                        duration: Duration(milliseconds: 5000),
                        curve: Curves.fastOutSlowIn,
                      );
                    });
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
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    // physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) => BrandItem(
                        icon: snapshot.data[index].smallBrandLogo,
                        press: () {}),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _scrollController.animateTo(
                        _scrollController.position.maxScrollExtent,
                        duration: Duration(milliseconds: 6000),
                        curve: Curves.fastOutSlowIn,
                      );
                    });
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
          } else if (snapshot.hasError) {
            return Container(
              height: 40.h,
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                // physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
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
            height: 40.h,
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              // physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
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
        });
  }

  // getBrands() {
  //   return Selector<BrandProvider, List<Brands>>(
  //       builder: (context, response, widget) {
  //     if (response == null) {
  //       return CircularProgressIndicator();
  //     } else if (response.isEmpty) {
  //       return Container();
  //     } else {
  //       return Row(
  //         children: [
  //           InkWell(
  //               onTap: () {
  //                 setState(() {
  //                   _scrollController.animateTo(0,
  //                       duration: Duration(milliseconds: 5000),
  //                       curve: Curves.fastOutSlowIn);
  //                 });
  //               },
  //               child: Container(
  //                   width: 0.15.sw,
  //                   child: CircleAvatar(
  //                     backgroundColor: WhiteColor,
  //                     radius: ScreenUtil().radius(15),
  //                     child: Icon(
  //                       Icons.arrow_back_ios,
  //                       color: BlueDarkColor,
  //                       size: ScreenUtil().radius(15),
  //                     ),
  //                   ))),
  //           Container(
  //             width: 0.7.sw,
  //             // margin: EdgeInsets.symmetric(horizontal: 33.5.w),
  //             height: 40.h,
  //             child: ListView.builder(
  //               controller: _scrollController,
  //               scrollDirection: Axis.horizontal,
  //               // physics: NeverScrollableScrollPhysics(),
  //               itemCount: response.length,
  //               itemBuilder: (context, index) => BrandItem(
  //                   icon: response[index].smallBrandLogo, press: () {}),
  //             ),
  //           ),
  //           InkWell(
  //               onTap: () {
  //                 setState(() {
  //                   _scrollController.animateTo(
  //                       _scrollController.position.maxScrollExtent,
  //                       duration: Duration(milliseconds: 6000),
  //                       curve: Curves.fastOutSlowIn);
  //                 });
  //               },
  //               child: Container(
  //                   width: 0.15.sw,
  //                   child: CircleAvatar(
  //                     backgroundColor: WhiteColor,
  //                     radius: ScreenUtil().radius(15),
  //                     child: Icon(
  //                       Icons.arrow_forward_ios,
  //                       color: BlueDarkColor,
  //                       size: ScreenUtil().radius(15),
  //                     ),
  //                   ))),
  //         ],
  //       );
  //     }
  //   }, selector: (context, provider) {
  //     return provider.brandList;
  //   });
  // }

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
            flex: 20,
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

  buildProductItemPlaceholder() {
    return Container(
      // height:(0.70.sh)-50.h,
      decoration: BoxDecoration(
        color: WhiteColor,
        borderRadius: BorderRadius.circular(
          ScreenUtil().radius(10),
        ),
        boxShadow: [
          BoxShadow(
            color: ShadowColor,
            // spreadRadius: 5,
            blurRadius: 7.0,
            offset: Offset(0.0, 8),
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 6.w,
        vertical: 5.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              ScreenUtil().radius(10),
            ),
            child: Container(
              width: double.infinity,
              height: (0.40.sh),
              child: SvgPicture.asset(
                'assets/svg/image_placeholder.svg',
                color: CurveColor,
              ),
            ),
          ),
          Container(
            // height:200.h,
            // width: ScreenUtil.defaultSize.width/2,
            margin: context.locale.toString() == 'en'
                ? EdgeInsets.only(top: 10.h, left: 10.w)
                : EdgeInsets.only(top: 10.h, right: 10.w),
            child: Row(
              children: [
                Container(
                  height: 80.h,
                  width: 0.2.sw,
                  child: Center(
                    child: Icon(
                      Icons.photo_rounded,
                      color: CurveColor,
                      size: 50,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Container(
                  width: 0.5.sw,
                  // child:Expanded(
                  child: PlaceholderLines(
                    count: 3,
                    animate: true,
                    color: PrimaryColor.withOpacity(0.3),
                  ),
                  // ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
