import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/providers/Product_provider.dart';
import 'package:bazarli/ui/home/Home/component/carousel_slider.dart';
import 'package:bazarli/ui/home/Home/component/home_toolbar.dart';
import 'package:bazarli/ui/home/categories/component/product_listmenu_Item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'component/circle_categort_top_item.dart';

class SubCategoriesScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SubCategoriesScreenState();
  }

}
class SubCategoriesScreenState extends State<SubCategoriesScreen>{
  bool isMenue=false;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       width: double.infinity,
       height: double.infinity,
       child: SingleChildScrollView(
           child: Expanded(
             child: Column(
               children: [
                 HomeToolBar(isHome: false,),
                 SizedBox(height: 1.h,),
                 filterBar(),
                 SizedBox(height: 1.h,),
                 getTopBarCircles(),
                 SizedBox(height: 10.h,),
                 SizedBox(height: 10.h,),
                 !isMenue?
                  getProductsInList(context): getProductsGrid(context),

       ],
             ),
           ),

       ),

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
  return Column(
    children: [
      Container(
        // height:400.h,
        //   width: ScreenUtil.defaultSize.width,
          child:  BuildCarouselSlider(
            product:Provider.of<ProductProvider>(context,listen: false).productList
            ,currentIndex: 0,)


      ),
      Container(
        // height:400.h,
        //   width: ScreenUtil.defaultSize.width,
          child:  BuildCarouselSlider(
            product:Provider.of<ProductProvider>(context,listen: false).productList
            ,currentIndex: 0,)


      ),
      Container(
        // height:400.h,
        //   width: ScreenUtil.defaultSize.width,
          child:  BuildCarouselSlider(
            product:Provider.of<ProductProvider>(context,listen: false).productList
            ,currentIndex: 0,)


      ),
    ],
  );
}
getProductsInList(BuildContext context){
return Container(
  height: 500,
    child: ListView.builder(
      itemCount: Provider.of<ProductProvider>(context,listen: false).productList.length,
        itemBuilder: (context,index){
         return
        ProductListMenuItem(product:Provider.of<ProductProvider>(context,listen: false).productList[index],);
          
        },

  ),
);
}

}