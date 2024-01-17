import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SVAPage extends StatefulWidget {
  const SVAPage({super.key});

  @override
  State<SVAPage> createState() => _SVAPageState();
}

class _SVAPageState extends State<SVAPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            // onPressed: () => Navigator.of(context).pop(),
            onPressed: () {},
          ),
          centerTitle: true,
          title: Text(
            'Tanya AITA!',
            style: GoogleFonts.inter(
              fontSize: 16.0,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.history, color: Colors.black),
              // onPressed: () => Navigator.of(context).pop(),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 48.0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage('assets/images/mascot.png'),
                      width: 250,
                    ),
                    const SizedBox(height: 32.0),
                    Text(
                      'Aita bisa bantu\n apa nih?',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        height: 1.3,
                        color: const Color(0xFFFC37A3),
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '''Sampaikan pertanyaan atau
                      \nkeresahanmu dan Aita bakal bantu jawab
                      \nbuat kamu!''',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        height: 0.7,
                        color: const Color(0xFF8391A1),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color(0xFFE7E7E7),
                  hintText: 'Tanyakan Aita...',
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF8E8E8E),
                  ),
                  prefixIcon: InkWell(
                    onTap: () {},
                    child: const Icon(Icons.image),
                  ),
                  suffixIcon: InkWell(
                    onTap: () {},
                    child: const Icon(Icons.mic_outlined),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
