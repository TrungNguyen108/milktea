import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mikltea/layout.dart';

import 'screens/cart/model/cart_model_hive.dart';
import 'screens/product/model/like_model_hive.dart';


void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(CartModelHiveAdapter());
  // final _boxCart = await Hive.openBox('cart');
  Hive.registerAdapter(LikeModelHiveAdapter());
  // final _boxLike = await Hive.openBox('like');
  // _boxCart.clear();


  // runApp(const MyApp());
  runApp(ProviderScope(child: MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "Oswald",
          useMaterial3: true
      ),
      // home: HomePage(),
      routerConfig: router,
    );
  }
}