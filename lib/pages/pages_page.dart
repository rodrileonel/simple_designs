import 'package:flutter/material.dart';

class PagesPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          Page1(),
          Page2(),
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.lightBlue,
      child: Center(
        child: MaterialButton(
          padding: EdgeInsets.symmetric(vertical: 15,horizontal: 30),
          shape: StadiumBorder(),
          color: Colors.orange,
          textColor: Colors.white,
          child: Text('Hacer Click', style: TextStyle(fontSize: 20),),
          onPressed: () => Navigator.pushNamed(context, 'buttons'),
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Image(image: AssetImage('assets/space.jpg'),fit: BoxFit.cover),
        ),
        SafeArea(
          child: Center(
            child: Container(
              padding: EdgeInsets.all(40),
              child: Column(
                children: [
                  Text('11º',style: TextStyle(fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold),),
                  Text('Miercoles',style: TextStyle(fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold),),
                  Expanded(child: Container()),
                  Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 80,)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}