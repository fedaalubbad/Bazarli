import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/navigation_service/navigation_service.dart';
import 'package:bazarli/ViewModel/authentication_provider.dart';
import 'package:bazarli/shared_preference/sp_helper.dart';
import 'package:bazarli/view/home/cart/shipping_addresses_screen.dart';
import 'package:bazarli/view/home/profile/profile_details_screen.dart';
import 'package:bazarli/view/home/profile/returns_screen.dart';
import 'package:bazarli/view/home/profile/wishlist_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'clims_screen.dart';
import 'component/extra_widget.dart';
import 'languages_screen.dart';
import 'orders_screen.dart';
class ProfileScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
  return ProfileScreenState();
  }
}
class ProfileScreenState extends State<ProfileScreen> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20.w,right: 20.w),
        child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileListItemWidget(context,'Profile',1,'assets/svg/user_icon.svg'),
                  Divider(),
                  ProfileListItemWidget(context,'Orders',2,'assets/svg/orders_icon.svg'),
                  Divider(),
                  ProfileListItemWidget(context,'Addresses',3,'assets/svg/addresses_icon.svg'),
                  // Divider(),
                  // ProfileListItemWidget(context,'Claims',4,'assets/svg/fi_codesandbox.svg'),
                  // Divider(),
                  // ProfileListItemWidget(context,'Returns',5,'assets/svg/fi_refresh.svg'),
                  Divider(),
                  ProfileListItemWidget(context,'Wishlist',6,'assets/svg/fav.svg'),
                  Divider(),
                  ProfileListItemWidget(context,'Language',7,'assets/svg/language_icon.svg'),
                  Divider(),
                  ProfileListItemWidget(context,'SignOut',8,'assets/svg/fi_logout.svg'),
                  Divider(),
                  SizedBox(height:15.h,),
                  ExtraWidget(),
                  SizedBox(height:85.h,),

                ])));
  }

  ProfileListItemWidget(BuildContext context,text,int index,String asset){
    return InkWell(
      onTap: (){
        SPHelper.spHelper.isLoged()?
        index==1?
       NavigationService.navigationService.navigateToWidget(ProfileDetailsScreen())
            :index==2?
        NavigationService.navigationService.navigateToWidget(OrderScreen())
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
       :Provider.of<AuthenticationProvider>(context, listen: false).logout(context)
        :Provider.of<AuthenticationProvider>(context, listen: false).logout(context);
      },
      child: Container(
        // width: ScreenUtil.defaultSize.width,
        height: 50.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,

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

          ],
        ),
      ),
    );
  }


}
