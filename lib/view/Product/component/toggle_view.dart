import 'package:bazarli/ViewModel/Product_provider.dart';
import 'package:bazarli/ViewModel/reviews_provider.dart';
import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/models/product_model/product_by_id_response.dart';
import 'package:bazarli/shared_preference/sp_helper.dart';
import 'package:bazarli/view/home/Home/component/star_rating.dart';
import 'package:rating_widget/rating_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'customer_rview_carousel_slider.dart';

class OverViewAndCustomerReviewToggleView extends StatefulWidget{
  GetProductById product;
  OverViewAndCustomerReviewToggleView(this.product);
  @override
  State<StatefulWidget> createState() {
   return OverViewAndCustomerReviewToggleState();
  }

}
class OverViewAndCustomerReviewToggleState extends State<OverViewAndCustomerReviewToggleView >{
  List<bool> isSelected;
  final formkeyDialog = GlobalKey<FormState>();
  TextEditingController commentController = TextEditingController();
  String commentText = '';
  dynamic ratingVal = 1;


  _rateAd(comment, rating) async{
   await Provider.of<ReviewsProvider>(context, listen: false).giveReview(
        widget.product.data.id,
        rating,
        widget.product.data.name,
        comment);
   Provider.of<ProductProvider>(context, listen: false).getProductById(productId: widget.product.data.id);

  }
  @override
  void initState() {
    isSelected = [true, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(children: [
        StarRating(rating: double.parse(widget.product.data.reviews.averageRating.toString()),size: ScreenUtil().radius(25),),
        SizedBox(height: 20.h,),
        buildReviewBtn(context)
      ],)
    // child: Column(
    // children:[
    //   overViewToggleButtonWidget(context),
    //    SizedBox(height: 20.h,),
    //      isSelected[1]?
    //      CustomerReviewWidget()
    //      :
    //      OverviewWidget()
    //     ],

    );
  }

