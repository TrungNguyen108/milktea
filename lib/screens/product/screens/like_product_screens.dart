import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../model/like_model.dart';
import '../provider/like_provider.dart';
import 'home_screens.dart';

List<LikeModel> items = [];

class LikeProduct extends ConsumerWidget {
  const LikeProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final likeState = ref.watch(likeProvider);
    items = likeState.listLikes;
    return Scaffold(
      appBar:AppBar(
        elevation: 0,
        leadingWidth: 220,
        leading: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,size: 20,),
          label: const Text('Sản phẩm yêu thích', style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w700)),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
        ),
      ) ,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: items.length > 0?Column(
            children: [
              for(int i = 0;i < items.length;i++)...[
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1,color: Color(0xFFE8E8E8)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              color: Color(0xFFEFE3FF),
                              child: Image.network(items[i].photo.toString(),fit: BoxFit.fitHeight,height: 120,),
                            ),
                          )
                      ),
                      Expanded(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.only(left: 20,top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(items[i].title.toString(),style: TextStyle(fontSize: 14,color: Color(0xFF222222)),),
                                SizedBox(height: 10),
                                Text('Size M',style: TextStyle(fontSize: 14,color: Color(0xFF6C6C6C)),),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(NumberFormat("#,###", "en_US").format((items[i].price!)) +" đ",
                                        style: TextStyle(fontSize: 14,color: Color(0xFF222222))
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                      )
                    ],
                  ),
                ),
              ],
            ]
          ):Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  child: Image.asset("assets/images/cart_emty.png"),
                ),
                Container(
                  margin:
                  const EdgeInsets.only(left: 0, top: 20, right: 0, bottom: 0),
                  child: const Text("Bạn chưa có sản phẩm nào",
                      style: TextStyle(
                          fontFamily: 'Oswald',
                          color: Color(0xff222222),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center),
                ),
                Container(
                  margin:
                  const EdgeInsets.only(left: 0, top: 5, right: 0, bottom: 20),
                  child: const Text(
                      "Bạn nghĩ thế nào về việc thử đồ uống mới của chúng tôi ?",
                      style: TextStyle(
                          fontFamily: 'Oswald',
                          color: Color(0xff222222),
                          fontSize: 13,
                          fontWeight: FontWeight.w300),
                      textAlign: TextAlign.center),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xffFB9116),
                      minimumSize: const Size(350, 42) // NEW,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen()));
                  },
                  child: const Text(
                    'Trở về',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
