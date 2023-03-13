import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../model/product_model.dart';
import '../provider/filter_provider.dart';
import 'widgets/bottombar.dart';
import 'widgets/filter_widget.dart';
import 'widgets/product_widget.dart';

List<ProductModel> items = [];

class FilterPage extends ConsumerWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(filterProvider);
    items = filterState.listProducts;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0,
        leadingWidth: 50,
        leading:Center(
          child: Container(
            margin: const EdgeInsets.only(left: 20),
            width: 30,
            height: 30,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(500),
              child: Image.asset('assets/images/avatar.jpg',fit: BoxFit.cover),
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
                text: const TextSpan(
                    children: const [
                      TextSpan(text: 'Xin Chào ',style: TextStyle(fontSize: 13,color: Color(0xFF656565),fontFamily: "Oswald-Regular"),),
                      TextSpan(text: 'Nguyen Van A',style: TextStyle(fontSize: 13,color: Color(0xFF656565),fontFamily: 'Oswald-Medium'),)
                    ]
                )
            ),
            Wrap(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(500),
                    child: Container(
                        width: 32,
                        height: 32,
                        color: const Color(0xFFFFF5EB),
                        child: IconButton(
                          onPressed: (){
                            context.push('/favorite');
                          },
                          icon: const Icon(Icons.favorite, size: 20,),padding: const EdgeInsets.all(5),)
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(500),
                  child: Container(
                      width: 32,
                      height: 32,
                      color: const Color(0xFFFFF5EB),
                      child: IconButton(
                        onPressed: (){
                          context.push('/order');
                        },
                        icon: const Icon(Icons.shopping_bag, size: 20,),padding: const EdgeInsets.all(5),)
                  ),
                )
              ],
            ),
          ],
        ),
      ) ,
      body:SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Lọc sản phẩm',
                      style: TextStyle(fontSize: 20,color: Colors.black,fontFamily: 'Oswald-Medium'),
                      textAlign: TextAlign.left,
                    ),
                    GestureDetector(
                      child: Icon(Icons.filter_list,size: 25,color: Colors.black),
                      onTap: (){
                        showModalBottomSheet<void>(
                          context: context,
                          // backgroundColor: Colors.transparent,
                          builder: (BuildContext context) {
                            return Filter();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const SizedBox(height: 15),
              Column(
                children: [
                  items.length > 0 ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 210,
                            crossAxisCount: 2,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                          ),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(0),
                          itemCount: items.length,
                          itemBuilder: (context, i) {
                            return ItemProduct(item: items[i]);
                          },
                      ),
                    ],
                  ) : const Center(
                    child: Text('Không tìm thấy sản phẩm nào.'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}