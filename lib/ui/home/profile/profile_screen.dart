import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/navigation_service/navigation_service.dart';
import 'package:bazarli/ui/home/cart/addAddressScreen.dart';
import 'package:bazarli/ui/home/cart/shipping_addresses_screen.dart';
import 'package:bazarli/ui/home/profile/profile_details_screen.dart';
import 'package:bazarli/ui/home/profile/returns_screen.dart';
import 'package:bazarli/ui/home/profile/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';

import 'clims_screen.dart';
import 'languages_screen.dart';
import 'orders_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20.w,right: 20.w),
        child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height:5.h,),
                  ProfileListItemWidget(context,'Profile',1,'assets/svg/user_icon.svg'),
                  ProfileListItemWidget(context,'Orders',2,'assets/svg/orders_icon.svg'),
                  ProfileListItemWidget(context,'Addresses',3,'assets/svg/addresses_icon.svg'),
                  ProfileListItemWidget(context,'Claims',4,'assets/svg/fi_codesandbox.svg'),
                  ProfileListItemWidget(context,'Returns',5,'assets/svg/fi_refresh.svg'),
                  ProfileListItemWidget(context,'Wishlist',6,'assets/svg/fav.svg'),
                  ProfileListItemWidget(context,'Language',7,'assets/svg/language_icon.svg'),
                  ProfileListItemWidget(context,'Sign out',8,'assets/svg/fi_logout.svg'),

                  SizedBox(height:15.h,),

                  SizedBox(height:30.h,),

                ])));
  }

  ProfileListItemWidget(BuildContext context,text,int index,String asset){
    return InkWell(
      onTap: (){
        index==1?
        NavigationService.navigationService.navigateToWidget(ProfileDetailsScreen())
            :index==2?
        NavigationService.navigationService.navigateToWidget(OrdersScreen())
            :index==3?
        NavigationService.navigationService.navigateToWidget(ShippingAdressScreen())
            :index==4?
        NavigationService.navigationService.navigateToWidget(ClimesScreen())
            :index==5?
        NavigationService.navigationService.navigateToWidget(ReturnsScreen())
            :index==6?
        NavigationService.navigationService.navigateToWidget(WishListScreen())
            :index==7?
        NavigationService.navigationService.navigateToWidget(LanguagesScreen())
       :print('logout');

      },
      child: Container(
        // width: ScreenUtil.defaultSize.width,
        height: 64.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(asset,color: BlueDarkColor,),
                    SizedBox(width: 16.w,),
                    Text(text,style: TextLabelStyle,).tr(),
                  ],
                ),
                context.locale.toString()=='ar'?
                SvgPicture.asset('assets/svg/arrow_left.svg',width: 12.w,height: 12.h,color:  BlueDarkColor,)
                    :SvgPicture.asset('assets/svg/arrow_right.svg',width: 12.w,height: 12.h,color:  BlueDarkColor,)

              ],
            ),
            Divider(),

          ],
        ),
      ),
    );
  }
}