  overViewToggleButtonWidget(BuildContext context){
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 20.w),
      alignment: Alignment.center,
      height: 45.h,
      width: ScreenUtil.defaultSize.width,
      decoration: BoxDecoration(
          color: PrimaryColor,
          borderRadius:
          BorderRadius.circular(ScreenUtil().radius(5))),
      child: ToggleButtons(
        children: [
          togglebtun(0,'OverView'),
          // SizedBox(width:20.w),
          togglebtun(1,'CustomerReview')
        ],
        onPressed: (int index) {
          setState(() {
            for (int i = 0; i < isSelected.length; i++) {
              isSelected[i] = i == index;
            }
          });
        },
        isSelected: isSelected,
      ),

    );
  }

    togglebtun(int index,String text){
      return  isSelected[index] ?
        Container(
        margin:context.locale.toString()=='en'? EdgeInsets.only(left: 2):EdgeInsets.only(right: 2),
        height: 40.h,
        width: 0.4.sw,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color:HomeBackgroundColor,
            borderRadius:
            BorderRadius.circular(ScreenUtil().radius(5))),
        child: Text(
         text, style: TabsTextStyle,).tr(),
      ):
      Container(
        width: 0.4.sw,
        alignment: Alignment.center,
        child: Text(text,style: WhiteButtonStyle,).tr(),
      );
    }

  buildReviewBtn(BuildContext context){
   return Container(
     alignment: context.locale.toString()=='en'?Alignment.centerLeft:Alignment.centerRight,
      child: InkWell(
          onTap: () {
            // NavigationService.navigationService
            //     .navigateToWidget(HomeMainScreen());
          },
          child: InkWell(
    onTap:(){
      if (SPHelper.spHelper.isLoged())
        rateDialog(context);
    },
    child:Container(
            // margin: EdgeInsets.symmetric(horizontal: 20.w),
            alignment: Alignment.center,
            height: 50.h,
            width: 157.w,
            decoration: BoxDecoration(
                color: PrimaryColor,
                borderRadius:
                BorderRadius.circular(ScreenUtil().radius(5))),
            child: Text(
              'WriteAReview',
              style: SliderNextStyle,
            ).tr(),
          ),),
      ),
    );
  }


  CustomerReviewWidget(){
    return Column(
      children: [
        Container(
          // height: 240.h,
            child: BuildCustomerReviewCarouselSlider(currentIndex: 0,)
        ),
        SizedBox(height: 20.h,),
        buildReviewBtn(context),
      ],
    );
  }
  OverviewWidget(){
    return Container(
      alignment: context.locale.toString()=='en'?Alignment.centerLeft:Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Details',style: ProductTitleStyle,).tr(),
          // detailsRowWidget('ItemId','#'+widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].productNumber),
          if(widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].type!=null)
            detailsRowWidget('Type',widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].type),
          // if(widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].style!=null)
          // detailsRowWidget('Style',widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].style),
          // if(widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].materiel!=null)
          // detailsRowWidget('Material',widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].materiel),
          // if(widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].model!=null)
          //   detailsRowWidget('Modle',widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].model),
          // if(widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].bikeType!=null)
          //   detailsRowWidget('BikeType',widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].bikeType),
          // if(widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].heelType!=null)
          // detailsRowWidget('HeelType',widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].heelType),
          // if(widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].heelLength!=null)
          // detailsRowWidget('HeelTLength',widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].heelLength),
          // if(widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].armType!=null)
          // detailsRowWidget('ArmType',widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].armType),
          // if(widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].armLenght!=null)
          // detailsRowWidget('ArmLength',widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].armLenght),
          // if(widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].legLength!=null)
          // detailsRowWidget('LegLength',widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].legLength),
          // if(widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].body!=null)
          // detailsRowWidget('Body',widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].body),
          // if(widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].boy!=null)
          //   detailsRowWidget('Boy',widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].boy),
          // if(widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].pattern!=null)
          //   detailsRowWidget('Pattern',widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].pattern),
          // if(widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].colour!=null)
          //   detailsRowWidget('Color',widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].colour),
          //  if(widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].volume!=null)
          //   detailsRowWidget('Volume',widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].volume),
          //  if(widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].appearance!=null)
          //   detailsRowWidget('Appearance',widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].appearance),
          //  if(widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].nice!=null)
          //   detailsRowWidget('Nice',widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].nice),
          // // if(widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].weight!=null)
          // //   detailsRowWidget('Weight',widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].weight),
          // if(widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].warrantyPeriod!=null)
          //   detailsRowWidget('WarrantyPeriod',widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].warrantyPeriod),
          // if(widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].collection!=null)
          //   detailsRowWidget('Collection',widget.product.data.variants[Provider.of<ProductProvider>(context,).selectedVarientIndex].collection),



        ],
      ),
    );
  }

  detailsRowWidget(text1,text2){
    return  Column(
      children: [
        SizedBox(height: 10.h,),

        Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                width:0.4.sw,
                child: Text(text1,style: TextLabelStyle,).tr()),
            // SizedBox(width:65.w ,),
            Container(
                width:0.4.sw,
                child: Text(text2,style:DescriptionStyle ,))
          ],
        ),
      ],
    );
  }


  void rateDialog(BuildContext context) {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Container(
          child: Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              padding: EdgeInsets.all(ScreenUtil().radius(25)),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: WhiteColor,
                  borderRadius: BorderRadius.circular(ScreenUtil().radius(25)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(0, 10),
                        blurRadius: 10),
                  ]),
              child: Material(
                color: WhiteColor,
                child: Form(
                  key: formkeyDialog,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Center(
                        child: Text(
                          'Rate product',
                          style: ProductTitleStyle,
                        ).tr(),
                      ),

                      SizedBox(
                        height: 5,
                      ),

                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[200]))),
                        child: TextFormField(
                          controller: commentController,
                          onChanged: (value) {
                            commentText = value;
                          },
                          validator: (value) => value.isEmpty
                              ? 'comment required'
                              : null,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.chat),
                              hintText: "AddYourComment".tr(),
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Rating(
                        rating: 5,
                        onRatingSelected: (value) {
                          setState(() {
                            ratingVal = value;
                          });
                        },
                        // horizontal: false,
                        selectedColor: Colors.amber,
                        unSelectedColor: PrimaryColor,
                        selectedIcon: Icons.star,
                        unSelectedIcon: Icons.star_border,
                      ),

                      SizedBox(
                        height: 10.h,
                      ),
                      InkWell(
                        onTap: () {
                          if (formkeyDialog.currentState.validate()) {
                            _rateAd(commentController.text, ratingVal);
                            commentController.clear();

                            Navigator.of(context).pop();
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 80.w),
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          height: 60.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1.w),
                            color: PrimaryColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 22,
                                offset: Offset(0, 22),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'Submit',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: WhiteColor,
                                fontSize: 18.sp,
                                fontFamily: 'Nisebuschgardens',
                              ),
                            ).tr(),
                          ),
                        ),
                      ),

                      // FlatButton(onPressed: (){
                      //
                      // }, child: Text('Submit').tr()),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }
}