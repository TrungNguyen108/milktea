import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'createpass_screen.dart';
class Forgotpassword extends StatefulWidget {
  const Forgotpassword({Key? key}) : super(key: key);

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Color(0xFFFFF),
        title:Text("Quên mật khẩu ",style: TextStyle(
          color: Colors.black,
        ),),
      ) ,
      body: SingleChildScrollView(
        child: Container(
            color: Color(0xFFFFF),
            //You can use any widget
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Center(
                    child: Text("Nhập mã opt được gửi sms qua số ******321",style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF222222)
                    ), textAlign: TextAlign.center),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 30, 25, 30),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            color: Color(0xFFF5F5FA),
                            width: 70,
                            height: 60,
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              onChanged: (value){
                                if(value.length == 1){
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              style: Theme.of(context).textTheme.headline6,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            color: Color(0xFFF5F5FA),
                            width: 70,
                            height: 60,
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              onChanged: (value){
                                if(value.length == 1){
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              style: Theme.of(context).textTheme.headline6,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            color: Color(0xFFF5F5FA),
                            width: 70,
                            height: 60,
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              onChanged: (value){
                                if(value.length == 1){
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              style: Theme.of(context).textTheme.headline6,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            color: Color(0xFFF5F5FA),
                            width: 70,
                            height: 60,
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              onChanged: (value){
                                if(value.length == 1){
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              style: Theme.of(context).textTheme.headline6,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Gửi lại"),
                        SizedBox(width: 5),
                        Text("(00:45s)",style: TextStyle(
                          color: Color(0xFFFB9116),
                          fontSize: 15,
                        ),)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: GFButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Createpass_screen()));
                    },
                    text: "Xác thực",
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

            )
        ),
      ),
    );
  }
}