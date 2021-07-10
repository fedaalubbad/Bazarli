import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/providers/BrandProvider.dart';
import 'package:bazarli/providers/CategoriesProvider.dart';
import 'package:bazarli/ui/home/Home/component/brand_item.dart';
import 'package:bazarli/ui/home/Home/component/home_title_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'component/category_item.dart';
import 'component/product_shop_item.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CategoriesScreenState();
  }
}

class CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        // mainAxisSize: MainAxisSize.max,
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          Card(
            semanticContainer: false,
            shape: BeveledRectangleBorder(
              // borderRadius: BorderRadius.circular(ScreenUtil().radius(10)),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(ScreenUtil().radius(10)),
                  topRight:Radius.circular(ScreenUtil().radius(10)) ,
                  bottomLeft:Radius.circular(ScreenUtil().radius(10) )),
            ),
            shadowColor: ShadowColor,
            elevation:ScreenUtil().radius(45),
            color: Colors.white,
            child: Container(
              color: WhiteColor,
              height: 0.65.sh,
              width: 0.47.sw,
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Center(child: Text('list$index')),
                    );
                  }),
            ),
          ),
             Expanded(
               child: Column(
                 children: [
                   SizedBox(height:10.h,),
                   BuildHomeTitle(titleText:'T-shirt'),
                   SizedBox(height:10.h,),
                   ProductShopItem(),
                   SizedBox(height:20.h,),
                   BuildHomeTitle(titleText:'brands you loves'),
                   // SizedBox(height: 2.h,),
                   getBrands(),
                   SizedBox(height: 10.h,),
                   BuildHomeTitle(titleText:'top picked'),
                   // SizedBox(height: 2.h,),
                   getSubCategories(context),
                   // SizedBox(height: 2.h,),
                   BuildHomeTitle(titleText:'skin care'),
                   SizedBox(height: 2.h,),
                   getSubCategories(context),

                 ],
               ),
             )
        ],
      ),
    );
  }

  getSubCategories(BuildContext context) {
    return Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
           child:GridView.builder(
                itemCount: Provider.of<CategoriesProvider>(context, listen: false).categoriesList.length,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing:10.h,
                  crossAxisSpacing: 10.w,
                  childAspectRatio: 0.5.h,
                ),
                itemBuilder: (context, index) =>
                 CategoryItem(category: Provider
                  .of<CategoriesProvider>(context, listen: false)
                  .categoriesList[index],
    )),
           

      
    );

  }

  getBrands(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
      child:GridView.builder(
          itemCount: 6,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing:10.h,
            crossAxisSpacing: 10.w,
            childAspectRatio: 1.h,
          ),
          itemBuilder: (context, index) =>
              BrandItem(icon:Provider.of<BrandProvider>(context, listen: false).brandList[index].smallBrandLogo , )),



    );


  }
}
