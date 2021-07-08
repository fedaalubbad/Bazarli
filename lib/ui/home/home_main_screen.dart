import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/models/brand_model/brand_classes/brand.dart';
import 'package:bazarli/providers/BrandProvider.dart';
import 'package:bazarli/providers/Product_provider.dart';
import 'package:bazarli/ui/home/Home/component/brand_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'Home/component/dotted_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeMainScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return HomeScreenState();
  }
}
class HomeScreenState extends State<HomeMainScreen>{
  int _selectedPageIndex=0;
  void _viewPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Stack(children:[
           Container(
             padding: EdgeInsets.only(top: 50.h,left: 20.w,right: 20.h),
             color: HomeBackgroundColor,
             child: Column(
               children: [
               getBrands(),
               dottedSlider(),

                 // FlatButton(onPressed: (){
                 //   Provider.of<ProductProvider>(context, listen: false).getAllProducts();
                 // }, child:Text('print'))
               ],
             ),
           ),



 ////////////////////////////////bottom navigation bar
           Positioned(
             left: 0,
             right: 0,
             bottom: 0,
             child:Container(
               height:83.h ,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.only(
                     topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                 // boxShadow: [
                 //   BoxShadow(color: MyColors.greyColor.withOpacity(0.7), spreadRadius: 0, blurRadius: 0,),
                 // ],
               ),
               child: ClipRRect(
                 borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(ScreenUtil().radius(15)),
                   topRight: Radius.circular(ScreenUtil().radius(15)),
                 ),
                 child:BottomNavigationBar(
                   onTap: _viewPage,
                   type: BottomNavigationBarType.fixed,
                   currentIndex: _selectedPageIndex,
                   selectedFontSize: 16,
                   unselectedFontSize: 16,
                   selectedItemColor: PrimaryColor,
                   unselectedItemColor:GrayColor,
                   backgroundColor:WhiteColor,
                   // showSelectedLabels: true,
                   // showUnselectedLabels: false,
                   items: [
                     BottomNavigationBarItem(
                       title: Text('Home',
                         style: BottomBarTextStyle
                         ).tr(),
                       icon: SvgPicture.asset('assets/svg/fi_home.svg',
                         color: GrayColor,),

                       activeIcon:SvgPicture.asset('assets/svg/fi_home.svg',
                         color: PrimaryColor,
                       ),
                     ),
                     // if(SPHelper.spHelper.getUSer().isCustomer)
                     BottomNavigationBarItem(
                       title: Text('Categories',
                         style:  BottomBarTextStyle
                       ).tr(),
                       icon: SvgPicture.asset('assets/svg/fi_book-open.svg',
                           color:GrayColor),
                       activeIcon:SvgPicture.asset('assets/svg/fi_book-open.svg',
                           color:PrimaryColor),
                     ),

                       BottomNavigationBarItem(
                         title: Text('Profile',
                           style: BottomBarTextStyle,
                         ).tr(),
                         icon: SvgPicture.asset('assets/svg/fi_user.svg',
                             color:GrayColor),
                         activeIcon:SvgPicture.asset('assets/svg/fi_user.svg',
                             color:PrimaryColor),
                       ),


                     BottomNavigationBarItem(
                       title: Text('Cart',
                         style: BottomBarTextStyle
                       ),
                       icon: SvgPicture.asset('assets/svg/fi_shopping-cart.svg',
                           color:GrayColor),
                       activeIcon:SvgPicture.asset('assets/svg/fi_shopping-cart.svg',
                           color:PrimaryColor),
                     ),
                   ],
                 ),
               ),
             ),
           )
         ]),
   );


  }


  getBrands(){
   return Selector<BrandProvider,List<Brands>>(builder:(context,response,widget){
    if(response==null){
    return CircularProgressIndicator();
    }else if(response.isEmpty){
    return Container();
    }else{
    return  Container(
      height: 40.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          // physics: NeverScrollableScrollPhysics(),
          itemCount: response.length,
          itemBuilder: (context, index) =>BrandItem(
            icon: response[index].smallBrandLogo,
            press:(){}
          ),
      ),

    );
    }
    }, selector: (context,provider){
      return provider.brandList;
    });
  }
  dottedSlider() {
    // ProductResponse.fromJson(widget.product).imagesList.add(ProductResponse.fromJson(widget.product).image);
    return DottedSlider(
        maxHeight: ScreenUtil.defaultSize.height / 3,
        children: [
        _productSlideImage('assets/images/promotion_one.png'),
        // _productSlideImage('https://www.google.ps/url?sa=i&url=https%3A%2F%2Fteamfusionlifestyle.com%2F2020%2F10%2F07%2Fcycle-of-fashion-trend%2F&psig=AOvVaw095oKbomyb-F0yDCocYfmv&ust=1625833349036000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCJjZ87K70_ECFQAAAAAdAAAAABAI'),
        // _productSlideImage('https://www.google.ps/url?sa=i&url=http%3A%2F%2Fthepreppursuit.com%2Findian-fashion-industry%2F&psig=AOvVaw095oKbomyb-F0yDCocYfmv&ust=1625833349036000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCJjZ87K70_ECFQAAAAAdAAAAABAO'),

        ]
    );
  }
  _productSlideImage(String imageUrl) {
    return Container(
        margin: EdgeInsets.all(8),
        height: ScreenUtil.defaultSize.width / 3,
        width: ScreenUtil.defaultSize.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ScreenUtil().radius(15)),
          image:
          DecorationImage(
              image: AssetImage(imageUrl), fit: BoxFit.cover),
        ),

    );
  }
}