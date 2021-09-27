import 'package:bazarli/ViewModel/Product_provider.dart';
import 'package:bazarli/models/product_model/product_response.dart' as productResponse;
import 'package:bazarli/view/home/Home/component/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'component/build_product_item_placeholder.dart';

class GetTopProducts extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   return Selector<ProductProvider,productResponse.ProductResponse>(
        builder: (context, response, widget) {
          if (response == null) {
            return buildProductItemPlaceholder();

          } else if (response.data.length == 0) {
            return Container(height: 0,);
          } else {
            return Container(
              //   width: ScreenUtil.defaultSize.width,
                child: BuildCarouselSlider(
                  product: response.data,
                  currentIndex: 0,
                ));
          }
        }, selector: (context, provider) {
      return provider.productRespone;
    });
  }

}

