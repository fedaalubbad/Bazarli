import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/constants/heights.dart';
import 'package:bazarli/navigation_service/navigation_service.dart';
import 'package:bazarli/view/home/home_main_screen.dart';
import 'package:bazarli/view/slider_splash/widgets/slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class SliderScreen extends StatefulWidget{
  @override
  _SliderScreenState createState() => _SliderScreenState();

  }

class _SliderScreenState extends State<SliderScreen> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    SliderPage(
        title: 'Slider1Title1',
        description:('Slider1Title2'),
        image: "assets/svg/page1.svg"),
    SliderPage(
        title:'Slider2Title1',
        description:'Slider2Title2',
        image: "assets/svg/page2.svg"),
    SliderPage(
        title: 'Slider3Title1',
        description:'Slider3Title2',
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
                  NavigationService.navigationService.navigateAndReplaceWidget(HomeMainScreen(selectedPageIndex: 0,));

                },
                child: Container(
                  child:  Text('Skip',
                    style:SliderSkipTextStyle
                  ).tr(),

                  ),
                ),
              ),

        
              Positioned(
                left: kDefaultPaddin ,
                bottom:kDefaultPaddin ,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: List<Widget>.generate(_pages.length, (int index) {
                      return Container(
                            height: 5.5,
                            width: 5.5,
                            margin:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 30),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: (index == _currentPage)
                                    ? PrimaryColor
                                    : PrimaryColorWithOpacity));
                     
                    })
                ),
              ),
              Positioned(
                right: kDefaultPaddin,
                bottom: 76.h,
                child: InkWell(
                  onTap: () {
                    _controller.nextPage(
                        duration: Duration(milliseconds: 800),
                        curve: Curves.easeInOutQuint);
                    if(_currentPage==_pages.length-1)
                     NavigationService.navigationService.navigateAndReplaceWidget(HomeMainScreen(selectedPageIndex: 0,));

                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 45.h,
                      width: 157.w,
                      decoration: BoxDecoration(
                          color: PrimaryColor,
                          borderRadius: BorderRadius.circular(ScreenUtil().radius(5))),
                      child:  Text('Next',
                        style:SliderNextStyle).tr(),


                  )
                    
                ),
              ),

            ],
          ),
      //   ],
      // ),
    );
  }
}