import 'package:flutter/material.dart';
import 'package:utravel_explorer/login_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState
    extends State<ForgotPasswordScreen> {
  final TextEditingController emailController =
  TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  // Go to Login Screen
  void goToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  // Send Reset Link
  void sendResetLink() {
    if (emailController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter your email address"),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Password reset link sent!"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F9FC),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),

            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                // =================================================
                // BACK BUTTON
                // =================================================

                const SizedBox(height: 8),

                IconButton(
                  onPressed: goToLogin,
                  padding: EdgeInsets.zero,
                  constraints:
                  const BoxConstraints(),

                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                    color: Color(0xff26354D),
                  ),
                ),

                // =================================================
                // TITLE
                // =================================================

                const SizedBox(height: 25),

                const Text(
                  "Forgot Password?",

                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff10213D),
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Don't worry! It happens. Enter your\n"
                      "email and we'll send you a reset link.",

                  style: TextStyle(
                    fontSize: 11,
                    height: 1.5,
                    color: Color(0xff536176),
                  ),
                ),

                // =================================================
                // EMAIL FIELD
                // =================================================

                const SizedBox(height: 25),

                SizedBox(
                  height: 48,

                  child: TextField(
                    controller: emailController,

                    keyboardType:
                    TextInputType.emailAddress,

                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xff172842),
                    ),

                    decoration: InputDecoration(
                      hintText: "Email address",

                      hintStyle: const TextStyle(
                        fontSize: 11,
                        color: Color(0xff697589),
                      ),

                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        size: 18,
                        color: Color(0xff536176),
                      ),

                      filled: true,
                      fillColor: Colors.white,

                      contentPadding:
                      const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),

                      enabledBorder:
                      OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(8),

                        borderSide:
                        const BorderSide(
                          color: Color(0xffDCE3EA),
                        ),
                      ),

                      focusedBorder:
                      OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(8),

                        borderSide:
                        const BorderSide(
                          color: Color(0xff075BE8),
                        ),
                      ),
                    ),
                  ),
                ),

                // =================================================
                // SEND RESET LINK
                // =================================================

                const SizedBox(height: 15),

                SizedBox(
                  width: double.infinity,
                  height: 48,

                  child: ElevatedButton(
                    onPressed: sendResetLink,

                    style:
                    ElevatedButton.styleFrom(
                      backgroundColor:
                      const Color(0xff075BE8),

                      foregroundColor:
                      Colors.white,

                      elevation: 0,

                      shape:
                      RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(8),
                      ),
                    ),

                    child: const Text(
                      "Send Reset Link",

                      style: TextStyle(
                        fontSize: 12,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // =================================================
                // ILLUSTRATION
                // =================================================

                const SizedBox(height: 35),

                Center(
                  child: Image.asset(
                    "assets/images/forgot_password.png",

                    width: 230,
                    height: 190,

                    fit: BoxFit.contain,

                    errorBuilder:
                        (context, error, stackTrace) {
                      return const SizedBox(
                        width: 230,
                        height: 190,

                        child: Icon(
                          Icons
                              .mark_email_unread_outlined,
                          size: 100,
                          color: Color(0xff075BE8),
                        ),
                      );
                    },
                  ),
                ),

                // =================================================
                // BACK TO LOGIN
                // =================================================

                const SizedBox(height: 15),

                Center(
                  child: GestureDetector(
                    onTap: goToLogin,

                    child: const Text(
                      "Back to Login",

                      style: TextStyle(
                        fontSize: 11,
                        fontWeight:
                        FontWeight.bold,
                        color: Color(0xff075BE8),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 35),
              ],
            ),
          ),
        ),
      ),
    );
  }
}