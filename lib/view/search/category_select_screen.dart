import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/models/Categories_model/category_response.dart';
import 'package:bazarli/ViewModel/Product_provider.dart';
import 'package:bazarli/ViewModel/home_provider.dart';
import 'package:bazarli/view/home/tool_bar_widget.dart';
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
                      Selector<HomeProvider, CategoryResponse>(
                          builder: (context, response, widget) {
                        if (response == null) {
                          return CircularProgressIndicator();
                        } else {
                          return Container(
                            child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: response.data.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  Datum category = response.data[index];
                                  return buildRadio(
                                      context, category);
                                  // return _myRadioButton(context,title: category.adminName, value:category.id );
                                }),
                          );
                        }
                      }, selector: (context, provider) {
                        return provider.categoriesResponse;
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

  Widget buildRadio(BuildContext context, Datum category) {
    // return Selector<ProductProvider, int>(
    //     selector: (_, provider) => provider.categoryId,
    //     // shouldRebuild: (previous, next) => previous == next,
    //     builder: (context, number, child) {
          return Row(
            children: [
              SizedBox(
                width: 12,
              ),
              Radio(
                  value:category,
                  groupValue: Provider.of<ProductProvider>(context,).selectedCategory,
                  activeColor: PrimaryColor,
                  onChanged: (val) {
                    // Provider.of<ProductProvider>(context,listen: false).categoryId= val;
                    Provider.of<ProductProvider>(context, listen: false)
                        .selectCategory(val);
                    print('catid$val');
                  }
                  // myDialog();

                  ),
              SizedBox(
                width: 12,
              ),
              Text(category.name),
            ],
          );
        // });
  }
}
