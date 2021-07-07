import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/constants/heights.dart';
import 'package:bazarli/ui/Authentication/signup_Signin_screens/sign_screen.dart';
import 'package:bazarli/ui/slider_splash/slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class SliderScreen extends StatefulWidget{
  @override
  _SliderScreenState createState() => _SliderScreenState();

  }

class _SliderScreenState extends State<SliderScreen> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    SliderPage(
        title: translator.translate('Slider1Title1'),
        description:
        translator.translate('Slider1Title2'),
        image: "assets/svg/page1.svg"),
    SliderPage(
        title:translator.translate('Slider2Title1'),
        description:
        translator.translate('Slider2Title2'),
        image: "assets/svg/page2.svg"),
    SliderPage(
        title: translator.translate('Slider3Title1'),
        description:
        translator.translate('Slider3Title2'),
        image: "assets/svg/page3.svg"),
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:[


            PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: _onchanged,
            controller: _controller,
            itemCount: _pages.length,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),

          if(_currentPage==0)
            Positioned(
              top: 80,
              right: kDefaultPaddin,
              child: InkWell(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context){
                    return SignScreen();
                  }));

                },
                child: Container(
                  child:  Text(
                    translator.translate('Skip'),
                    style: translator.currentLanguage=='ar'?GoogleFonts.tajawal(textStyle: SliderSkipTextStyle):GoogleFonts.poppins(textStyle: SliderSkipTextStyle),

                  ),
                ),
              ),
            ),

          // Column(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: <Widget>[
              Positioned(
                left: kDefaultPaddin ,
                bottom:kDefaultPaddin ,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: List<Widget>.generate(_pages.length, (int index) {
                      return Container(
                            height: 5.5,
                            width: 5.5,
                            // width: (index == _currentPage) ? 30 : 10,
                            margin:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 30),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: (index == _currentPage)
                                    ? PrimaryColor
                                    : PrimaryColorWithOpacity));
                        // AnimatedContainer(
                        //   duration: Duration(milliseconds: 300),
                        //   height: 10,
                        //   width: (index == _currentPage) ? 30 : 10,
                        //   margin:
                        //   EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(5),
                        //       color: (index == _currentPage)
                        //           ? PrimaryColor
                        //           : PrimaryColor.withOpacity(0.5)));
                    })
                ),
              ),
              Positioned(
                right: kDefaultPaddin,
                bottom: 30,
                child: InkWell(
                  onTap: () {
                    _controller.nextPage(
                        duration: Duration(milliseconds: 800),
                        curve: Curves.easeInOutQuint);

                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 45,
                      width: 157,
                      decoration: BoxDecoration(
                          color: PrimaryColor,
                          borderRadius: BorderRadius.circular(5)),
                      child:  Text(
                        translator.translate('Next'),
                        style: translator.currentLanguage=='ar'?GoogleFonts.tajawal(textStyle: SliderNextStyle):GoogleFonts.poppins(textStyle: SliderNextStyle),

                      ),
                      )



                  // child: AnimatedContainer(
                  //   alignment: Alignment.center,
                  //   duration: Duration(milliseconds: 300),
                  //   height: 70,
                  //   width: (_currentPage == (_pages.length - 1)) ? 200 : 75,
                  //   decoration: BoxDecoration(
                  //       color: PrimaryColor,
                  //       borderRadius: BorderRadius.circular(35)),
                  //   child: (_currentPage == (_pages.length - 1))
                  //       ? Text(
                  //     "Get Started",
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 20,
                  //     ),
                  //   )
                  //       : Icon(
                  //     Icons.navigate_next,
                  //     size: 50,
                  //     color: Colors.white,
                  //   ),
                  // ),
                ),
              ),

            ],
          ),
      //   ],
      // ),
    );
  }
}