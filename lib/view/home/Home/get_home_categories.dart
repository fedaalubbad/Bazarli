import 'package:bazarli/ViewModel/home_provider.dart';
import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/models/Categories_model/category_response.dart';
import 'package:bazarli/view/home/utils/indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_placeholder_textlines/placeholder_lines.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class GetHomeCategories extends StatefulWidget {
  @override
  GetHomeCategoriesState createState() {
    return GetHomeCategoriesState();
  }
}class GetHomeCategoriesState extends State<GetHomeCategories> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Selector<HomeProvider, CategoryResponse>(
        builder: (context, response, widget) {
          if (response == null) {
            return Container(
              height: 50.h,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      width: 50,
                      child: Center(
                        child: PlaceholderLines(
                          count: 1,
                          animate: true,
                          color: PrimaryColor.withOpacity(0.3),
                        ),
                      ),
                      // text: 'Tab ${tabIndex}',
                    );
                  }),
            );
          } else if (response.data.length == 0) {
            return Container(height: 0,);
          } else {
            Provider
                .of<HomeProvider>(
              context,
              listen: false,
            )
                .tabController = new TabController(
              length: response.data.length,
              vsync: this,
              initialIndex: Provider.of<HomeProvider>(
                context,
                listen: false,
              ).getInitialIndex(context),
            )
              ..addListener(() {
                // print("New Index ${Provider.of<HomeProvider>(
                //   context,
                //   listen: false,
                // ).tabController.index}");
                PageStorage.of(context).writeState(
                  context,
                  Provider
                      .of<HomeProvider>(
                    context,
                    listen: false,
                  )
                      .tabController
                      .index,
                );
              });
            return TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicator: MD2Indicator(
                indicatorSize: MD2IndicatorSize.full,
                indicatorHeight: 4.h,
                indicatorColor: PrimaryColor,
              ),
              indicatorColor: PrimaryColor,
              key: PageStorageKey<Type>(TabBar),
              controller: Provider
                  .of<HomeProvider>(
                context,
                listen: false,
              )
                  .tabController,
              isScrollable: true,
              tabs: List<Tab>.generate(
                  response.data.length, (int tabIndex) {
                return Tab(
                  child: InkWell(
                    // onTap: () {
                    //   // NavigationService.navigationService.navigateToWidget(
                    //   //   CategorySearchScreen(
                    //   //     category: snapshot.data[tabIndex],
                    //     ),
                    //   );
                    // },
                    child: Center(
                      child: Shimmer.fromColors(
                        baseColor: BlueDarkColor,
                        highlightColor: PrimaryColor.withOpacity(0.3),
                        child: Text(
                          response.data[tabIndex].name,
                          style: TabsTextStyle,
                        ),
                      ),
                    ),
                  ),
                  // text: 'Tab ${tabIndex}',
                );
              }),
            );
          }
        }, selector: (context, provider) {
      return provider.categoriesResponse;
    });
  }

}
