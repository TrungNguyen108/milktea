import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Color(0xFFFFF),
      ) ,
      body: SingleChildScrollView(
          //You can use any widget
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Center(
                  child: Text("TWelcome The Alley Tea",style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF0E0E0E)
                  ), textAlign: TextAlign.center),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Center(
                  child: Text("Đăng ký tài khoản",style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF222222)
                  ), textAlign: TextAlign.center),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                child: const TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    fillColor: Color(0xFFF5F5FA),
                    filled: true,
                    border: InputBorder.none,
                    labelText: 'Họ và tên(*)',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: const TextField(
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(

                    fillColor: Color(0xFFF5F5FA),
                    filled: true,
                    border: InputBorder.none,
                    labelText: 'Số điện thoại(*)',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: const TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    fillColor: Color(0xFFF5F5FA),
                    filled: true,
                    border: InputBorder.none,
                    labelText: 'Email của bạn',
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
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: GFButton(
                  onPressed: (){},
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
          )
      ),
    );
  }
}