import 'package:aitakata_app/models/auth.dart';
import 'package:aitakata_app/services/auth.dart';
import 'package:aitakata_app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _passwordIsHidden = true;
  bool _confirmPasswordIsHidden = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void _togglePasswordView() {
    setState(() {
      _passwordIsHidden = !_passwordIsHidden;
    });
  }

  void _toggleConfirmPasswordView() {
    setState(() {
      _confirmPasswordIsHidden = !_confirmPasswordIsHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFEFEFE),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Yuk!',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              // email textfield
              Text(
                'Aita sudah',
                style: GoogleFonts.inter(
                  fontSize: 40,
                ),
              ),
              Text(
                'menunggumu',
                style: GoogleFonts.inter(
                  fontSize: 40,
                ),
              ),

              const SizedBox(height: 16.0),

              // email textfield
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: GoogleFonts.inter(
                    fontSize: 14,
                    color: const Color(0xFF8E8E8E),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Color(0xFF8E8E8E),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Color(0xFF8E8E8E),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16.0),

              // password textfield
              TextField(
                controller: _passwordController,
                obscureText: _passwordIsHidden,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: GoogleFonts.inter(
                    fontSize: 14,
                    color: const Color(0xFF8E8E8E),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Color(0xFF8E8E8E),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Color(0xFF8E8E8E),
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: _togglePasswordView,
                    icon: _passwordIsHidden
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ),
                ),
              ),

              const SizedBox(height: 16.0),

              // confirm password textfield
              TextField(
                controller: _confirmPasswordController,
                obscureText: _confirmPasswordIsHidden,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: GoogleFonts.inter(
                    fontSize: 14,
                    color: const Color(0xFF8E8E8E),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Color(0xFF8E8E8E),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Color(0xFF8E8E8E),
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: _toggleConfirmPasswordView,
                    icon: _confirmPasswordIsHidden
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ),
                ),
              ),

              const SizedBox(height: 16.0),

              // sign up button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    SignInSignUpResult result = await Auth.createUser(
                      email: _emailController.text,
                      pass: _passwordController.text,
                    );
                    if(context.mounted){
                      if (result.user != null) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Error'),
                            content: Text(result.message!),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF15CDC3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  child: const Text('Sign Up'),
                ),
              ),

              const SizedBox(height: 16.0),

              // sign in text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sudah punya akun?',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: const Color(0xFF8E8E8E),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Masuk',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: const Color(0xFF15CDC3),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}