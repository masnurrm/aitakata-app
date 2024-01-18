import 'package:aitakata_app/models/auth.dart';
import 'package:aitakata_app/services/auth.dart';
import 'package:aitakata_app/pages/activity_page.dart';
import 'package:aitakata_app/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isHidden = true;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
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
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: const Color(0xFFDADADA),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  color: const Color(0xFFF7F8F9),
                ),
                child: TextFormField(
                  controller: _emailController,
                  style: const TextStyle(fontSize: 14),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 16.0,
                    ),
                    hintText: 'Masukkan Email',
                    hintStyle: TextStyle(
                      color: Color(0xFF8391A1),
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                    // filled: true,
                    // fillColor: Color(0xF7F8F9FF),
                  ),
                ),
              ),

              const SizedBox(height: 12.0),

              // password textfield
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: const Color(0xFFDADADA),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  color: const Color(0xFFF7F8F9),
                ),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: _isHidden,
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 16.0,
                    ),
                    hintText: 'Masukkan Kata Sandi',
                    hintStyle: const TextStyle(
                      color: Color(0xFF8391A1),
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                    suffixIcon: InkWell(
                      onTap: _togglePasswordView,
                      child: const Icon(Icons.visibility),
                    ),
                    // suffix: InkWell(
                    //   onTap: _togglePasswordView,
                    //   child: const Icon(Icons.visibility),
                    // ),
                  ),
                ),
              ),

              const SizedBox(height: 8.0),

              // text: lupa password
              Container(
                alignment: Alignment.centerRight,
                child: const Text(
                  'Lupa kata sandi?',
                  style: TextStyle(
                    color: Color(0xFF6A707C),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              const SizedBox(height: 48.0),

              // button: masuk
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () async{
                        SignInSignUpResult result = await Auth.signInWithEmail(email: _emailController.text, pass: _passwordController.text);
                        if(context.mounted){
                          if(result.user != null){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const ActivityPage()));
                          } else {
                            showDialog(context: context, builder: (context) => AlertDialog(
                              title: const Text("Error"),
                              content: Text(result.message!),
                              actions: [
                                TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK"))
                              ],
                            ));
                          }
                        }
                      },
                      style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        backgroundColor: MaterialStatePropertyAll(
                          Color(0xFFFD5FB5),
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Masuk',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30.0),

              // hr line
              const Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: Color(0xFFE8ECF4),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Text(
                    "atau masuk dengan",
                    style: TextStyle(
                      color: Color(0xFF6A707C),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Expanded(
                      child: Divider(
                    color: Color(0xFFE8ECF4),
                  )),
                ],
              ),

              const SizedBox(height: 30.0),

              //sign up
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
                      },
                      style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        backgroundColor: MaterialStatePropertyAll(
                          Colors.transparent,
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            side: BorderSide(
                              color: Color(0xFFDADADA),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Daftar',
                        style: TextStyle(
                          color: Color(0xFF6A707C),
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // button: masuk google
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        backgroundColor: MaterialStatePropertyAll(
                          Colors.transparent,
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            side: BorderSide(
                              color: Color(0xFFDADADA),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                      child: const Image(
                        image: AssetImage('assets/images/google.png'),
                        // width: double.infinity,
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
