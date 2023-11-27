import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Intro3 extends StatelessWidget {
  const Intro3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff353545),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Thank You for Your Support!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Stay Connected with Us on Social Media',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildSocialMediaButton(
                  icon: MdiIcons.instagram,
                  onPressed: () {
                    print('Instagram');
                    // Add navigation logic for Instagram
                  },
                ),
                buildSocialMediaButton(
                  icon: MdiIcons.whatsapp,
                  onPressed: () {
                    print('WhatsApp');
                    // Add navigation logic for WhatsApp
                  },
                ),
                buildSocialMediaButton(
                  icon: MdiIcons.github,
                  onPressed: () {
                    print('GitHub');
                    // Add navigation logic for GitHub
                  },
                ),
                buildSocialMediaButton(
                  icon: MdiIcons.youtubeStudio,
                  onPressed: () {
                    print('YouTube');
                    // Add navigation logic for YouTube
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Join Our Community!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                print('Join Community');
                // Add logic to join the community
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Button color
                onPrimary: Colors.white, // Text color
              ),
              child: Text('Join Now'),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

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
}
