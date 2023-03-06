import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/cart_provider.dart';
import 'request_summary_screen.dart';



final _count = StateProvider((ref) => 1);
class CartSceen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(_count);
    final _data = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffffffff),
        elevation: 0,
        leadingWidth: 120,
        leading: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,size: 20,),
          label: const Text('Giỏ Hàng',style: TextStyle(fontSize: 18, color: Colors.black),),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: _data.when(
                  data: (_data) {
                    if(_data!=null){
                      /*List<ProductModel> userList = _data;*/
                      List userList = _data;
                      return Container(
                        child:  ListView.builder(
                          /*itemCount: userList.length,*/
                          itemCount: 3,
                          physics:NeverScrollableScrollPhysics(),
                          shrinkWrap:true,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 20),
                              padding: EdgeInsets.all(11),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: Color(0xFFE8E8E8)),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                      width: 110,
                                      height: 110,
                                      margin: EdgeInsets.only(right: 20),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFBF4ED),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child:
                                      /*Image.asset('assets/img/image1.png'),*/
                                      Image.network(userList![index].images!.first.toString())
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 6),
                                        child: Text(userList[index].title.toString(), style: TextStyle(
                                          fontWeight: FontWeight.w300, fontSize: 13,),),
                                      ),
                                      Container(
                                        width:255,
                                        child: Padding(
                                          padding: const EdgeInsets.only(bottom: 12,right: 50),
                                          child: Text('Size M', style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 13,
                                            color: Color(0xFF6C6C6C),)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 230,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [

                                            Text((userList[index].price.toString()), style: TextStyle(
                                                fontWeight: FontWeight.w300, fontSize: 13,)),
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () => {ref.read(_count.notifier).state--} ,
                                                  child:
                                                  Container(
                                                    padding: EdgeInsets.all(4),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(color: Color(0xFFFB9116)),
                                                      borderRadius: BorderRadius.circular(20),
                                                    ),
                                                    child: Icon(CupertinoIcons.minus, size: 14,
                                                        color: Color(0xFFFB9116)),
                                                  ),
                                                ),
                                                Container(
                                                    width: 24,
                                                    height: 24,
                                                    margin: EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Color(0xFFDDDDE3)),
                                                      borderRadius: BorderRadius.circular(4),
                                                    ),
                                                    child: Center(child: Text('$count',
                                                      style: TextStyle(
                                                          color: Color(0xFF6C6C6C)),))),
                                                GestureDetector(
                                                  onTap: () => {ref.read(_count.notifier).state++} ,
                                                  child:
                                                  Container(
                                                    padding: EdgeInsets.all(4),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(color: Color(0xFFFB9116)),
                                                      borderRadius: BorderRadius.circular(20),
                                                    ),
                                                    child: Icon(CupertinoIcons.add, size: 14,
                                                        color: Color(0xFFFB9116)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),

                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }

                  },
                  error: (err, s) => Text(err.toString()),
                  loading: () => const Center(child: CircularProgressIndicator(),)),

            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11),
              child: Container(
                margin: EdgeInsets.only(bottom: 30, top: 10),
                height: 220,
                padding: EdgeInsets.only(
                    top: 26, bottom: 21, right: 30, left: 30),
                decoration: BoxDecoration(
                    color: Color(0xFFFBF4ED),
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Tổng tạm tính', style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              color: Color(0xFF525252))),
                          Text('147.000đ', style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              color: Color(0xFF525252))),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Khuyến mãi', style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              color: Color(0xFF525252))),
                          Text('0đ', style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              color: Color(0xFF525252))),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Tổng cộng', style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(0xFF222222))),
                          Text('147.000đ', style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(0xFF222222))),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 180,
                      height: 50,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Color(
                                0xFFFB9116)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                )
                            )
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Request(),));
                          },
                          child: Text('Tiếp tục', style: TextStyle(fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),)
                      ),
                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}



