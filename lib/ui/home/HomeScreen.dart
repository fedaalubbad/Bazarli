import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return HomeScreenState();
  }

}
class HomeScreenState extends State<HomeScreen>{
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
                  Container(),
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
                       title: Text(
                         translator.translate('Home'),
                         style: translator.currentLanguage == 'ar'
                             ? GoogleFonts.tajawal(textStyle: BottomBarTextStyle)
                             : GoogleFonts.poppins(textStyle: BottomBarTextStyle),
                       ),
                       icon: SvgPicture.asset('assets/svg/fi_home.svg',
                         color: GrayColor,),

                       activeIcon:SvgPicture.asset('assets/svg/fi_home.svg',
                         color: PrimaryColor,
                       ),
                     ),
                     // if(SPHelper.spHelper.getUSer().isCustomer)
                     BottomNavigationBarItem(
                       title: Text(
                         translator.translate('Categories'),
                         style: translator.currentLanguage == 'ar'
                             ? GoogleFonts.tajawal(textStyle: BottomBarTextStyle)
                             : GoogleFonts.poppins(textStyle: BottomBarTextStyle),
                       ),
                       icon: SvgPicture.asset('assets/svg/fi_book-open.svg',
                           color:GrayColor),
                       activeIcon:SvgPicture.asset('assets/svg/fi_book-open.svg',
                           color:PrimaryColor),
                     ),

                       BottomNavigationBarItem(
                         title: Text(
                           translator.translate('Profile'),
                           style: translator.currentLanguage == 'ar'
                               ? GoogleFonts.tajawal(textStyle: BottomBarTextStyle)
                               : GoogleFonts.poppins(textStyle: BottomBarTextStyle),
                         ),
                         icon: SvgPicture.asset('assets/svg/fi_user.svg',
                             color:GrayColor),
                         activeIcon:SvgPicture.asset('assets/svg/fi_user.svg',
                             color:PrimaryColor),
                       ),


                     BottomNavigationBarItem(
                       title: Text(
                         translator.translate('Cart'),
                         style: translator.currentLanguage == 'ar'
                             ? GoogleFonts.tajawal(textStyle: BottomBarTextStyle)
                             : GoogleFonts.poppins(textStyle: BottomBarTextStyle),
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

}