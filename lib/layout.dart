import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import 'screens/cart/screens/cart_screens.dart';
import 'screens/cart/screens/payment_screens.dart';
import 'screens/cart/screens/success_screens.dart';
import 'screens/home/screens/home_screen.dart';
import 'screens/order/layout_order.dart';
import 'screens/pdf/screens/pdf_screen.dart';
import 'screens/product/screens/detail_screens.dart';
import 'screens/product/screens/home_screens.dart';
import 'screens/product/screens/like_product_screens.dart';
import 'screens/user/screen/account_info_screen.dart';

// import 'package:milktea/screen/cart_confirm_screen.dart';
// import 'package:milktea/screen/cart_screen.dart';
// import 'package:milktea/screen/index_screen.dart';
// import 'package:milktea/screen/intro_screen.dart';
// import 'package:milktea/screen/product_detail_screen.dart';

final GoRouter router = GoRouter(
  debugLogDiagnostics: false,
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        // print(state);
        return const HomeScreen();
      },
      routes: [
        GoRoute(
          path: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return const ProductScreen();
          },
          routes: [
            GoRoute(
              path: 'account_info',
              name: 'account_info',
              builder: (BuildContext context, GoRouterState state) {
                return const AccountInfoScreen();
              },
            ),
          ],
        ),
        GoRoute(
          path: 'product/:id',
          builder: (BuildContext context, GoRouterState state) {
            return DetailProduct(id: int.parse(state.params['id']!),);
          },
        ),
        GoRoute(
          path: 'cart',
          builder: (BuildContext context, GoRouterState state) {
            return const CartPage();
          },
        ),
        GoRoute(
          path: 'payment_page',
          builder: (BuildContext context, GoRouterState state) {
            return const PayMentPage();
          },
        ),
        GoRoute(
          path: 'order_success',
          builder: (BuildContext context, GoRouterState state) {
            return const OrderSuccess();
          },
        ),
        GoRoute(
          path: 'order',
          builder: (BuildContext context, GoRouterState state) {
            return const LayoutOrder();
          },
        ),
        GoRoute(
          path: 'favorite',
          builder: (BuildContext context, GoRouterState state) {
            return const LikeProduct();
          },
        ),
        GoRoute(
          path: 'pdf',
          builder: (BuildContext context, GoRouterState state) {
            return const PDFView();
          },
        ),
      ],
    ),
  ],
);