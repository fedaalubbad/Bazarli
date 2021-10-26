import 'package:bazarli/models/Categories_model/category_response.dart' as categoryResponse;
import 'package:bazarli/models/arrivals_response/arrivals_response.dart';
import 'package:bazarli/models/brand_model/brand_model.dart';
import 'package:bazarli/models/product_model/product_by_id_response.dart';
import 'package:bazarli/models/product_model/product_response.dart';
import 'package:bazarli/view/search/sizes_search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../api_helper/product_api.dart';

class ProductProvider extends ChangeNotifier {
  // int categoryId;
  // String categoryName;
  categoryResponse.Datum selectedCategory;
  Brand selectedBrand;
  ArrivalsResponse selectedArrivals;


  String search;
  String order;
  String sort;
  double rate = 1.0;
  List<int> price;
  int newArrivals;
  int selectedVarientIndex = 0;
  dynamic selectedVarientId;

  final GlobalKey<FormState> priceFormStateKey = GlobalKey<FormState>();
  final minPriceController = TextEditingController();
  final maxPriceController = TextEditingController();
  ProductResponse productRespone;
  List<Datum> productList = [];
  List<Datum> productSearchResultList = [];
  GetProductById productById;

  saveinitialPrice(val) {
    price[0] = val;
    notifyListeners();
  }

  saveEndPrice(val) {
    price[1] = val;
    notifyListeners();
  }

  selectVarientIndex(val) {
    selectedVarientIndex = val;
    notifyListeners();
  }

  setQunty(val) {
    availableQuantity = val;
    notifyListeners();
  }

  selectVarientId(val) {
    selectedVarientId = val;
    notifyListeners();
  }

  int quantity = 1;
  int availableQuantity = 1;

  increaseQuantity() {
    if ((quantity) < (availableQuantity)) quantity += 1;
    notifyListeners();
  }

  decreaseQuantity() {
    if (quantity > 1) quantity -= 1;
    notifyListeners();
  }

  String getBrand(product, index) {
    return product.superAttributes[2].options
        .where((element) => element.id == product.variants[index].brand)
        .map((e) {
      return 'https://test.bazarli.com/cache/small/'+e.swatchValue;
        })
        .toString()
        .replaceAll("(", '')
        .replaceAll(')', '');
  }

  String getSize(product, index) {
    return product.superAttributes[1].options
        .where((element) => element.id == product.variants[index].size)
        .map((e) {
          return e.adminName;
        })
        .toString()
        .replaceAll("(", '')
        .replaceAll(')', '');
  }

  String getColors(product, index) {
    return product.superAttributes[0].options
        .where((element) => element.id == product.variants[index].color)
        .map((e) {
          // color=e.swatchValue.toString().replaceAll("(",'').replaceAll(')', '');
          // print('ncolor'+color);

          return e.swatchValue;
        })
        .toString()
        .replaceAll("(", '')
        .replaceAll(')', '');
  }

  RadioModel selectedSizeResponse;

  selectSize(model){
    model.isSelected=!model.isSelected;
    selectedSizeResponse=model;
    notifyListeners();
  }


  RadioModel selectedColorResponse;
  void selectcolor(RadioModel model){
    model.isSelected=!model.isSelected;
    selectedColorResponse =model;
    notifyListeners();
  }

   resetFilter(){
    selectedColorResponse=null;
    selectedSizeResponse=null;
    rate=1;
    selectedArrivals=null;
    selectedBrand=null;
    selectedCategory=null;
    notifyListeners();
   }
  double getSlider(double value) {
    this.rate = value;
    notifyListeners();
    return value;
  }

 selectBrand(brand) {
    selectedBrand=brand;
    notifyListeners();

  }

  selectCategory(value) {
    selectedCategory=value;
    notifyListeners();
    print('catId=$value');
  }
  selectArrivals(value) {
    selectedArrivals=value;
    notifyListeners();

  }

  Future<GetProductById> getProductById({int productId}) async {
    GetProductById response = await ProductApi.api.getProductById(
      product_id: productId,
    );
    this.productById = response;
    notifyListeners();
    selectVarientIndex(0);
    quantity = 1;
    if (productById != null) {
      if (productById.data.variants[0].inventories != null)
        setQunty(productById.data.variants[0].inventories[0].qty);
    }
    return productById;
  }

  Future<ProductResponse> getAllProducts({int productId}) async {
    ProductResponse response = await ProductApi.api.getAllProducts(
      product_id: productId,
    );
    this.productList = response.data;
    productRespone = response;
    notifyListeners();
    return productRespone;
  }

  ProductResponse searchListResponse;
  bool isSearchLoading=false;
  Future<ProductResponse> getSearchProducts({int productId}) async {
    isSearchLoading=true;
    notifyListeners();
    ProductResponse response = await ProductApi.api.getAllProducts(
        product_id: productId,
        category: selectedCategory,
        search: search,
        order: order,
        sort: sort,
        price: price,
        brand: selectedBrand,
        // color:selectedColorResponse.id;
        size: selectedSizeResponse,
        new_arrivals_in: selectedArrivals);
    searchListResponse = response;
    isSearchLoading=false;
    notifyListeners();
    return searchListResponse;
  }
}
