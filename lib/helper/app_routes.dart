import 'package:cedratools/views/cart_view.dart';
import 'package:cedratools/views/change_password_view.dart';
import 'package:cedratools/views/checkout_web_view.dart';
import 'package:cedratools/views/complete_profile_view.dart';
import 'package:cedratools/views/email_view.dart';
import 'package:cedratools/views/homepage/homepage_view.dart';
import 'package:cedratools/views/password_view.dart';
import 'package:cedratools/views/product_detail_view.dart';
import 'package:cedratools/views/reward_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String EMAIL_VIEW = "/email_view";
  static const String PASSWORD_VIEW = "/password_view";
  static const String LOADER_VIEW = "/loader_view";
  static const String HOME_PAGE_VIEW = "/home_page_view";
  static const String COMPLETE_PROFILE_VIEW = "/complete_profile_view";
  static const String CHANGE_PASSWORD_VIEW = "/change_password_view";
  static const String REWARD_VIEW = "/reward_view";
  static const String PRODUCT_DETAIL_VIEW = "/product_detail_view";
  static const String CART_VIEW = "/cart_view";
  static const String CHECKOUT_WEB_VIEW = "/checkout_web_view";

  static Route? getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case EMAIL_VIEW:
        {
          return MaterialPageRoute(
            builder: (_) {
              return EmailView();
            },
          );
        }
      case PASSWORD_VIEW:
        {
          return MaterialPageRoute(
            builder: (_) {
              return PasswordView();
            },
          );
        }
      case HOME_PAGE_VIEW:
        {
          return MaterialPageRoute(
            builder: (_) {
              return HomepageView();
            },
          );
        }
      case COMPLETE_PROFILE_VIEW:
        {
          return MaterialPageRoute(builder: (_) {
            return CompleteProfileView();
          });
        }
      case CHANGE_PASSWORD_VIEW:
        {
          return MaterialPageRoute(builder: (_) {
            return ChangePasswordView();
          });
        }
      case REWARD_VIEW:
        {
          return MaterialPageRoute(builder: (_) {
            return RewardView();
          });
        }
      case PRODUCT_DETAIL_VIEW:
        {
          return MaterialPageRoute(builder: (_) {
            return ProductDetailView(map: routeSettings.arguments);
          });
        }
      case CART_VIEW:
        {
          return MaterialPageRoute(builder: (_) {
            return CartView();
          });
        }
      case CHECKOUT_WEB_VIEW:
        {
          return MaterialPageRoute(builder: (_) {
            return CheckoutWebView(map: routeSettings.arguments);
          });
        }
      default:
        return null;
    }
  }
}
