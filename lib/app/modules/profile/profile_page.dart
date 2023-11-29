import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String username = '';
  late String email = '';

  @override
  void initState() {
    super.initState();
    // Call the function to get user data when the widget is created
    getUserData();
  }

  Future<void> getUserData() async {
    try {
      // Dapatkan ID pengguna saat ini dari Firebase Authentication
      User? user = FirebaseAuth.instance.currentUser;
      String currentUserId = user?.uid ?? '';

      // Ambil data pengguna dari Firestore berdasarkan ID pengguna
      DocumentSnapshot<Map<String, dynamic>> userDoc = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(currentUserId)
          .get();

      // Periksa apakah dokumen ada di Firestore
      if (userDoc.exists) {
        // Akses data dari dokumen
        setState(() {
          username = userDoc['username'];
          email = userDoc['email'];
        });
      } else {
        print('Document does not exist on Firestore');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 34, 34, 55),
      appBar: AppBar(
        backgroundColor: Color(0xff353545),
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            color: Color(0xff353545),
            height: 120,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15.0, top: 15.0),
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage('assets/images/github.png'),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 15.0, left: 15.0),
                      child: Text(
                        username ?? 'Loading...',
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text(
                        email ?? 'Loading...',
                        style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
