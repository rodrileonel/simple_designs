import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ButtonsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Header(),
                  Content(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor:Color.fromRGBO(55,57,84,1),
          primaryColor: Colors.greenAccent,
          textTheme: Theme.of(context).textTheme.copyWith(
            caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1),),
          ),
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.calendar_today_rounded), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.piano), label: 'Piano'),
            BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle), label: 'User'),
          ],
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            Item(color:Colors.blue,icon:Icons.cached,texto: 'OPCION 1',),
            Item(color:Colors.orange,icon:Icons.access_alarm,texto: 'OPCION 2',),
          ]
        ),
        TableRow(
          children: [
            Item(color:Colors.black,icon:Icons.data_usage,texto: 'OPCION 3',),
            Item(color:Colors.red,icon:Icons.double_arrow,texto: 'OPCION 4',),
          ]
        ),
        TableRow(
          children: [
            Item(color:Colors.amber,icon:Icons.camera,texto: 'OPCION 5',),
            Item(color:Colors.brown,icon:Icons.bus_alert,texto: 'OPCION 6',),
          ]
        ),
      ],
    );
  }
}

class Item extends StatelessWidget {

  final Color color;
  final IconData icon;
  final String texto;

  const Item({
    required this.color, 
    required this.icon, 
    required this.texto
  });

  @override
  Widget build(BuildContext context) {
    final _screen = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(_screen.width *0.05),
      height: _screen.width *0.4,
      width: _screen.width *0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(62, 66, 107, 0.8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3,sigmaY: 3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 5,),
              CircleAvatar(
                radius: 30,
                backgroundColor: this.color,
                child: Icon(this.icon,color: Colors.white,size: 30,),
              ),
              Text(this.texto,style: TextStyle(color: this.color),),
              SizedBox(height: 5,),
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Titulo',style: TextStyle(color: Colors.white,fontSize: 35, fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Text('SubTitulo',style: TextStyle(color: Colors.white,fontSize: 25),),
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final _screen = MediaQuery.of(context).size;

    final principal = Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          //begin: Alignment.topCenter,
          //end: Alignment.bottomCenter,
          begin: FractionalOffset(0,0.5),
          end: FractionalOffset(0,1),
          colors: [
            Color.fromRGBO(52, 54, 101, 1),
            Color.fromRGBO(35, 37, 57, 1),
          ]
        )
      ),
    );
    final secondary = Transform.rotate(
      angle: -pi/6,
      child: Container(
        width: _screen.width * 0.9,
        height: _screen.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          color: Colors.green
        ),
      )
    );

    return Stack(
      children: [
        principal,
        Positioned(top: -90, left: -30,child: secondary)
      ],
    );
  }
}
