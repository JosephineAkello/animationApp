import 'package:flutter/material.dart';
import '../widgets/cat.dart';

class Home extends StatefulWidget {
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> catAnimation;
  AnimationController catController;
  Animation<double> boxAnimation;
  AnimationController boxController;

  initState() {
    super.initState();
    catController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
    catAnimation = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: catController, curve: Curves.easeIn),
    );
  }
onTap(){
  if(catController.status==AnimationStatus.completed){
    catController.reverse();
  } else if(catController.status==AnimationStatus.dismissed){
    catController.forward();
  }
}
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation"),
      ),
      body: GestureDetector(
        child:Center(
          child: Stack(
            overflow: Overflow.visible,
            children: [
              buildCatAnimation(),
              buildBox(),
            ],
          ),
        ),
      
         onTap: onTap,
      ),
     
    );
  }

  Widget buildCatAnimation() {
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (context, child) {
        return Positioned(
          child: child,
          top: catAnimation.value,
          left: 0.0,
        );
      },
      child: Cat(),
    );
  }
  Widget buildBox(){
    return Container(
      height: 200.0,
      width: 200.0,
      color: Colors.pinkAccent,
    );
  }
  Widget buildLeftFlap(){
    return Positioned(
      left: 3.0,
      child: AnimatedBuilder(),
    );
  }
}
