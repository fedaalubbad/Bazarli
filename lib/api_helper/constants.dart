const String baseUrl = 'https://test.bazarli.com/api/';
// Options options=Options(headers : { "app-id":"60bdbd22159b332fec7c83e6"} );

//PRODUCTS
const String GET_PRODUCTS_URL = "products/search"; // ID FOR ONE PRODUCT
const String SEARCH_PRODUCTS_URL = "products/search";
const String PRODUCT_ADDITIONAL_INFO_URL =
    "product-additional-information/"; //ID

//
const String GET_CATEGORIES_URL = "getCategories";
const String GET_ATTRIBUTES_URL = "attributes/";
const String GET_PRODUCT_ATTRIBUTES_URL = "families/";
const String GET_LOCALS_LANGUAGES_URL = "locales?token=true";

//SUPPLIER AUTH
const String SUPPLIER_LOGIN_URL = "suppliers/login";
const String SUPPLIER_REGISTER_URL = "suppliers/register";
const String GET_SUPPLIER_PROFILE_URL = "suppliers/get";
const String TEST_ODOO_SUPPLIER_URL = "suppliers/odoo";

//SUPPLIER PRODUCTS
const String GET_SUPPLIER_PRODUCTS_URL = "suppliers/products";
const String GET_BRANDS_URL = "suppliers/products/brands";
const String DELETE_PRODUCT_URL = "suppliers/products/destory";
const String CREATE_UPDATE_PRODUCT_URL = "suppliers/products/create";

//CUSTOMER AUTH
const String CUSTOMER_LOGIN_URL = "customer/login";
const String CUSTOMER_REGISTER_URL = "customer/register";
const String CUSTOMER_FORGET_PASSWORD_URL = "customer/forgot-password";
const String UPDATE_CUSTOMER_PROFILE_URL = "customer/profile?_method=PUT";
const String GET_CUSTOMER_PROFILE_URL = "customers/"; //ID
//CUSTOMER ADDRESSES
const String CREATE_ADDRESSES_URL = "addresses/create?token=true";
const String GET_ADDRESSES_URL = "addresses?token=true"; //USED FOR DELETE ALSO
const String UPDATE_DELETE_ADDRESS_URL = "addresses/";

//CUSTOMER ORDERS CHECKOUT
const String GET_ORDERS_URL = "orders";
const String ADD_PRODUCT_TO_CART_URL =
    "checkout/cart/add/"; //PRODUCTID, QUANTITY
const String GET_CART_URL = "checkout/cart";
const String EMPTY_CART_URL = "checkout/cart/empty";
const String REMOVE_ITEM_CART_URL = "checkout/cart/remove-item/"; // ID
const String APPLY_COUPON_URL =
    "checkout/cart/coupon"; // MOTHOD POST  TAKE CODE
const String DELETE_COUPON_URL =
    "checkout/cart/coupon"; // MOTHOD DELETE  TAKE CODE
const String MOVE_TO_WISHLIST_URL = "checkout/cart/move-to-wishlist/"; //ID
const String CHECKOUT_ADDRESS_URL = "checkout/save-address";
const String SHIPPING_METHOD_URL = "checkout/save-shipping"; //SHIPPING [METHOD]
const String PAYMENT_METHOD_URL = "checkout/save-payment"; //payment[method]
const String SAVE_ORDER_URL = "checkout/save-order"; //cart
const String UPDATE_CART_URL = "checkout/cart/update?_method=PUT";

//CUSTOMER WISHLIST
const String GET_WISHLIST_URL = "wishlist?token=true"; //USED TO DELETE TAKE ID
const String ADD_TO_WISHLIST = "wishlist/add"; //ID
const String MOVE_TO_CART = "move-to-cart"; //ID

//CUSTOMER INVOICES
const String GET_INVOICES_URL = "invoices";
const String GET_SHIPMENTS_URL = "shipments";

//CUSTOMER REVIEWS
const String GET_REVIEWS_URL = "reviews"; //USED  TO GET / ADD /DELETE

// SUPPLIER ORDERS
const String GET_SUPPLIER_ORDERS_URL = "suppliers/orders";
const String CANCEL_ITEM_ORDERS_URL = "suppliers/item-cancle";
const String SHIPPED_ITEM_ORDERS_URL = "suppliers/item-shiped";
const String INVOICE_ITEM_ORDERS_URL = "suppliers/item-invoice";
const String REFUND_PAYMENT_ITEM_ORDERS_URL = "suppliers/item-refund";

//

//PAYMENT
//SHIPMENT
