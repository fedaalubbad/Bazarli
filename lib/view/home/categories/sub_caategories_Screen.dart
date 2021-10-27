import 'package:bazarli/ViewModel/orders_provider.dart';
import 'package:bazarli/ViewModel/wishlist_provider.dart';
import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/ViewModel/Product_provider.dart';
import 'package:bazarli/models/Categories_model/category_response.dart';
import 'package:bazarli/models/product_model/product_response.dart';
import 'package:bazarli/view/home/Home/component/star_rating.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:bazarli/view/home/Home/component/home_toolbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'component/circle_categort_top_item.dart';
import 'component/product_grid_menue_item.dart';
import 'component/product_listmenu_Item.dart';

class SubCategoriesScreen extends StatefulWidget{
  CategoryResponse categoryResponse;
  SubCategoriesScreen({this.categoryResponse});
  @override
  State<StatefulWidget> createState() {
    return SubCategoriesScreenState();
  }

}
class SubCategoriesScreenState extends State<SubCategoriesScreen>{
  bool isMenue=false;
  @override
  void initState() {
   if(widget.categoryResponse!=null){
     Provider.of<ProductProvider>(context, listen: false).getSearchProductsByCategoryId(category: widget.categoryResponse);

   }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Stack(
       children: [
         HomeToolBar(isHome: false,),
         Container(
           margin: EdgeInsets.only(top: 120.h),
           width: double.infinity,
           height: double.infinity,
           child: SingleChildScrollView(
                 child: Column(
                   children: [
                     SizedBox(height: 1.h,),
                     filterBar(),
                     SizedBox(height: 1.h,),
                     getTopBarCircles(),
                     !isMenue?
                      getProductsInList(context)
                      : getProductsGrid(context),
                         ],

               ),

           ),

         ),
       ],
     ),
   );
  }

filterBar(){
   return Container(
     height: 45.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset('assets/svg/fi_shuffle.svg'),
          InkWell(onTap: (){
               isMenue=!isMenue;
               setState(() {

               });
             },
           child: !isMenue?SvgPicture.asset('assets/svg/grid.svg'):SvgPicture.asset('assets/svg/menu.svg')),
          Row(
            children: [
              Text('filter',style: TextLabelStyle,),
              SizedBox(width: 2.w,),
              SvgPicture.asset('assets/svg/arrow_down.svg'),
            ],
          ),
          Row(
            children: [
              Text('sort by',style: TextLabelStyle,),
              SizedBox(width: 2.w,),
              SvgPicture.asset('assets/svg/arrow_down.svg'),
            ],
          ),
        ],
      ),
    );
}

 getTopBarCircles(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      height: 65.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
           itemCount: 8,
          itemBuilder: (context,index){
           return CircleTopCategoryItem();
          }),
    );
 }

getProductsGrid(BuildContext context){
  return Container(
    // margin: EdgeInsets.only(bottom: 20.h),
    // height: 450.h,
    child: ListView.builder(
      physics: NeverScrollableScrollPhysics(), // <-- this will disable scroll
      shrinkWrap: true,
      itemCount: Provider.of<ProductProvider>(context,listen: false).searchListResponse.data.length,
      itemBuilder: (context,index){
        return
          ProductGridMenuItem(Provider.of<ProductProvider>(context,listen: false).searchListResponse.data[index],index);
      },
    ),
  );

}
getProductsInList(BuildContext context){
return Container(
  // margin: EdgeInsets.only(bottom: 20.h),
  // height: 450.h,
    child: ListView.builder(
      physics: NeverScrollableScrollPhysics(), // <-- this will disable scroll
      shrinkWrap: true,
      itemCount: Provider.of<ProductProvider>(context,listen: false).searchListResponse.data.length,
        itemBuilder: (context,index){
         return
        ProductListMenuItem(Provider.of<ProductProvider>(context,listen: false).searchListResponse.data[index],index);

        },

  ),
);
}

}