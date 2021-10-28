import 'package:bazarli/ViewModel/Product_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:bazarli/api_helper/product_api.dart';
import 'package:bazarli/models/product_model/product_response.dart';
import 'package:bazarli/view/home/Home/component/home_toolbar.dart';
import 'package:bazarli/view/home/categories/component/product_listmenu_Item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class AllProductsScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AllProductsState();
  }

}

class AllProductsState extends State<AllProductsScreen> {

  final PagingController<int, Datum> pagingController = PagingController(firstPageKey:0,);

  @override
  void initState() {
   pagingController.addPageRequestListener((pageKey) {

      Provider.of<ProductProvider>(context,listen: false).getSearchProducts(pageKey: pageKey,pagingController: pagingController);
    });
    super.initState();
  }

  @override
  void dispose() {
   pagingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // var loginprovider = Provider.of<ProductProvider>(context);
    // var loading = Provider.of<ProductProvider>(context).isLoading;
    return Scaffold(
      body: Stack(
        children: [
          HomeToolBar(
            isHome: false,
          ),
          Container(
            margin: EdgeInsets.only(top:  117.h,),
            child:  PagedListView<int,Datum>(
                pagingController:pagingController,
                builderDelegate: PagedChildBuilderDelegate<Datum>(
                  itemBuilder: (context, item, index) {
                   return ProductListMenuItem(item, index );
                  }
                ),
              ),
            // child: ListView.builder(
            //   physics: NeverScrollableScrollPhysics(), // <-- this will disable scroll
            //   shrinkWrap: true,
            //   itemCount: Provider.of<ProductProvider>(context,listen: false).searchListResponse.data.length,
            //   itemBuilder: (context,index){
            //     return
            //       ProductListMenuItem(Provider.of<ProductProvider>(context,listen: false).searchListResponse.data[index],index);
            //
            //   },
            //
            // ),
          ),
        ],
      ),
    );
  }

}