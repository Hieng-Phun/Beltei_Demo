import 'package:flutter/material.dart';
import 'package:homeword/routes/app_routes.dart';
import 'package:homeword/widgets/logo.dart';
import 'package:homeword/widgets/social.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _keyForm = GlobalKey<FormState>();
  bool _isObscure = true;
  bool _isEmailValid = false;
  bool _isFullName = false;
  bool _isUserName = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView(
          children: [
            Expanded(
              child: Form(
                key: _keyForm,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Logo(),
                    SizedBox(height: 50),
                    TextFormField(
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          setState(() {
                            _isFullName = true;
                          });
                        } else {
                          setState(() {
                            _isFullName = false;
                          });
                        }
                      },
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? "Please enter your Full Name"
                                  : null,
                      decoration: InputDecoration(
                        labelText: "Full Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: Icon(Icons.email, color: Colors.grey),
                        suffixIcon:
                            _isFullName
                                ? Icon(Icons.check_circle, color: Colors.green)
                                : Icon(Icons.check_circle, color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          setState(() {
                            _isUserName = true;
                          });
                        } else {
                          setState(() {
                            _isUserName = false;
                          });
                        }
                      },
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? "Please enter your username"
                                  : null,
                      decoration: InputDecoration(
                        labelText: "Username",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: Icon(Icons.email, color: Colors.grey),
                        suffixIcon:
                            _isUserName
                                ? Icon(Icons.check_circle, color: Colors.green)
                                : Icon(Icons.check_circle, color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      onChanged: (value) {
                        if (value.contains("@")) {
                          setState(() {
                            _isEmailValid = true;
                          });
                        } else {
                          setState(() {
                            _isEmailValid = false;
                          });
                        }
                      },
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? "Please enter your email"
                                  : null,
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: Icon(Icons.email, color: Colors.grey),
                        suffixIcon:
                            _isEmailValid
                                ? Icon(Icons.check_circle, color: Colors.green)
                                : Icon(Icons.check_circle, color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your password";
                        }
                        if (value.length < 6) {
                          return "Password must be at least 6 characters";
                        }
                        return null;
                      },
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: Icon(Icons.lock, color: Colors.grey),
                        suffixIcon:
                            _isObscure
                                ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                )
                                : IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isObscure = true;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.visibility,
                                    color: Colors.grey,
                                  ),
                                ),
                      ),
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.sizeOf(context).width,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_keyForm.currentState?.validate() ?? false) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Logging In...")),
                            );
                            AppRoutes.key.currentState?.pushReplacementNamed(
                              AppRoutes.mainScreen,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: Text(
                          "Register",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Social(),
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        AppRoutes.key.currentState?.pushNamed(
                          AppRoutes.loginScreen,
                        );
                      },
                      child: Text(
                        "Have an account already? Login",
                        style: TextStyle(color: Colors.red),
                      ),
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
