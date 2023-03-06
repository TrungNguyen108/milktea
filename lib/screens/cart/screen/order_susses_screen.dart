import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../product/screens/home_screens.dart';

class OrderSusses extends StatelessWidget {
  const OrderSusses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFB572),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 43),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/cart1.png'),
              Padding(
                padding: const EdgeInsets.only(top: 40,bottom: 10),
                child: Text('Đơn hàng đã được đặt',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 76),
                child: Text('Chúc mừng bạn đã đặt thành công chúng tôi sẽ giao sớm đến cho bạn',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,),textAlign: TextAlign.center,),
              ),
              GFButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen()));
                },
                text: "Trở Về",
                color: Color(0xFFFFFFFF),
                padding: EdgeInsets.only(left: 50,right: 50),
                shape: GFButtonShape.pills,
                size: GFSize.LARGE,
                textStyle: TextStyle(fontSize: 16,color: Color(0xFFFB9116),fontFamily: 'Oswald-Medium'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
