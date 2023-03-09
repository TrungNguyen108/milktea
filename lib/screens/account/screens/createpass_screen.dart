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
  bool isChecked = false;
  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  final TextEditingController _userController1 = TextEditingController();
  final TextEditingController _passController1 = TextEditingController();
  final _useNameErr1 = "Mật khẩu chưa khớp";
  final _psssNameErr = "Mật khẩu trên 6 ký tự.";
  var _userInvalid1 = false;
  var _passInvalid = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    _userController1.dispose();
    _passController1.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title:Text("Tạo mật khẩu mới ",style: TextStyle(
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
                        fontWeight: FontWeight.w300,
                      ),),alignment: Alignment.centerLeft,),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: TextField(
                        obscureText: true,
                        controller: _passController1,
                        decoration: InputDecoration(
                            fillColor: Color(0xFFF5F5FA),
                            filled: true,
                            border: InputBorder.none,
                            labelText: 'Mật khấu',
                            errorText: _passInvalid ? _psssNameErr : null
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: TextField(
                        obscureText: true,
                        controller: _userController1,
                        decoration: InputDecoration(
                            fillColor: Color(0xFFF5F5FA),
                            filled: true,
                            border: InputBorder.none,
                            labelText: 'Nhập lại mật khẩu',
                            errorText: _userInvalid1 ? _useNameErr1 : null
                        ),
                      ),
                    ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              child: GFCheckbox(
                                size: GFSize.LARGE,
                                activeBgColor: Color(0xFFFFB9116),
                                onChanged: (value) {
                                  setState(() {
                                    isChecked = value;
                                  });
                                },
                                value: isChecked,
                                inactiveIcon: null,
                              ),
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
                         onPressed: onSignInClicked,
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
  void onSignInClicked(){
    setState((){
      if(_passController1.text.length < 6){
        _passInvalid = true;
      } else{
        _passInvalid = false;
      }
      if(_userController1.text != _passController1.text){
        _userInvalid1 = true;
      }
      else{
        _userInvalid1=false;
      }
      if(!_passInvalid && !_userInvalid1){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen()));
      }
    });
  }
}
