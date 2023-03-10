import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import '../../account/screens/login_screen.dart';
import '../../product/screens/home_screens.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          backgroundColor: Color(0xFFFFC6B2),
          title:Text("Home Screen",style: TextStyle(
            color: Colors.black87,
          ),),
        ) ,
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
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen()));
                              },
                              text: "Bắt đầu",
                              color: Color(0xFFFB9116),
                              shape: GFButtonShape.pills,
                            ),
                            SizedBox(width: 10,),
                            GFButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                              },
                              shape: GFButtonShape.pills,
                              text: "Đăng nhập",
                              color: Color(0xFFFFFFFF),
                              textColor: Colors.red,
                            ),

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
