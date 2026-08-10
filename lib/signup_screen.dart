import 'package:flutter/material.dart';
import 'package:utravel_explorer/login_screen.dart';
import 'package:utravel_explorer/home_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // ============================================================
  // CONTROLLERS
  // ============================================================

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController =
  TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();

  // ============================================================
  // PASSWORD VISIBILITY
  // ============================================================

  bool hidePassword = true;
  bool hideConfirmPassword = true;

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  // ============================================================
  // GO TO LOGIN
  // ============================================================

  void goToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  // ============================================================
  // SIGN UP
  // ============================================================

  void signup() {
    // Check empty fields
    if (nameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please fill all fields",
            style: TextStyle(fontSize: 14),
          ),
        ),
      );
      return;
    }

    // Check password
    if (passwordController.text !=
        confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Passwords do not match",
            style: TextStyle(fontSize: 14),
          ),
        ),
      );
      return;
    }

    // Account created -> Home
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

                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),

                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      // ==================================================
                      // BACK BUTTON
                      // ==================================================

                      SizedBox(
                        height: 42,
                        width: 42,

                        child: Material(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.circular(12),

                          child: InkWell(
                            borderRadius:
                            BorderRadius.circular(12),

                            onTap: goToLogin,

                            child: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 19,
                              color: Color(0xff10213D),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 26),

                      // ==================================================
                      // TITLE
                      // ==================================================

                      const Text(
                        "Create Account",

                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: Color(0xff10213D),
                          letterSpacing: -0.5,
                        ),
                      ),

                      const SizedBox(height: 7),

                      const Text(
                        "Join us and start exploring amazing destinations!",

                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff697589),
                        ),
                      ),

                      const SizedBox(height: 28),

                      // ==================================================
                      // FULL NAME
                      // ==================================================

                      const Text(
                        "Full Name",

                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff26354D),
                        ),
                      ),

                      const SizedBox(height: 8),

                      _inputField(
                        controller: nameController,
                        hintText: "Enter your full name",
                        icon: Icons.person_outline_rounded,
                      ),

                      const SizedBox(height: 17),

                      // ==================================================
                      // EMAIL
                      // ==================================================

                      const Text(
                        "Email Address",

                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff26354D),
                        ),
                      ),

                      const SizedBox(height: 8),

                      _inputField(
                        controller: emailController,
                        hintText: "Enter your email",
                        icon: Icons.email_outlined,
                        keyboardType:
                        TextInputType.emailAddress,
                      ),

                      const SizedBox(height: 17),

                      // ==================================================
                      // PASSWORD
                      // ==================================================

                      const Text(
                        "Password",

                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff26354D),
                        ),
                      ),

                      const SizedBox(height: 8),

                      _passwordField(
                        controller: passwordController,
                        hintText: "Create a password",
                        hidePassword: hidePassword,
                        onEyePressed: () {
                          setState(() {
                            hidePassword =
                            !hidePassword;
                          });
                        },
                      ),

                      const SizedBox(height: 17),

                      // ==================================================
                      // CONFIRM PASSWORD
                      // ==================================================

                      const Text(
                        "Confirm Password",

                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff26354D),
                        ),
                      ),

                      const SizedBox(height: 8),

                      _passwordField(
                        controller:
                        confirmPasswordController,
                        hintText: "Confirm your password",
                        hidePassword:
                        hideConfirmPassword,
                        onEyePressed: () {
                          setState(() {
                            hideConfirmPassword =
                            !hideConfirmPassword;
                          });
                        },
                      ),

                      const SizedBox(height: 25),

                      // ==================================================
                      // SIGN UP BUTTON
                      // ==================================================

                      SizedBox(
                        width: double.infinity,
                        height: 52,

                        child: ElevatedButton(
                          onPressed: signup,

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
                              BorderRadius.circular(12),
                            ),
                          ),

                          child: const Text(
                            "Create Account",

                            style: TextStyle(
                              fontSize: 15,
                              fontWeight:
                              FontWeight.w700,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      // ==================================================
                      // DIVIDER
                      // ==================================================

                      Row(
                        children: [

                          const Expanded(
                            child: Divider(
                              color: Color(0xffDDE3EB),
                              thickness: 1,
                            ),
                          ),

                          Padding(
                            padding:
                            const EdgeInsets.symmetric(
                              horizontal: 14,
                            ),

                            child: Text(
                              "or continue with",

                              style: TextStyle(
                                fontSize: 12,
                                fontWeight:
                                FontWeight.w500,
                                color:
                                Colors.grey.shade600,
                              ),
                            ),
                          ),

                          const Expanded(
                            child: Divider(
                              color: Color(0xffDDE3EB),
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // ==================================================
                      // SOCIAL BUTTONS
                      // ==================================================

                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,

                        children: [

                          _socialButton(
                            child: const Text(
                              "G",
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight:
                                FontWeight.w700,
                                color: Colors.red,
                              ),
                            ),
                          ),

                          const SizedBox(width: 18),

                          _socialButton(
                            child: const Icon(
                              Icons.apple,
                              size: 22,
                              color: Colors.black,
                            ),
                          ),

                          const SizedBox(width: 18),

                          _socialButton(
                            child: const Icon(
                              Icons.facebook,
                              size: 22,
                              color:
                              Color(0xff1877F2),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 25),

                      // ==================================================
                      // LOGIN
                      // ==================================================

                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.center,

                        children: [

                          const Text(
                            "Already have an account? ",

                            style: TextStyle(
                              fontSize: 13,
                              color:
                              Color(0xff697589),
                            ),
                          ),

                          GestureDetector(
                            onTap: goToLogin,

                            child: const Text(
                              "Login",

                              style: TextStyle(
                                fontSize: 13,
                                fontWeight:
                                FontWeight.w700,
                                color:
                                Color(0xff075BE8),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
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

  Widget _passwordField({
    required TextEditingController controller,
    required String hintText,
    required bool hidePassword,
    required VoidCallback onEyePressed,
  }) {
    return SizedBox(
      height: 52,

      child: TextField(
        controller: controller,

        obscureText: hidePassword,

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

          prefixIcon: const Icon(
            Icons.lock_outline_rounded,
            size: 20,
            color: Color(0xff536176),
          ),

          suffixIcon: IconButton(
            onPressed: onEyePressed,

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
              color: const Color(0xffDCE3EA),
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