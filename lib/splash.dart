import 'package:flutter/material.dart';
import 'package:sknk/loginpage.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    _startAnimations();
  }

  _startAnimations() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
  }


  @override
  Widget build(BuildContext context) =>  Scaffold(
      body : Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/dance_group.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Row(
            children:[ Image.asset(
              'assets/images/logo.png',
              height: 100,
              width: 100,
             ),
            ],
           ),
            const SizedBox(height: 0),
            Text(
              'NATYALAYA',
              style:  GoogleFonts.dancingScript(
                textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              ),
            ),
          ],
      ),
      ),
      ),
  );
}