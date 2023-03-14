import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:go_router/go_router.dart';
import '../../account/screens/login_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFFFC6B2),
        //You can use any widget
        child: Padding(
          padding: const EdgeInsets.fromLTRB(55, 0, 55, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[

              Expanded(
                  child: Image.asset('assets/images/home1.png', alignment: Alignment.bottomCenter,),
              ),
              SizedBox(
                height: 230,
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    Text("The Alley Tea",style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 40,
                    ),),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Center(
                        child: Text("Tìm thức uống yêu thích của bạn và chúng tôi sẵn sàng cung cấp đến nhà của bạn",style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        ), textAlign: TextAlign.center),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GFButton(
                              padding: EdgeInsets.only(left: 20,right: 20),
                              onPressed: (){
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen()));
                                context.push('/home');
                              },
                              text: "Bắt đầu",
                              color: Color(0xFFFB9116),
                              shape: GFButtonShape.pills,
                            ),
                            SizedBox(width: 10,),
                            GFButton(
                              padding: EdgeInsets.only(left: 20,right: 20),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                              },
                              shape: GFButtonShape.pills,
                              text: "Đăng nhập",
                              color: Color(0xFFFFFFFF),
                              textColor: Colors.red,
                            ),
                            SizedBox(width: 10,),
                            GFButton(
                              padding: EdgeInsets.only(left: 20,right: 20),
                              onPressed: (){
                                context.push('/pdf');
                              },
                              shape: GFButtonShape.pills,
                              text: "PDF",
                              color: Color(0xFFFFFFFF),
                              textColor: Colors.red,
                            ),
                            // GFButton(
                            //   padding: EdgeInsets.only(left: 20,right: 20),
                            //   onPressed: (){
                            //     context.push('/maps');
                            //   },
                            //   shape: GFButtonShape.pills,
                            //   text: "Chỉ đường",
                            //   color: Color(0xFFFFFFFF),
                            //   textColor: Colors.red,
                            // ),
                          ],
                        ),
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
