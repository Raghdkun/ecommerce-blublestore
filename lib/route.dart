import 'package:get/get.dart';
import 'package:powerecommerce/core/constant/routes.dart';
import 'package:powerecommerce/core/middleware/mymiddleware.dart';
import 'package:powerecommerce/view/address/add.dart';

import 'package:powerecommerce/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:powerecommerce/view/screen/auth/login.dart';
import 'package:powerecommerce/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:powerecommerce/view/screen/auth/signup.dart';
import 'package:powerecommerce/view/screen/auth/success_signup.dart';
import 'package:powerecommerce/view/screen/auth/forgetpassword/succsess_resetpassword.dart';
import 'package:powerecommerce/view/screen/auth/forgetpassword/verfiycode.dart';
import 'package:powerecommerce/view/screen/auth/virefycodesignup.dart';
import 'package:powerecommerce/view/screen/cart.dart';
import 'package:powerecommerce/view/screen/checkout.dart';
import 'package:powerecommerce/view/screen/homescreen.dart';
import 'package:powerecommerce/view/screen/items.dart';
import 'package:powerecommerce/view/screen/language.dart';
import 'package:powerecommerce/view/screen/myfavorite.dart';
import 'package:powerecommerce/view/screen/notificationsview.dart';
import 'package:powerecommerce/view/screen/onbording.dart';
import 'package:powerecommerce/view/screen/orders/transactionImage.dart';

import 'package:powerecommerce/view/screen/settings.dart';
import 'package:powerecommerce/view/wallet/walletview.dart';
import 'package:powerecommerce/view/widget/items/images.dart';
import 'package:powerecommerce/test.dart';
import 'view/address/view.dart';
import 'view/screen/contactus.dart';
import 'view/screen/offers/offersview.dart';
import 'view/screen/orders/archive.dart';
import 'view/screen/orders/orders.dart';
import 'view/screen/orders/ordersdetails.dart';
import 'view/screen/productdetails.dart';

List<GetPage<dynamic>>? routes = [
  // auth path
  GetPage(
      name: "/",
      page: () => const Language(),
      middlewares: [MyMiddleWare()],
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500)),
  // GetPage(
  //     name: "/", page: () => const TestView(),),

  GetPage(
      name: AppRoute.login,
      page: () => const Login(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500)),
  GetPage(
      name: AppRoute.signUp,
      page: () => const SignUp(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500)),
  GetPage(
      name: AppRoute.forgetPassword,
      page: () => const ForgetPassword(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500)),
  GetPage(
      name: AppRoute.verfiyCode,
      page: () => const VerfiyCode(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500)),
  GetPage(
      name: AppRoute.resetPassword,
      page: () => const ResetPassword(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500)),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPassword(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500)),
  GetPage(
      name: AppRoute.successSignUp,
      page: () => const SuccessSignUp(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500)),
  GetPage(
      name: AppRoute.verfiyCodeSignup,
      page: () => const VerfiyCodeSignUp(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500)),
  //onboarding path
  GetPage(
      name: AppRoute.onboarding,
      page: () => const Onbording(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500)),
  // app pages
  GetPage(
      name: AppRoute.home,
      page: () => const HomeScreen(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500)),
// items
  GetPage(
      name: AppRoute.items,
      page: () => const Items(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500)),
  GetPage(
      name: AppRoute.productdetails,
      page: () => ProductDetails(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500)),
  GetPage(
      name: AppRoute.productdetail,
      page: () => const ProductDetail(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500)),

  GetPage(
      name: AppRoute.images,
      page: () => Images(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500)),
  // favorite
  GetPage(
      name: AppRoute.myFavorite,
      page: () => const MyFavorite(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500)),
  // settings
  GetPage(
      name: AppRoute.settings,
      page: () => const Settings(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500)),
  // cart
  GetPage(
      name: AppRoute.mycart,
      page: () => const Cart(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500)),

  //Address
  GetPage(
      name: AppRoute.addressview,
      page: () => const AddressView(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500)),
  GetPage(
      name: AppRoute.addressadd,
      page: () => const AddressAdd(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500)),

  //checkout

  GetPage(
      name: AppRoute.checkout,
      page: () => const CheckOut(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500)),

  //orders

  GetPage(
      name: AppRoute.orders,
      page: () => const OrdersPendings(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500)),
  GetPage(
      name: AppRoute.archivedorders,
      page: () => const ArchivedOrders(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500)),
  GetPage(
      name: AppRoute.ordersdetails,
      page: () => const OrdersDetails(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500)),

  GetPage(
      name: AppRoute.transactionimage,
      page: () => const TransactionImage(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500)),

  // Notifications
  GetPage(
      name: AppRoute.notification,
      page: () => const NotificationsView(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500)),


  //contact us 
  GetPage(
      name: AppRoute.contactus,
      page: () => const ContactUs(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500)),    
// offers
      GetPage(
      name: AppRoute.offersview,
      page: () => const OffersView(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500)),


      //wallet
       GetPage(
      name: AppRoute.walletview,
      page: () => const WalletView(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 500)),
];
