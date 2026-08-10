import 'package:flutter/material.dart';
import 'package:utravel_explorer/signup_screen.dart';
import 'package:utravel_explorer/forgot_password_screen.dart';
import 'package:utravel_explorer/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // ============================================================
  // CONTROLLERS
  // ============================================================

  final TextEditingController emailController =
  TextEditingController();

  final TextEditingController passwordController =
  TextEditingController();

  // ============================================================
  // PASSWORD VISIBILITY
  // ============================================================

  bool hidePassword = true;

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // ============================================================
  // FORGOT PASSWORD
  // ============================================================

  void openForgotPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
        const ForgotPasswordScreen(),
      ),
    );
  }

  // ============================================================
  // SIGN UP
  // ============================================================

  void openSignup() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
        const SignupScreen(),
      ),
    );
  }

  // ============================================================
  // LOGIN
  // ============================================================

  void login() {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please enter email and password",
            style: TextStyle(fontSize: 14),
          ),
        ),
      );

      return;
    }

    // Login successful
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F9FC),

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              keyboardDismissBehavior:
              ScrollViewKeyboardDismissBehavior.onDrag,

              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),

                child: Column(
                  children: [

                    // ==================================================
                    // TOP BACKGROUND AREA
                    // ==================================================

                    SizedBox(
                      height: 205,

                      child: Stack(
                        fit: StackFit.expand,

                        children: [

                          // ==================================================
                          // BACKGROUND IMAGE
                          // ==================================================

                          Image.asset(
                            "assets/images/login_background.png",

                            fit: BoxFit.cover,

                            errorBuilder:
                                (context, error, stackTrace) {
                              return Container(
                                decoration:
                                const BoxDecoration(
                                  gradient:
                                  LinearGradient(
                                    begin:
                                    Alignment.topCenter,
                                    end:
                                    Alignment.bottomCenter,
                                    colors: [
                                      Color(0xffBFE3FA),
                                      Color(0xffEAF6FF),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),

                          // ==================================================
                          // LIGHT OVERLAY
                          // ==================================================

                          Container(
                            color: Colors.white
                                .withOpacity(0.12),
                          ),

                          // ==================================================
                          // TOP CONTENT
                          // ==================================================

                          Padding(
                            padding:
                            const EdgeInsets.symmetric(
                              horizontal: 24,
                            ),

                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,

                              children: [

                                const SizedBox(
                                  height: 20,
                                ),

                                // ==================================================
                                // BALLOON
                                // ==================================================

                                const Align(
                                  alignment:
                                  Alignment.topRight,

                                  child: Text(
                                    "🎈",
                                    style: TextStyle(
                                      fontSize: 32,
                                    ),
                                  ),
                                ),

                                const SizedBox(
                                  height: 2,
                                ),

                                // ==================================================
                                // WELCOME
                                // ==================================================

                                const Text(
                                  "Welcome Back!",

                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight:
                                    FontWeight.w800,
                                    color:
                                    Color(0xff10213D),
                                    letterSpacing: -0.5,
                                  ),
                                ),

                                const SizedBox(
                                  height: 6,
                                ),

                                const Text(
                                  "Login to continue your journey",

                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight:
                                    FontWeight.w400,
                                    color:
                                    Color(0xff26354D),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // ==================================================
                    // LOGIN CARD
                    // ==================================================

                    Transform.translate(
                      offset: const Offset(0, -25),

                      child: Container(
                        width: double.infinity,

                        margin:
                        const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),

                        padding:
                        const EdgeInsets.fromLTRB(
                          20,
                          24,
                          20,
                          22,
                        ),

                        decoration:
                        BoxDecoration(
                          color: Colors.white,

                          borderRadius:
                          BorderRadius.circular(18),

                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.10),

                              blurRadius: 20,

                              offset:
                              const Offset(0, 8),
                            ),
                          ],
                        ),

                        child: Column(
                          children: [

                            // ==================================================
                            // EMAIL LABEL
                            // ==================================================

                            const Align(
                              alignment:
                              Alignment.centerLeft,

                              child: Text(
                                "Email Address",

                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight:
                                  FontWeight.w600,
                                  color:
                                  Color(0xff26354D),
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 8,
                            ),

                            // ==================================================
                            // EMAIL
                            // ==================================================

                            _inputField(
                              controller:
                              emailController,

                              hintText:
                              "Enter your email",

                              icon:
                              Icons.email_outlined,

                              keyboardType:
                              TextInputType
                                  .emailAddress,
                            ),

                            const SizedBox(
                              height: 18,
                            ),

                            // ==================================================
                            // PASSWORD LABEL
                            // ==================================================

                            const Align(
                              alignment:
                              Alignment.centerLeft,

                              child: Text(
                                "Password",

                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight:
                                  FontWeight.w600,
                                  color:
                                  Color(0xff26354D),
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 8,
                            ),

                            // ==================================================
                            // PASSWORD
                            // ==================================================

                            _passwordField(),

                            const SizedBox(
                              height: 10,
                            ),

                            // ==================================================
                            // FORGOT PASSWORD
                            // ==================================================

                            Align(
                              alignment:
                              Alignment.centerRight,

                              child: GestureDetector(
                                onTap:
                                openForgotPassword,

                                child: const Text(
                                  "Forgot Password?",

                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight:
                                    FontWeight.w700,
                                    color:
                                    Color(0xff075BE8),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 22,
                            ),

                            // ==================================================
                            // LOGIN BUTTON
                            // ==================================================

                            SizedBox(
                              width:
                              double.infinity,

                              height: 52,

                              child:
                              ElevatedButton(
                                onPressed: login,

                                style:
                                ElevatedButton
                                    .styleFrom(
                                  backgroundColor:
                                  const Color(
                                    0xff075BE8,
                                  ),

                                  foregroundColor:
                                  Colors.white,

                                  elevation: 0,

                                  shape:
                                  RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius
                                        .circular(
                                      12,
                                    ),
                                  ),
                                ),

                                child: const Text(
                                  "Login",

                                  style:
                                  TextStyle(
                                    fontSize: 15,
                                    fontWeight:
                                    FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 25,
                            ),

                            // ==================================================
                            // OR CONTINUE WITH
                            // ==================================================

                            Row(
                              children: [

                                const Expanded(
                                  child: Divider(
                                    color:
                                    Color(
                                      0xffDDE3EB,
                                    ),
                                    thickness: 1,
                                  ),
                                ),

                                Padding(
                                  padding:
                                  const EdgeInsets
                                      .symmetric(
                                    horizontal: 14,
                                  ),

                                  child: Text(
                                    "or continue with",

                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight:
                                      FontWeight.w500,
                                      color:
                                      Colors.grey
                                          .shade600,
                                    ),
                                  ),
                                ),

                                const Expanded(
                                  child: Divider(
                                    color:
                                    Color(
                                      0xffDDE3EB,
                                    ),
                                    thickness: 1,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(
                              height: 20,
                            ),

                            // ==================================================
                            // SOCIAL LOGIN
                            // ==================================================

                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .center,

                              children: [

                                // Google
                                _socialButton(
                                  child:
                                  const Text(
                                    "G",

                                    style:
                                    TextStyle(
                                      fontSize: 20,
                                      fontWeight:
                                      FontWeight
                                          .w700,
                                      color:
                                      Colors.red,
                                    ),
                                  ),
                                ),

                                const SizedBox(
                                  width: 18,
                                ),

                                // Apple
                                _socialButton(
                                  child:
                                  const Icon(
                                    Icons.apple,
                                    size: 23,
                                    color:
                                    Colors.black,
                                  ),
                                ),

                                const SizedBox(
                                  width: 18,
                                ),

                                // Facebook
                                _socialButton(
                                  child:
                                  const Icon(
                                    Icons.facebook,
                                    size: 23,
                                    color:
                                    Color(
                                      0xff1877F2,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(
                              height: 25,
                            ),

                            // ==================================================
                            // SIGN UP
                            // ==================================================

                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .center,

                              children: [

                                const Text(
                                  "Don't have an account? ",

                                  style:
                                  TextStyle(
                                    fontSize: 13,
                                    color:
                                    Color(
                                      0xff697589,
                                    ),
                                  ),
                                ),

                                GestureDetector(
                                  onTap:
                                  openSignup,

                                  child:
                                  const Text(
                                    "Sign Up",

                                    style:
                                    TextStyle(
                                      fontSize: 13,
                                      fontWeight:
                                      FontWeight
                                          .w700,
                                      color:
                                      Color(
                                        0xff075BE8,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    // ==================================================
                    // BOTTOM SPACE
                    // ==================================================

                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // ============================================================
  // NORMAL INPUT FIELD
  // ============================================================

  Widget _inputField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    TextInputType? keyboardType,
  }) {
    return SizedBox(
      height: 52,

      child: TextField(
        controller: controller,

        keyboardType: keyboardType,

        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xff172842),
        ),

        decoration: InputDecoration(
          hintText: hintText,

          hintStyle: const TextStyle(
            fontSize: 14,
            color: Color(0xff8A95A5),
            fontWeight: FontWeight.w400,
          ),

          prefixIcon: Icon(
            icon,
            size: 20,
            color: const Color(0xff536176),
          ),

          filled: true,

          fillColor: Colors.white,

          contentPadding:
          const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 15,
          ),

          enabledBorder:
          OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(11),

            borderSide:
            const BorderSide(
              color: Color(0xffDCE3EA),
              width: 1,
            ),
          ),

          focusedBorder:
          OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(11),

            borderSide:
            const BorderSide(
              color: Color(0xff075BE8),
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // PASSWORD FIELD
  // ============================================================

  Widget _passwordField() {
    return SizedBox(
      height: 52,

      child: TextField(
        controller: passwordController,

        obscureText: hidePassword,

        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xff172842),
        ),

        decoration: InputDecoration(
          hintText: "Enter your password",

          hintStyle: const TextStyle(
            fontSize: 14,
            color: Color(0xff8A95A5),
            fontWeight: FontWeight.w400,
          ),

          prefixIcon: const Icon(
            Icons.lock_outline_rounded,
            size: 20,
            color: Color(0xff536176),
          ),

          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                hidePassword =
                !hidePassword;
              });
            },

            icon: Icon(
              hidePassword
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,

              size: 20,

              color:
              const Color(0xff536176),
            ),
          ),

          filled: true,

          fillColor: Colors.white,

          contentPadding:
          const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 15,
          ),

          enabledBorder:
          OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(11),

            borderSide:
            const BorderSide(
              color: Color(0xffDCE3EA),
              width: 1,
            ),
          ),

          focusedBorder:
          OutlineInputBorder(
            borderRadius:
            BorderRadius.circular(11),

            borderSide:
            const BorderSide(
              color: Color(0xff075BE8),
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // SOCIAL BUTTON
  // ============================================================

  Widget _socialButton({
    required Widget child,
  }) {
    return SizedBox(
      width: 52,
      height: 52,

      child: Material(
        color: Colors.white,

        shape: const CircleBorder(),

        elevation: 1,

        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,

            border: Border.all(
              color:
              const Color(0xffDCE3EA),
              width: 1,
            ),
          ),

          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}