import 'package:bazarli/models/product_model/product_classes/Data.dart';
import 'package:bazarli/navigation_service/navigation_service.dart';
import 'package:bazarli/ui/Product/product_details_screen.dart';
import 'package:bazarli/ui/home/Home/component/cordinator_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'overView_list_item.dart';

class BuildOverViewCarouselSlider extends StatelessWidget{
  int currentIndex;
  List<Data> product;
  BuildOverViewCarouselSlider({this.product, this.currentIndex});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        NavigationService.navigationService.navigateToWidget(ProductDetailsScreen(product: product[currentIndex],));
      },
      child: CarouselSlider.builder(
        itemCount:3,
        itemBuilder: (_, index, realIdx) {
          return Column(
            children: [
              OverViewListItem(),
              Container(
                height: 20,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children:[
                      BuildCordinator(currentIndex,0),
                      BuildCordinator(currentIndex,1),
                      BuildCordinator(currentIndex,2),

                      ],
                      // product.map((e) => BuildCordinator(
                      //     currentIndex, product.indexOf(e)))
                      //     .toList()),
                ),
                )
              ),
            ],
          );
        },
        options: CarouselOptions(
            height:320.h,
            initialPage: 0,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 3000),
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlay: false,
            // aspectRatio: 16/9,
            viewportFraction: 1,
            scrollPhysics: AlwaysScrollableScrollPhysics(),
            // enableInfiniteScroll: true,
            scrollDirection: Axis.horizontal,
            enlargeCenterPage: false,
            onPageChanged: (index, _) {
              // setState(() {
              currentIndex = index;
              // });
            }),
      ),
    );
  }

}