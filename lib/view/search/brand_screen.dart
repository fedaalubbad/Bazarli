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
  // int _groupValue = -1;

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
                      Selector<HomeProvider, BrandResponse>(
                          builder: (context, response, widget) {
                        if (response == null) {
                          return CircularProgressIndicator();
                        } else {
                         return Container(
                            child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: response.brands.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  Brand brand = response.brands[index];
                                  return buildRadio(context, brand);
                                }),
                          );
                        }
                      }, selector: (context, provider) {
                        return provider.brandResponse;
                      }),
                    ]),
              ),
            ),
            ApplyButtonWidget(
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
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
  Widget buildRadio(BuildContext context,Brand brand) {
    // return Selector<ProductProvider, int>(
    //     selector: (_, provider) => provider.brandId,
        // shouldRebuild: (previous, next) => previous == next,
        // builder: (context, number, child) {
          return Row(
            children: [
              SizedBox(
                width: 12,
              ),
              Radio(
                  value:brand,
                  groupValue: Provider.of<ProductProvider>(context,).selectedBrand,
                  activeColor: PrimaryColor,
                  onChanged: (val) {
                    Provider.of<ProductProvider>(context, listen: false).selectBrand(val);
                  }
                  // myDialog();

                  ),
              SizedBox(
                width: 12,
              ),
              Text(brand.adminName),
            ],
          );
        // });

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
