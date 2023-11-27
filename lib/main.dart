import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:the_silent_void/app/modules/intro/intro1.dart';
import 'package:the_silent_void/app/modules/intro/intro2.dart';
import 'package:the_silent_void/app/modules/intro/intro3.dart';
import 'package:the_silent_void/app/modules/signin/signin_page.dart';

void main() {
  runApp(const MyApp());

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Silent Void',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  final PageController _controller = PageController();
  bool onlastPage = false;

  void _animatedJumpToPage(int halaman) {
    const Duration durasi = Duration(milliseconds: 500);
    const Curve kurva = Curves.easeInOut;

    _controller.animateToPage(
      halaman,
      duration: durasi,
      curve: kurva,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onlastPage = (index == 2);
            });
          },
          children: const [
            Intro1(),
            Intro2(),
            Intro3(),
          ],
        ),
        Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                      _animatedJumpToPage(2);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 50, left: 300),
                      alignment: Alignment.center,
                      width: 100,
                      height: 50,
                      child: Text(
                        'SKIP',
                        style: TextStyle(
                            fontWeight: FontWeight.w300, color: Colors.white),
                      ),
                    )),
                //Next or Done
                onlastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const SigninPage();
                              },
                            ),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 600, bottom: 20),
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color(0xffFFC700),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0)),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xffFFC700).withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3))
                              ]),
                          child: Text(
                            'DONE',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ))
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 600, bottom: 20),
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color(0xffFFC700),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3))
                              ]),
                          child: Text(
                            'NEXT',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        )),

                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  axisDirection: Axis.horizontal,
                  effect: SlideEffect(
                      spacing: 8.0,
                      radius: 4.0,
                      dotWidth: 24.0,
                      dotHeight: 16.0,
                      paintStyle: PaintingStyle.stroke,
                      strokeWidth: 1.5,
                      dotColor: Colors.grey,
                      activeDotColor: Color(0xffFFC700)),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}