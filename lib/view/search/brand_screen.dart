import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/models/brand_model/brand_model.dart';
import 'package:bazarli/ViewModel/Product_provider.dart';
import 'package:bazarli/ViewModel/home_provider.dart';
import 'package:bazarli/view/home/tool_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'component/apply_btn_widget.dart';

class BrandScreen extends StatelessWidget {
  int _groupValue = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(children: [
      ToolBar(
          name: 'Brand',
      ),
      Stack(
          children: [
            Container(
              height: ScreenUtil.defaultSize.height,
                padding: EdgeInsets.only(bottom: 60.h),
                margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 117),
                child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      SizedBox(
                        height: 25.h,
                      ),
                     Container(
                       child: ListView.builder(
                         physics: NeverScrollableScrollPhysics(),
                         itemCount:  Provider.of<HomeProvider>(context, )
                               .brandList.length,
                           shrinkWrap: true,
                           itemBuilder:(context,index){
                           Brand brand=Provider.of<HomeProvider>(context, listen: false)
                               .brandList[index];
                           return  buildRadio(context,brand.id,brand.adminName);
                          // return _myRadioButton(context,title: brand.adminName, value:brand.id );
                       }),
                     ),

                     // _myRadioButton(title: Provider.of<HomeProvider>(context, listen: false)
                     //              .brandList[0].adminName, value: 0,),
                     // _myRadioButton(title: 'FOSSIL', value: 1,),
                     // _myRadioButton(title: 'FOSSIL', value: 2,),
                     // _myRadioButton(title: 'FOSSIL', value: 3,),
                     // _myRadioButton(title: 'FOSSIL', value: 4,),
                     // _myRadioButton(title: 'FOSSIL', value: 5,),
                     // _myRadioButton(title: 'FOSSIL', value: 6,),
                     // _myRadioButton(title: 'FOSSIL', value: 7,),
                     // _myRadioButton(title: 'FOSSIL', value: 8,),
                     // _myRadioButton(title: 'FOSSIL', value: 9,),

                    ]),
                ),
            ),
            ApplyButtonWidget(onPressed: (){
              Navigator.of(context).pop();
            },),
          ],
      ),
    ]),
        ));
  }
  // Widget _myRadioButton(BuildContext context,{String title, int value}) {
  //   return RadioListTile(
  //     value: value,
  //     groupValue: _groupValue,
  //     onChanged: (val){
  //       Provider
  //           .of<ProductProvider>(context, listen: false)
  //           .brand = val.toString();
  //       print('brandId=$val');
  //     },
  //     selectedTileColor: PrimaryColor,
  //     activeColor:PrimaryColor ,
  //     title: Text(
  //       title,
  //       style: DescriptionStyle,
  //     ),
  //
  //   );
  // }
 Widget buildRadio(BuildContext context,int id,String title) {
  return  Selector<ProductProvider, int>(
        selector: (_, provider) => provider.brandId,
      // shouldRebuild: (previous, next) => previous == next,
      builder: (context, number, child) {
          return Row(
            children: [
              SizedBox(
                width: 12,
              ),
              Radio(
                value: id,
                groupValue:number,
                activeColor:PrimaryColor,
                onChanged:(val) {
                  number=val;
                  Provider .of<ProductProvider>(context, listen: false).selectBrand(val,title);
                 print('Build num2$val');

                }
                // myDialog();

              ),
              SizedBox(
                width: 12,
              ),
              Text(title),
            ],
          );

        }
        );

 // return Selector<ProductProvider, String>(
 //                  builder: (context, response, widget) {
 //                // if (response == null) {
 //           return Row(
 //             children: [
 //               SizedBox(
 //                 width: 12,
 //               ),
 //               Radio(
 //                 value: response,
 //                 groupValue:Provider.of<ProductProvider>(context,listen: false).brand,
 //                 activeColor:PrimaryColor,
 //                 onChanged:
 //                   Provider.of<ProductProvider>(context, listen: false).selectBrand,
 //                   // myDialog();
 //
 //               ),
 //               SizedBox(
 //                 width: 12,
 //               ),
 //               Text(title),
 //             ],
 //           );
 //                      }, selector: (context, provider) {
 //                        return provider.selectBrand(No);
 //                      });
    // return Row(
    //   children: [
    //     SizedBox(
    //       width: 12,
    //     ),
    //     Radio(
    //       value: No,
    //       groupValue:Provider
    //           .of<ProductProvider>(context,listen: false)
    //           .brand,
    //       activeColor:PrimaryColor,
    //       onChanged:
    //         Provider
    //             .of<ProductProvider>(context, listen: false)
    //             .selectBrand,
    //         // myDialog();
    //
    //     ),
    //     SizedBox(
    //       width: 12,
    //     ),
    //     Text(title),
    //   ],
    // );
  }
}
