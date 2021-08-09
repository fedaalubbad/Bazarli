import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/models/Categories_model/category_response.dart';
import 'package:bazarli/navigation_service/navigation_service.dart';
import 'package:bazarli/providers/Product_provider.dart';
import 'package:bazarli/ui/home/Home/component/home_toolbar.dart';
import 'package:bazarli/ui/search/category_select_screen.dart';
import 'package:bazarli/ui/search/new_arrivals_screen.dart';
import 'package:bazarli/ui/search/price_search_screen.dart';
import 'package:bazarli/ui/search/product_rating_screen.dart';
import 'package:bazarli/ui/search/sizes_search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'brand_screen.dart';
import 'color_seach_screen.dart';

class CategorySearchScreen extends StatelessWidget {
  Category category;
  CategorySearchScreen({this.category});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      HomeToolBar(
        isHome: false,
      ),
      Container(
          margin: EdgeInsets.only(top: 120.h,left: 20.w,right: 20.w),
          child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5.h,),
                 //    Container(
                 // // width: ScreenUtil.defaultSize.width,
                 // height: 60.h,
                 //       child: Row(
                 //       crossAxisAlignment: CrossAxisAlignment.center,
                 //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 //       children: [
                 //         Column(
                 //           children: [
                 //             Text('Category',style: TextLabelStyle,).tr(),
                 //             SizedBox(height: 5.h,),
                 //             Text(category==null?'':category.name,style: DescriptionStyle,),
                 //           ],
                 //         ),
                 //         context.locale.toString()=='ar'?
                 //         SvgPicture.asset('assets/svg/arrow_left.svg',width: 12.w,height: 12.h,)
                 //        :SvgPicture.asset('assets/svg/arrow_right.svg',width: 12.w,height: 12.h,),
                 //       ],
                 //       ),
                 //    ),
                 //    Divider(),
                    categoryWidget(context,'Category',Provider.of<ProductProvider>(context, listen: false).categoryName,0,),
                    Divider(),
                    categoryWidget(context,'Brand',Provider.of<ProductProvider>(context, listen: false).brandName,1),
                    Divider(),
                    categoryWidget(context,'Price','',2),
                    Divider(),
                    categoryWidget(context,'ProductRating','',3),
                    Divider(),
                    categoryWidget(context,'Size','',4,),
                    Divider(),
                    categoryWidget(context,'NewArrivals','',5),
                    Divider(),
                    categoryWidget(context,'Department','',6),
                    Divider(),
                    categoryWidget(context,'Color','',7),
                    Divider(),
                    categoryWidget(context,'Seller','',8),
                    Divider(),
                    SizedBox(height:15.h,),

                    buildMoreFiltersWidget(),

                  SizedBox(height:15.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    buildResetButton(),
                    SizedBox(width: 20.w,),
                    buildApplyButton(),

                  ],
                  ),


                    SizedBox(height:30.h,),

                  ])))
    ]));
  }

  categoryWidget(BuildContext context,String title,String subTitle,int index){
    return InkWell(
         onTap: (){
          index==0?
          NavigationService.navigationService.navigateToWidget(CategorySelectScreen())
          :index==1?
          NavigationService.navigationService.navigateToWidget(BrandScreen())
          :index==2?
          NavigationService.navigationService.navigateToWidget(PriceSearchScreen())
          :index==3?
          NavigationService.navigationService.navigateToWidget(ProductRatingSearchScreen())
          :index==4?
          NavigationService.navigationService.navigateToWidget(SizesSearchScreen())
          : index==5?
          NavigationService.navigationService.navigateToWidget(NewArrivalScreen())
          : index==6?
          NavigationService.navigationService.navigateToWidget(NewArrivalScreen())
          : index==7?
          NavigationService.navigationService.navigateToWidget(ColorsSearchScreen())
         :NavigationService.navigationService.navigateToWidget(NewArrivalScreen());

      },
      child: Container(
        // width: ScreenUtil.defaultSize.width,
        height: 60.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(title,style: TextLabelStyle,).tr(),
                    SizedBox(height: 5.h,),
                    Text(subTitle==null?'':subTitle,style: DescriptionStyle,),
                  ],
                ),
                // Text(text,style: TextLabelStyle,).tr(),
                context.locale.toString()=='ar'?
                SvgPicture.asset('assets/svg/arrow_left.svg',width: 12.w,height: 12.h,)
                :SvgPicture.asset('assets/svg/arrow_right.svg',width: 12.w,height: 12.h,)

              ],
            ),

          ],
        ),
      ),
    );
  }

  buildMoreFiltersWidget(){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('MoreFilters',style: TitlesInHome,).tr(),
           SizedBox(height: 10.h,),
    Container(
    height: 50.h,
    child: ListView(
    scrollDirection: Axis.horizontal,
    children: [
      buildFilterWidget('Women'),
      buildFilterWidget('Clothes'),
      buildFilterWidget('Lee cooper'),
      buildFilterWidget('Adidas'),
      buildFilterWidget('Reebok'),

        ],
      ),
    )
        ]
    )
    );
  }
buildFilterWidget(String text){
    return
          Container(
            margin: EdgeInsets.symmetric(horizontal:ScreenUtil().radius(5)),
            padding: EdgeInsets.symmetric(horizontal:ScreenUtil().radius(5)),
            height:40.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color:GrayLiteColor,
              borderRadius:
              BorderRadius.circular(ScreenUtil().radius(5)),
            ),
            child: Text(text,style: TextLabelStyle,),


    );
}

  buildResetButton(){
    return Container(
      child: InkWell(
          onTap: () {
          },
          child: Container(
            // margin: EdgeInsets.symmetric(horizontal: 20.w),
            alignment: Alignment.center,
            height: 50.h,
            width: 70.w,
            decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(ScreenUtil().radius(5)),
                border: Border.all(color:PrimaryColor)
            ),
            child: Text(
              'Reset',
              style:SignInTextStyle,
            ).tr(),
          )),
    );
  }
  buildApplyButton(){
    return Container(
      child: InkWell(
          onTap: () {
          },
          child: Container(
            padding: EdgeInsets.all(ScreenUtil().radius(12)),
            alignment: Alignment.center,
            height: 50.h,
            width:200.w,
            decoration: BoxDecoration(
              color: PrimaryColor,
              borderRadius:
              BorderRadius.circular(ScreenUtil().radius(5)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('1864',
                      style:SliderNextStyle,
                    ),
                    SizedBox(width: 5.w,),
                    Text('Items',
                      style:SliderNextStyle,
                    ).tr(),
                  ],
                ),
                Text(
                  'Apply',
                  style:SliderNextStyle,
                ).tr(),
              ],
            ),
          )),
    );
  }

}
