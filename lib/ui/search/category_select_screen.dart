import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/models/Categories_model/category_response.dart';
import 'package:bazarli/models/brand_model/brand_model.dart';
import 'package:bazarli/providers/Product_provider.dart';
import 'package:bazarli/providers/home_provider.dart';
import 'package:bazarli/ui/home/tool_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'component/apply_btn_widget.dart';

class CategorySelectScreen extends StatelessWidget {
  int _groupValue = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(children: [
            ToolBar(
              name: 'Categories',
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
                                    .categoriesList.length,
                                shrinkWrap: true,
                                itemBuilder:(context,index){
                                  Category category=Provider.of<HomeProvider>(context, listen: false)
                                      .categoriesList[index];
                                  return  buildRadio(context,category.id,category.title);
                                  // return _myRadioButton(context,title: category.adminName, value:category.id );
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

  Widget buildRadio(BuildContext context,int id,String title) {
    return  Selector<ProductProvider, int>(
        selector: (_, provider) => provider.categoryId,
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
                    Provider .of<ProductProvider>(context, listen: false).selectCategory(val,title);
                    print('catid$val');

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


  }
}
