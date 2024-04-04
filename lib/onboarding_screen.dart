import 'package:bantu/intro_screens/intro_page_1.dart';
import 'package:bantu/intro_screens/intro_page_2.dart';
import 'package:bantu/intro_screens/intro_page_3.dart';
import 'package:bantu/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  //to keep track of pages
  PageController _controller = PageController();

  //to check if user is on last page
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //the page view
          PageView(
            controller: _controller,
            onPageChanged: (index){
              setState(() {
                onLastPage = (index ==2);
              });
            },
            children: [
             IntroPage1(),
              IntroPage2(),
              IntroPage3()
            ],
          ),
          
          Container(
              alignment: Alignment(0, 0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // skip
                  GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                      child: Text('Skip')),
                  SmoothPageIndicator ( controller: _controller, count: 3,),

                //next or finished
                  onLastPage ?
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context, 
                            MaterialPageRoute(builder: (context)
                        {
                          return Welcome();
                        },
                        ),
                        );
                      },
                      child: Text('Done'),
                  )
                 : GestureDetector(
                      onTap: () {
                        _controller.nextPage(duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                      child: Text('Next')
                  ),
                ],
              ))
        ],
      )
    );
  }
}
