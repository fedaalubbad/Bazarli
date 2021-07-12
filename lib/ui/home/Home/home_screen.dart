import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/models/brand_model/brand_classes/brand.dart';
import 'package:bazarli/navigation_service/navigation_service.dart';
import 'package:bazarli/providers/BrandProvider.dart';
import 'package:bazarli/providers/CategoriesProvider.dart';
import 'package:bazarli/providers/Product_provider.dart';
import 'package:bazarli/ui/home/Home/component/brand_item.dart';
import 'package:bazarli/ui/home/Home/component/dotted_slider.dart';
import 'package:bazarli/ui/home/Home/component/product_item.dart';
import 'package:bazarli/ui/search/categorySearchScreen.dart';
import 'package:bazarli/ui/home/utils/indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'component/carousel_slider.dart';
import 'component/home_title_widget.dart';

class HomeScreen extends StatefulWidget{
@override
State<StatefulWidget> createState() {
  return HomeScreenState();
}
}
class HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = new TabController(
      length: Provider.of<CategoriesProvider>(context,listen: false).categoriesList.length,
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

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        getCategories(context),
        Divider(color: DividerColor,height: 1.h,),
        SizedBox(height:10.5.h,),
        getBrands(),
        SizedBox(height: 15.h,),
        dottedSlider(),
        SizedBox(height: 30.h,),
        BuildHomeTitle(titleText:'Flash Sale\nUP TO 80% OFF',buttonText: 'Shop Now',),
        SizedBox(height: 30.h,),
        getTopProducts(context),
        SizedBox(height: 10.h,),
        BuildHomeTitle(titleText:'Tops',),
        SizedBox(height: 30.h,),
        getGridProducts(context),
      ],
    );
}

  getTopProducts(BuildContext context){
    return Container(
      //   width: ScreenUtil.defaultSize.width,
        child:  BuildCarouselSlider(
          product:Provider.of<ProductProvider>(context,listen: false).productList
          ,currentIndex: 0,)


    );
  }
  getGridProducts(BuildContext context){
    return Container(
         margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: StaggeredGridView.countBuilder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 4,
          itemCount:Provider.of<ProductProvider>(context,listen: false).productList.length,
          itemBuilder: (BuildContext context, int index) =>
              ProductItem(product:Provider.of<ProductProvider>(context,listen: false).productList[index] ,),
          staggeredTileBuilder: (int index) =>

          StaggeredTile.count(2 ,index.isEven?2.5:2),
          mainAxisSpacing: 10.w,
          crossAxisSpacing:10.h,

        )

    );
  }

  getCategories(BuildContext context){
    return  Container(
      width: ScreenUtil.defaultSize.width,
      height: 50.h,
      // color: WhiteColor,
      child: TabBar(
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
        tabs:  List<Tab>.generate( Provider.of<CategoriesProvider>(context,listen: false).categoriesList.length, (int tabIndex) {
          return Tab(
            child:InkWell(
              onTap: (){
                NavigationService.navigationService.
                navigateToWidget(CategorySearchScreen(category:Provider.of<CategoriesProvider>(context,listen: false).categoriesList[tabIndex] ,));
              },
              child: Center(
                child: Text(Provider.of<CategoriesProvider>(context,listen: false).categoriesList[tabIndex].name,style: TabsTextStyle,),),
            ) ,
            // text: 'Tab ${tabIndex}',
          );
        }),
      ),
    );
  }



  getBrands(){
    return Selector<BrandProvider,List<Brands>>(builder:(context,response,widget){
      if(response==null){
        return CircularProgressIndicator();
      }else if(response.isEmpty){
        return Container();
      }else{
        return  Row(
          children: [
            InkWell(
                onTap: (){
                    setState(() {
                      _scrollController.animateTo(
                          0,
                          duration: Duration(milliseconds: 5000),
                          curve: Curves.fastOutSlowIn);
                    });

                },
                child: Container(width:0.15.sw,
                    child: CircleAvatar(backgroundColor: WhiteColor,radius: ScreenUtil().radius(15),
                      child:Icon(Icons.arrow_back_ios,color: BlueDarkColor,size: ScreenUtil().radius(15),) ,))),

            Container(
              width: 0.7.sw,
              // margin: EdgeInsets.symmetric(horizontal: 33.5.w),
              height: 40.h,
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                // physics: NeverScrollableScrollPhysics(),
                itemCount: response.length,
                itemBuilder: (context, index) =>BrandItem(
                    icon: response[index].smallBrandLogo,
                    press:(){}
                ),
              ),

            ),
            InkWell(
                onTap: (){
                       setState(() {
                         _scrollController.animateTo(
                             _scrollController.position.maxScrollExtent,
                             duration: Duration(milliseconds: 6000),
                             curve: Curves.fastOutSlowIn);
                       });


                },
                child: Container(width:0.15.sw,
                    child: CircleAvatar(backgroundColor: WhiteColor,radius: ScreenUtil().radius(15),
                      child:Icon(Icons.arrow_forward_ios,color: BlueDarkColor,size: ScreenUtil().radius(15),) ,))),

          ],
        );
      }
    }, selector: (context,provider){
      return provider.brandList;
    });
  }
  dottedSlider() {
    // ProductResponse.fromJson(widget.product).imagesList.add(ProductResponse.fromJson(widget.product).image);
    return DottedSlider(
        maxHeight:140.h,
        children: [
          _productSlideImage('assets/images/promotion_one.png'),
          _productSlideImage('assets/images/promotion_one.png'),
          // _productSlideImage('https://www.google.ps/url?sa=i&url=https%3A%2F%2Fteamfusionlifestyle.com%2F2020%2F10%2F07%2Fcycle-of-fashion-trend%2F&psig=AOvVaw095oKbomyb-F0yDCocYfmv&ust=1625833349036000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCJjZ87K70_ECFQAAAAAdAAAAABAI'),
          // _productSlideImage('https://www.google.ps/url?sa=i&url=http%3A%2F%2Fthepreppursuit.com%2Findian-fashion-industry%2F&psig=AOvVaw095oKbomyb-F0yDCocYfmv&ust=1625833349036000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCJjZ87K70_ECFQAAAAAdAAAAABAO'),

        ]
    );
  }
  _productSlideImage(String imageUrl) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      height: 140.h,
      width: ScreenUtil.defaultSize.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ScreenUtil().radius(2)),
        image:
        DecorationImage(
            image: AssetImage(imageUrl), fit: BoxFit.cover),
      ),

    );
  }
}