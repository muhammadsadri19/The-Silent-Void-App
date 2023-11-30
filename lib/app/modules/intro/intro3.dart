import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Intro3 extends StatefulWidget {
  const Intro3({Key? key}) : super(key: key);

  @override
  _Intro3State createState() => _Intro3State();
}

class _Intro3State extends State<Intro3> {
  final List<Widget> logoGames = [
    Image.asset(
      'assets/images/logoGame/ff.png',
      width: 50,
      height: 50,
    ),
    Image.asset(
      'assets/images/logoGame/gta.png',
      width: 50,
      height: 50,
    ),
    Image.asset(
      'assets/images/logoGame/mc.png',
      width: 50,
      height: 50,
    ),
    Image.asset(
      'assets/images/logoGame/ml.png',
      width: 50,
      height: 50,
    ),
    Image.asset(
      'assets/images/logoGame/pubg.png',
      width: 50,
      height: 50,
    ),
  ];

  Widget buildSocialMediaButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: Colors.white,
        size: 30,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Uri urlInstagram = Uri.parse('https://www.instagram.com/muuri._/');
    final Uri urlWhatsapp = Uri.parse(
        'https://wa.me/6282268215563?text=Hallo%20Min!%20Aku%20butuh%20ilmu%20baru%20nih%20tentang%20mobile%20developer');
    final Uri urlGithub = Uri.parse('https://github.com/muhammadsadri19');
    final Uri urlYoutube =
        Uri.parse('https://www.youtube.com/channel/UCPBbmVxt17sqKbDa4zUj0gw');
    final Uri urlDiscord = Uri.parse('https://discord.gg/VqS5PJeVMv');

    return Container(
      color: Color(0xff353545),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Lottie.network(
                'https://lottie.host/b5cbfe1a-2908-4642-80dc-ae1611849455/kzVKoy0EaV.json',
                width: 100,
                height: 100),
          ),
          Container(
            // color: Colors.green,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Padding(
              padding: const EdgeInsets.only(right: 3, left: 3),
              child: Container(
                height: 50,
                child: CarouselSlider(
                  items: logoGames,
                  options: CarouselOptions(
                      height: 50,
                      enlargeCenterPage: true,
                      viewportFraction: 0.2,
                      aspectRatio: 2.0,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.ease),
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Thank You for Your Support!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Exo2'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Stay Connected with Us on Social Media',
                    style: TextStyle(
                        color: Colors.white, fontSize: 16, fontFamily: 'Exo2'),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSocialMediaButton(
                        icon: MdiIcons.instagram,
                        onPressed: () async {
                          launchUrl(urlInstagram);
                          print('Instagram');
                          // Add navigation logic for Instagram
                        },
                      ),
                      buildSocialMediaButton(
                        icon: MdiIcons.whatsapp,
                        onPressed: () async {
                          launchUrl(urlWhatsapp);
                          // Add navigation logic for WhatsApp
                        },
                      ),
                      buildSocialMediaButton(
                        icon: MdiIcons.github,
                        onPressed: () {
                          launchUrl(urlGithub);
                          print('GitHub');
                          // Add navigation logic for GitHub
                        },
                      ),
                      buildSocialMediaButton(
                        icon: MdiIcons.youtubeStudio,
                        onPressed: () {
                          launchUrl(urlYoutube);
                          print('YouTube');
                          // Add navigation logic for YouTube
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Join Our Community!',
                    style: TextStyle(
                        color: Colors.white, fontSize: 16, fontFamily: 'Exo2'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      launchUrl(urlDiscord);
                      print('Join Community');
                      // Add logic to join the community
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // Button color
                      onPrimary: Colors.white, // Text color
                    ),
                    child: Text(
                      'Join Now',
                      style: TextStyle(fontFamily: 'Exo2'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
