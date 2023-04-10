class AppLink {
  static const String server = "https://bluplestore.com/ecommerce";

  //////////// images //////////////
  static const String imageserver = "https://bluplestore.com/ecommerce/upload";
  static const String imagecategories = "$imageserver/categories";
  static const String imageitems = "$imageserver/items";

  static const String test = "$server/test.php";

  //////// auth /////////////
  static const String signup = "$server/auth/signup.php";
  static const String verfiyCodeSignUp = "$server/auth/verfiycode.php";
  static const String login = "$server/auth/login.php";
  static const String resend = "$server/auth/resend.php";

  //////// Forgetpassword ///////
  static const String checkemail = "$server/forgetpassword/checkemail.php";
  static const String verfiyCodeForgetPassword =
      "$server/forgetpassword/verifycode.php";
  static const String resetPassword =
      "$server/forgetpassword/resetpassword.php";
/////////// home ///////////////////
  static const String home = "$server/home.php";
////////////// items ///////////////////////
  static const String items = "$server/items/items.php";

///////////// Favorite /////////////////
  ///
  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String favoriteView = "$server/favorite/view.php";
  static const String deletefromfavorite =
      "$server/favorite/deletefromfavorite.php";

// cart
  static const String cartview = "$server/cart/view.php";

  static const String cartadd = "$server/cart/add.php";
  static const String cartdelete = "$server/cart/delete.php";
  static const String cartgetcountitems = "$server/cart/getcountitems.php";

  // search

  static const String searchitems = "$server/items/search.php";

  /// address

  static const String addaddress = "$server/address/add.php";
  static const String deleteaddress = "$server/address/delete.php";
  static const String editaddress = "$server/address/edit.php";
  static const String viewaddress = "$server/address/view.php";

  ///coupon

  static const String checkcoupon = "$server/coupon/checkcoupon.php";

  // transaction

  static const String uploadimage = "$server/upload/uploadimage.php";
  static const String addtransaction = "$server/transaction/addtransaction.php";
  static const String viewtransaction =
      "$server/transaction/gettransaction.php";

  // static const String uploadimageview = "$imageserver/transactions";

  //orders

  static const String addorder = "$server/orders/checkout.php";
  static const String pendingorders = "$server/orders/pendingorders.php";
  static const String archive = "$server/orders/archive.php";
  static const String delete = "$server/orders/delete.php";


  static const String ordersdetails = "$server/orders/details.php";

  // notifications

  static const String notification = "$server/notifications/get.php";

  //contact us

  static const String contactusview = "$server/contactus/view.php";

  //offers

  static const String offersview = "$server/offers.php";

  // rating

  static const String orderarchiverating = "$server/rating/ordersarchive.php";

  // sub items

  static const String subitemscolor = "$server/subitems/colorsview.php";
  static const String subitemssizes = "$server/subitems/sizesview.php";


}
