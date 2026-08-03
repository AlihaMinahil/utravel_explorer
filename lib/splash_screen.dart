import 'dart:async';

import 'package:flutter/material.dart';
import 'home_screen.dart'; // HomeScreen import karo

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [

            // Background
            Image.asset(
              "assets/images/splesh.png",
              fit: BoxFit.cover,
            ),

            // Light Overlay
            Container(
              color: Colors.white.withOpacity(0.08),
            ),

            // Content
            SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Image.asset(
                      "assets/images/plane_PNG101219.png",
                      width: 90,
                      height: 90,
                      fit: BoxFit.contain,
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "Travel Explorer",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1F3C88),
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Discover. Explore. Travel.",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                    ),

                    const SizedBox(height: 60),

                    const CircularProgressIndicator(
                      color: Color(0xff2F80ED),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}