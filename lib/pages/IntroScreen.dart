import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        scrollPhysics: BouncingScrollPhysics(),
        pages: [


          PageViewModel(
            titleWidget:  Text("WRITE A TITLE FOR THIS PAGE", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              ),
              ),
              body: "Wrute tge nire descruoituib if tge oage",
              image: Image.asset("assets/icons/logo2.png", height: 400, width: 400,),
          ),




          PageViewModel(
            titleWidget:  Text("Number 2", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              ),
              ),
              body: "Wrute tge nire descruoituib if tge oage",
              image: Image.asset("assets/icons/logo2.png", height: 400, width: 400,),
          ),




          PageViewModel(
            titleWidget:  Text("Number 3", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              ),
              ),
              body: "Wrute tge nire descruoituib if tge oage",
              image: Image.asset("assets/icons/logo2.png", height: 400, width: 400,),
          ),
        ],
        onDone: (){
          Navigator.pushNamed(context, "home");
        },
        onSkip: (){},
        showSkipButton: true,


        skip: Text("Skip", style:  TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.purple, ),),

        next: Icon(Icons.arrow_forward, color: Colors.purple,),

        done: Text("Done", style:  TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.purple, ),),

          dotsDecorator: DotsDecorator(
            size: Size.square(10.0),
            activeSize: Size(20.0, 10.0),
            color: Colors.black26,
            activeColor: Colors.purple,
            spacing: EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),



            )


          ),




      )





    );
  }

}