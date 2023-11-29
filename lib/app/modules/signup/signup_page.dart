import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_silent_void/app/modules/signin/signin_page.dart';
import 'package:the_silent_void/app/modules/signup/widget/my_button.dart';
import 'package:the_silent_void/app/modules/signup/widget/square_tile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String _username = '';
  String _email = '';
  String _password = '';

  // sign user in method
  void _handleSignUp() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );

      // Tambahkan data pengguna ke Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'username': _username,
        'email': _email,
        'password': _password,

        // Tambahkan data pengguna lainnya sesuai kebutuhan
      });

      print('User Terdaftar: ${userCredential.user!.email}');
      Navigator.pop(context);
    } catch (e) {
      print('Error Selama Pendaftaran: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff353545),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),

                  // logo
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/images/easports.png',
                        height: 80,
                        width: 80,
                      ),
                      Image.asset(
                        'assets/images/gta.png',
                        height: 80,
                        width: 80,
                      ),
                      Image.asset(
                        'assets/images/xbox.png',
                        height: 80,
                        width: 80,
                      ),
                    ],
                  ),

                  const SizedBox(height: 50),

                  // welcome back, you've been missed!
                  Text(
                    'Welcome back you\'ve been missed!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Exo2',
                    ),
                  ),

                  const SizedBox(height: 25),

                  // email textfield
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: _usernameController,
                          keyboardType: TextInputType.name,
                          style: TextStyle(
                              color: Colors
                                  .white), // Warna teks di dalam TextField
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors
                                .grey[800], // Warna latar belakang TextField
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelText: 'Username',
                            labelStyle:
                                TextStyle(color: Colors.white), // Warna label
                            hintText: 'Enter your username',
                            hintStyle: TextStyle(
                                color: Colors.white70), // Warna teks hint
                            prefixIcon: Icon(Icons.email,
                                color: Colors.white), // Warna ikon
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Your Username';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _username = value;
                            });
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                              color: Colors
                                  .white), // Warna teks di dalam TextField
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors
                                .grey[800], // Warna latar belakang TextField
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelText: 'Email',
                            labelStyle:
                                TextStyle(color: Colors.white), // Warna label
                            hintText: 'Enter your email',
                            hintStyle: TextStyle(
                                color: Colors.white70), // Warna teks hint
                            prefixIcon: Icon(Icons.email,
                                color: Colors.white), // Warna ikon
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Your Email';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _email = value;
                            });
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          style: TextStyle(
                              color: Colors
                                  .white), // Warna teks di dalam TextField
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors
                                .grey[800], // Warna latar belakang TextField
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelText: 'Password',
                            labelStyle:
                                TextStyle(color: Colors.white), // Warna label
                            hintText: 'Enter your password',
                            hintStyle: TextStyle(
                                color: Colors.white70), // Warna teks hint
                            prefixIcon: Icon(Icons.lock,
                                color: Colors.white), // Warna ikon
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Your Password';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _password = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 50),

                  // forgot password?

                  // sign in button
                  MyButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _handleSignUp();
                      }
                    },
                  ),

                  const SizedBox(height: 50),

                  // or continue with
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Or continue with',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 50),

                  // google + apple sign in buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      // google button
                      SquareTile(imagePath: 'assets/images/google.png'),

                      SizedBox(width: 25),

                      // apple button
                      SquareTile(imagePath: 'assets/images/apple.png')
                    ],
                  ),

                  const SizedBox(height: 50),

                  // not a member? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SigninPage()),
                          );
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
