import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import '../../product/screens/home_screens.dart';
import 'Forgotpassword_screen.dart';
import 'register_screen.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  TextEditingController _userController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  var _useNameErr = "Tên đăng nhập không hợp lệ.";
  var _psssNameErr = "Mật khẩu trên 6 ký tự.";
  var _userInvalid = false;
  var _passInvalid = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    _userController.dispose();
    _passController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
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
                    child: Text("Welcome The Alley Tea",style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF0E0E0E)
                    ), textAlign: TextAlign.center),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Center(
                    child: Text("Đăng nhập tài khoản của bạn",style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF222222)
                    ), textAlign: TextAlign.center),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 70, 20, 20),
                  child:  TextField(
                    controller: _userController,
                    obscureText: false,
                    decoration: InputDecoration(
                      fillColor: Color(0xFFF5F5FA),
                      filled: true,
                      border: InputBorder.none,
                      labelText: 'Email hoặc số điện thoại',
                      errorText: _userInvalid ? _useNameErr : null,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child:  TextField(
                    obscureText: true,
                    controller: _passController,
                    decoration: InputDecoration(
                        fillColor: Color(0xFFF5F5FA),
                        filled: true,
                        border: InputBorder.none,
                        labelText: 'Password',
                        errorText: _passInvalid ? _psssNameErr : null
                    ),
                  ),
                ),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Forgotpassword()));
                },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: Align(child: Text('Quên mật khẩu?',style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF222222),
                            fontWeight: FontWeight.w300,
                          ),),alignment: Alignment.centerRight,),
                        ),
                      ],
                    )),

                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 15),
                  child: Text("Or",style: TextStyle(
                    color: Color(0xFF9A9A9A),
                    fontWeight:FontWeight.w300,
                  ),),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GFIconButton(
                        color: Colors.black26,
                        onPressed: (){},
                        icon: Icon(Icons.facebook,color: Colors.blue,),
                        type: GFButtonType.outline,
                      ),
                      SizedBox(width: 10,),
                      GFIconButton(
                        color: Colors.black26,
                        onPressed: (){},
                        icon: Icon(Icons.g_mobiledata,color: Colors.deepOrange),
                        type: GFButtonType.outline,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0,0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Bạn chưa có tài khoản",style: TextStyle(
                          color: Color(0xFF9A9A9A),
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),),
                        SizedBox(width: 5,),
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                        },
                            child: Row(
                              children: [
                                Text("Đăng ký ngay",style: TextStyle(
                                    color: Color(0xFFFB9116)
                                ),),
                              ],
                            )),
                      ],
                    ),
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
  void onSignInClicked(){
    setState((){
      if(_userController.text.length < 6 || !_userController.text.contains("@") ){
        _userInvalid = true;
      }
      else{
        _userInvalid=false;
      }
      if(_passController.text.length < 6){
        _passInvalid = true;
      } else{
        _passInvalid = false;
      }
      if(!_passInvalid && !_userInvalid){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen()));
      }
    });
  }
}