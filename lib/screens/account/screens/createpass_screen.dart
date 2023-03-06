import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import '../../product/screens/home_screens.dart';


class Createpass_screen extends StatefulWidget {
  const Createpass_screen({Key? key}) : super(key: key);
  @override
  State<Createpass_screen> createState() => _Createpass_screenState();
}

class _Createpass_screenState extends State<Createpass_screen> {
  bool valuefirst = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Color(0xFFFFFFFFF),
        elevation: 0,
        title:Text("Tạo mật khảu mới ",style: TextStyle(
          color: Colors.black,
        ),),
      ) ,
      body: SingleChildScrollView(
        //You can use any widget
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                height: 320,
                child: Image.asset('assets/images/taomk.png',),
              ),
              SizedBox(
                child:Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: Align(child: Text('Nhập lại mật khẩu mới của bạn ',style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF9A9A9A),
                        fontWeight: FontWeight.w100,
                      ),),alignment: Alignment.centerLeft,),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: Color(0xFFF5F5FA),
                          filled: true,
                          border: InputBorder.none,
                          labelText: 'Mật khẩu ',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: Color(0xFFF5F5FA),
                          filled: true,
                          border: InputBorder.none,
                          labelText: 'Nhập lại mật khẩu',
                        ),
                      ),
                    ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                                checkColor: Colors.greenAccent,
                                activeColor: Colors.red,
                                value: this.valuefirst,
                                onChanged: null
                            ),
                            Text("Nhớ mật khẩu",style: TextStyle(
                              fontSize: 13
                            ),)

                          ],
                        ),
                      ),
                     Padding(
                       padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                       child: GFButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen()));
                        },
                        text: "Đăng nhập",
                        textStyle: TextStyle(
                          fontSize: 15,
                          fontWeight:FontWeight.w400,
                        ),
                        fullWidthButton: true,
                        color: Color(0xFFFFB9116),
                        shape: GFButtonShape.pills,
                        size: GFSize.LARGE,
                    ),
                     ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
