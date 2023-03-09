import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

import '../../product/screens/home_screens.dart';



class Createpass_screen extends StatefulWidget {
  const Createpass_screen({Key? key}) : super(key: key);
  @override
  State<Createpass_screen> createState() => _Createpass_screenState();
}

class _Createpass_screenState extends State<Createpass_screen> {
  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _password = TextEditingController();
  TextEditingController _repassword = TextEditingController();

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
                child:Form(
                  key: _formKey,
                  child: Column(
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
                        child: TextFormField(
                          obscureText: true,
                          controller: _password,
                          decoration: InputDecoration(
                            fillColor: Color(0xFFF5F5FA),
                            filled: true,
                            border: InputBorder.none,
                            labelText: 'Mật khẩu ',
                          ),
                          validator: (value){
                            if (value == null || value.isEmpty) {
                              return 'Vui lòng nhập mật khẩu';
                            }else if(value.length < 6){
                              return 'Mật khẩu phải trên 6 ký tự';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                        child: TextFormField(
                          obscureText: true,
                          controller: _repassword,
                          decoration: InputDecoration(
                            fillColor: Color(0xFFF5F5FA),
                            filled: true,
                            border: InputBorder.none,
                            labelText: 'Nhập lại mật khẩu',
                          ),
                          validator: (value){
                            if (value == null || value.isEmpty) {
                              return 'Vui lòng nhập lại mật khẩu';
                            }else if(value.length < 6){
                              return 'Mật khẩu phải trên 6 ký tự';
                            }
                            return null;
                          },
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
                        child: ElevatedButton(
                          child: Text("Đăng nhập", style: TextStyle(fontSize: 15,fontWeight:FontWeight.w400,color: Color(0xFFFFFFFF),)),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFFFB9116),
                            padding: EdgeInsets.only(left: 40,right: 40)
                          ),
                          onPressed: (){
                            if (_formKey.currentState!.validate()) {
                              if(_password.text == _repassword.text){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen()));
                              }else{
                                Dialogs.materialDialog(
                                    context: context,
                                    color: Colors.white,
                                    title: 'Mật khẩu không trùng khớp, vui lòng nhập lại !',
                                    actions: [
                                      IconsButton(
                                        onPressed: (){
                                          Navigator.of(context).pop();
                                        },
                                        text: 'Ok',
                                        iconData: Icons.check,
                                        color: Color(0xFFFB9116),
                                        textStyle: const TextStyle(color: Colors.white),
                                        iconColor: Colors.white,
                                      )
                                    ]
                                );
                              }
                            }
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen()));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}