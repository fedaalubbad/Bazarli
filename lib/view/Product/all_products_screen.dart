import 'package:easy_localization/easy_localization.dart';
import 'package:bazarli/api_helper/product_api.dart';
import 'package:bazarli/models/product_model/product_response.dart';
import 'package:bazarli/view/home/Home/component/home_toolbar.dart';
import 'package:bazarli/view/home/categories/component/product_listmenu_Item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AllProductsScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AllProductsState();
  }

}

class AllProductsState extends State<AllProductsScreen> {
  static const _pageSize = 5;

  final PagingController<int, Datum> _pagingController =
  PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }
  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await ProductApi.api.getAllProducts(page:pageKey,perPAge:_pageSize);
      final isLastPage = newItems.data.length < _pageSize;

      if (isLastPage) {
        _pagingController.appendLastPage(newItems.data);
      } else {
        final nextPageKey = pageKey + newItems.data.length;
        _pagingController.appendPage(newItems.data, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }
  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HomeToolBar(
            isHome: false,
          ),
          Container(
            margin: EdgeInsets.only(top:  100.h,),
            child:  PagedListView<int,Datum>(
                pagingController: _pagingController,
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