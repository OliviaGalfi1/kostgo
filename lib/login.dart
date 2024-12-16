import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kostgo/forgetpasword.dart';
import 'package:kostgo/register.dart';
import 'package:kostgo/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "images/background5.png",
              fit: BoxFit.cover,
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 62,
                      left: 96,
                      right: 96,
                    ),
                    child: Text(
                      "Masuk Akun",
                      style: GoogleFonts.inter(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Center(
                  child: Text(
                    "Isi Email dan Password Anda",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 29),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Masukkan email Anda",
                      hintStyle: GoogleFonts.inter(
                        color: const Color(0xFFC9C9C9),
                        fontSize: 14,
                      ),
                      prefixIcon: Image.asset("images/username.png"),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 20,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Mohon masukkan Email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Email tidak valid';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 29),
                  child: TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Masukkan Password Anda",
                      hintStyle: GoogleFonts.inter(
                        color: const Color(0xFFC9C9C9),
                        fontSize: 14,
                      ),
                      prefixIcon: Image.asset("images/blocked.png"),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 20,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Mohon masukkan Password';
                      }
                      if (value.length < 6) {
                        return 'Password minimal 6 karakter';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.only(left: 42),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResetPasswordScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Lupa Password?",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xFFAEAEAE),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Center(
                  child: _isLoading
                      ? const CircularProgressIndicator()
                      : Container(
                          width: 300,
                          height: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0xFF4C6496),
                          ),
                          child: TextButton(
                            onPressed: () => _handleLogin(context),
                            child: Text(
                              "Masuk",
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                ),
                const SizedBox(height: 12),
                // Tombol Sign In dengan Google
                Center(
                  child: _isLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white, // Warna teks
                            padding: const EdgeInsets.symmetric(
                                horizontal: 60, vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: _signInWithGoogle,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset("images/google_icon.png", width: 24),
                              const SizedBox(width: 10),
                              Text(
                                "Sign In with Google",
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Belum punya akun?",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 6),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Register(),
                          ),
                        );
                      },
                      child: Text(
                        "DAFTAR",
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF8BEFE0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _signInWithGoogle() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Melakukan sign in dengan Google
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // User membatalkan login, keluar
        setState(() {
          _isLoading = false;
        });
        return;
      }

      // Mendapatkan credential dari Google SignIn
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      // Melakukan sign in dengan credential dari Google
      final userCredential = await _auth.signInWithCredential(credential);

      if (userCredential.user != null) {
        // Arahkan ke halaman HomeScreen setelah login berhasil
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: e.message ?? 'Terjadi kesalahan',
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _handleLogin(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      if (userCredential.user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'user-not-found') {
        message = 'Akun tidak ditemukan. Silakan daftar terlebih dahulu.';
      } else if (e.code == 'wrong-password') {
        message = 'Password salah. Silakan coba lagi.';
      } else {
        message = 'Terjadi kesalahan. Silakan coba lagi.';
      }

      Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
