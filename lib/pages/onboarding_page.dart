import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color.fromRGBO(253, 95, 182, 1),
      ),
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(253, 95, 182, 1),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 0,
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 96),
                      child: const Image(
                        image: AssetImage('assets/images/logo.png'),
                        width: double.infinity,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Aitakata',
                      style:
                          GoogleFonts.chewy(fontSize: 64, color: Colors.white),
                    ),
                  ],
                ),
                const Text(
                  '© 2024 AITAKATA oleh Fafi Maqmur',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
