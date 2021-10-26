import 'package:bazarli/ViewModel/get_attribute_filter_provider.dart';
import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/navigation_service/navigation_service.dart';
import 'package:bazarli/ViewModel/Product_provider.dart';
import 'package:bazarli/view/Authentication/widgets/textFormField_widget.dart';
import 'package:bazarli/view/home/Home/component/home_toolbar.dart';
import 'package:bazarli/view/home/categories/sub_caategories_Screen.dart';
import 'package:bazarli/view/search/sizes_search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'brand_screen.dart';
import 'category_select_screen.dart';
import 'color_seach_screen.dart';
import 'new_arrivals_screen.dart';
class CategorySearchScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return CategorySearchScreenState();
  }

}
class CategorySearchScreenState extends State<CategorySearchScreen> {

  @override
  void initState() {
    Provider.of<AttributeFilterProvider>(context, listen: false).getAttributeFliter(context,'size');
    Provider.of<AttributeFilterProvider>(context, listen: false).getAttributeFliter(context,'color');

    super.initState();
  }
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
                    categoryWidget(context,'Category',Provider.of<ProductProvider>(context).selectedCategory==null?'':Provider.of<ProductProvider>(context).selectedCategory.name,0,),
                    Divider(),
                    categoryWidget(context,'Brand',Provider.of<ProductProvider>(context).selectedBrand==null?"":Provider.of<ProductProvider>(context).selectedBrand.adminName,1),
                    Divider(),
                    // categoryWidget(context,'Price','',2),
                    selectPriceExpandedListWidget(context,'Price','',2),
                    Divider(),
                    // categoryWidget(context,'ProductRating','',3),
                    selectRateExpandedListWidget(context,'ProductRating','',3),
                    Divider(),
                    categoryWidget(context,'Size',Provider.of<ProductProvider>(context).selectedSizeResponse==null?"":Provider.of<ProductProvider>(context).selectedSizeResponse.attribute,4,),
                    Divider(),
                    categoryWidget(context,'NewArrivals',Provider.of<ProductProvider>(context).selectedArrivals==null?"":Provider.of<ProductProvider>(context).selectedArrivals.arriveIn,5),
                    Divider(),
                    categoryWidget(context,'Department','',6),
                    Divider(),
                    categoryWidget(context,'Color',Provider.of<ProductProvider>(context).selectedColorResponse==null?"":Provider.of<ProductProvider>(context).selectedColorResponse.attribute,7,),
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
          // :index==2?
          // NavigationService.navigationService.navigateToWidget(PriceSearchScreen())
          // :index==3?
          // NavigationService.navigationService.navigateToWidget(ProductRatingSearchScreen())
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
        margin: EdgeInsets.only(left: 15.w,right: 15.w),
        height: 60.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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

selectPriceExpandedListWidget(BuildContext context,String title,String subTitle,int index){
   return Form(
     key: Provider.of<ProductProvider>(context,listen: false).priceFormStateKey,
     child: Container(
          // width: ScreenUtil.defaultSize.width,
          // height: 60.h,
          // child: Padding(
            // padding: const EdgeInsets.all(8.0),
            child:Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                textColor:PrimaryColor,
                iconColor:PrimaryColor,
                maintainState: true,
                title: Text(
                  "Price",
                  style: TextLabelStyle,
                ).tr(),
                trailing:  context.locale.toString()=='ar'?
                SvgPicture.asset('assets/svg/arrow_left.svg',width: 12.w,height: 12.h,)
                    :SvgPicture.asset('assets/svg/arrow_right.svg',width: 12.w,height: 12.h,),
                children: [
                  buildFromToWidget(context),

                ],
              ),
            ),
          ),
      // ),
   );
  }


  selectRateExpandedListWidget(BuildContext context,String title,String subTitle,int index){
   return Container(
          // width: ScreenUtil.defaultSize.width,
          // height: 60.h,
          // child: Padding(
            // padding: const EdgeInsets.all(8.0),
            child:Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                textColor:PrimaryColor,
                iconColor:PrimaryColor,
                maintainState: true,
                title: Text(
                  "ProductRating",
                  style: TextLabelStyle,
                ).tr(),
                trailing:  context.locale.toString()=='ar'?
                SvgPicture.asset('assets/svg/arrow_left.svg',width: 12.w,height: 12.h,)
                    :SvgPicture.asset('assets/svg/arrow_right.svg',width: 12.w,height: 12.h,),

                children: [
                  buildRateSlider(context)
                ],
              ),
            ),
   );
  }


  buildRateSlider(BuildContext context){
   return Container(
      // height: ScreenUtil.defaultSize.height,
      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 20,bottom: 20),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[
          // SizedBox(
          //   height: 25.h,
          // ),
          Text('1.0 Stars or More',style:DescriptionStyle ,).tr(),
          Selector<ProductProvider, double>(
              selector: (_, provider) => provider.rate,
              // shouldRebuild: (previous, next) => previous == next,
              builder: (context, number, child) {
                return Slider(
                    inactiveColor: GrayColor, activeColor: PrimaryColor,
                    value:number,
                    onChanged: Provider
                        .of<ProductProvider>(context,listen: false)
                        .getSlider,
                    min: 1.0,
                    max: 5.0,
                  divisions: 4,

                    );
              }
              ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('1.0 Stars',style:SliderTitle2Style ,).tr(),
              Text(Provider
                  .of<ProductProvider>(context)
                  .rate.toString().substring(0,3),style:SliderTitle2Style ,).tr(),

            ],)
        ]),
      ),
    );
  }
  buildFromToWidget(BuildContext context){
    return Container(
      height: 100.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 50.h,
            width: 70.w,
            decoration: BoxDecoration(
              color:TextFormFieldColor ,
              borderRadius:  BorderRadius.circular(ScreenUtil().radius(5)),
            ),
            child: CustomTextfieldWidget(
              contraller:Provider.of<ProductProvider>(context, listen: false).minPriceController ,
              isObscure: false,
              isPassword: false,
              linesNo: 1,
              hint: '00',
              textInputType:TextInputType.text,
              save:Provider.of<ProductProvider>(context, listen: false).saveinitialPrice,
              // validator:Provider.of<AuthenticationProvider>(context, listen: false).validateEmail,
            ),
          ),
          Text('To',style: TextLabelStyle,),

          Container(
            height: 50.h,
            width: 70.w,
            decoration: BoxDecoration(
              color:TextFormFieldColor ,
              borderRadius:  BorderRadius.circular(ScreenUtil().radius(5)),
            ),
            child: CustomTextfieldWidget(
              contraller:Provider.of<ProductProvider>(context, listen: false).maxPriceController ,
              isObscure: false,
              isPassword: false,
              linesNo: 1,
              hint: '00',
              textInputType:TextInputType.text,
              save:Provider.of<ProductProvider>(context, listen: false).saveEndPrice,
              // validator:Provider.of<AuthenticationProvider>(context, listen: false).validateEmail,
            ),
          ),
          InkWell(
              onTap: () {
              },
              child: Container(
                // margin: EdgeInsets.symmetric(horizontal: 20.w),
                alignment: Alignment.center,
                height: 50.h,
                width: 70.w,
                decoration: BoxDecoration(
                  color: PrimaryColor,
                  borderRadius:
                  BorderRadius.circular(ScreenUtil().radius(5)),
                ),
                child: Text(
                  'Go',
                  style:WhiteButtonStyle,
                ).tr(),
              )),
        ],
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
            Provider.of<ProductProvider>(context, listen: false).resetFilter();
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
    return !Provider.of<ProductProvider>(context).isSearchLoading
        ?
    Container(
      child: InkWell(
          onTap: () async{
           await Provider.of<ProductProvider>(context, listen: false).getSearchProducts();
           NavigationService.navigationService.navigateToWidget(SubCategoriesScreen());

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
    ):CircularProgressIndicator(color: PrimaryColor,);
  }

}
