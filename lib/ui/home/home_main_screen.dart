import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/ui/home/cart/cart_screen.dart';
import 'package:bazarli/ui/home/profile/component/profile_toolbar.dart';
import 'package:bazarli/ui/home/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'Home/home_screen.dart';
import 'Home/component/home_toolbar.dart';
import 'categories/CategoryScreen.dart';

class HomeMainScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return HomeScreenState();
  }
}
class HomeScreenState extends State<HomeMainScreen> {
  // bool isProfile=false;
  int _selectedPageIndex=0;
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  void _viewPage(int index) {
    setState(() {
      _selectedPageIndex = index;
      pageController.animateToPage(index, duration: Duration(milliseconds: 1), curve: Curves.bounceIn);

      // _selectedPageIndex==2?
      // isProfile==true:isProfile==false;
    });
  }
  List<Map<String,Object>> _pages=[
    {
      'page':HomeScreen()
    },
    {
      'page':CategoriesScreen()
    },
    {
      'page':ProfileScreen()
    },
    {
      'page':CartScreen()
    }
  ];
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Stack(children:[
      _selectedPageIndex==2?ProfileToolBar(isProfile: true,): HomeToolBar(isHome: true,),
       Container(
           margin: EdgeInsets.only(top:_selectedPageIndex==2?ScreenUtil.defaultSize.height/4.h:120.h),
             height: double.infinity,
             width: double.infinity,
             color: HomeBackgroundColor,
             child:
             PageView.builder(

                 controller: pageController,
             itemCount: 4,
               itemBuilder: (context, position) {
                 return
                   position == 0? HomeScreen()
                 :position==1?CategoriesScreen()
                 :position==2?  ProfileScreen()
                 :CartScreen();
               },
                 onPageChanged: (page) {
                   setState(() {
                     _selectedPageIndex = page;
                   });
                 }
             )
            // PageView(
            //   controller: pageController,
            //   children: <Widget>[
            //     HomeScreen(),
            //     CategoriesScreen(),
            //     ProfileScreen(),
            //     CartScreen()
            //   ],
            //   onPageChanged: (page) {
            //     setState(() {
            //      _selectedPageIndex = page;
            //     });
            //   },
            // )
               //   Column(
               //     children: [
               // _pages[_selectedPageIndex]['page'],
               //
               //   SizedBox(height:85.h,),
               //
               //     ],
               //   ),
               ),

           // ),

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
                 boxShadow: [
                   BoxShadow(
                       color: ShadowColor,
                       spreadRadius: 5 ,
                       blurRadius: 7.0,
                       offset: Offset(0.0, 8)
                   ),
                 ],
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
                       ).tr(),
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



}