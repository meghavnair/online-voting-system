
import 'package:flutter/material.dart';
// import 'main.dart'; // Import the main.dart file for navigation

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  final TextEditingController _passwordController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.orange.shade900,
              Colors.orange.shade800,
              Colors.orange.shade400,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 80),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Replace FadeInUp with your animation widget
                  /*FadeInUp(
                    duration: Duration(milliseconds: 1000),
                    child: */
                    Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  //),
                  SizedBox(height: 10),
                  // Replace FadeInUp with your animation widget
                  /*FadeInUp(
                    duration: Duration(milliseconds: 1300),
                    child: */
                    Text(
                      "Welcome",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  //),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // Replace FadeInUp with your animation widget
                        /*FadeInUp(
                          duration: Duration(milliseconds: 1400),
                          child: */
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, .3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Form(
                              key: _formKey, // Assign the form key
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Enter your name",
                                      filled: false, // Remove white background
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20.0), // Curved corners
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value?.isEmpty ?? true) {
                                        return 'Please enter your name';
                                      }
                                      return null;
                                    },
                                    onChanged: (_) => _validateForm(),
                                  ),
                                  const SizedBox(height: 20),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Enter your voter id",
                                      filled: false, // Remove white background
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20.0), // Curved corners
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value?.isEmpty ?? true) {
                                        return 'Please enter your voter ID';
                                      }
                                      return null;
                                    },
                                    onChanged: (_) => _validateForm(),
                                  ),
                                  const SizedBox(height: 20),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Enter your phone number",
                                      filled: false, // Remove white background
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20.0), // Curved corners
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value?.isEmpty ?? true) {
                                        return 'Please enter your phone number';
                                      }
                                      return null;
                                    },
                                    onChanged: (_) => _validateForm(),
                                  ),
                                  const SizedBox(height: 20),
                                  TextFormField(
                                    controller: _passwordController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      labelText: "Enter your password",
                                      filled: false, // Remove white background
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20.0), // Curved corners
                                      ),
                                    ),
                                    onChanged: (value) {
                                      // Password validation conditions
                                      bool hasUpperCase = value.contains(RegExp(r'[A-Z]'));
                                      bool hasSymbol = value.contains(RegExp(r'[$&+,:;=?@#|<>.^*()%!-]'));
                                      bool hasMinLength = value.length >= 8;

                                      setState(() {
                                        _isButtonEnabled = hasUpperCase && hasSymbol && hasMinLength;
                                      });

                                      _validateForm();
                                    },
                                    validator: (value) {
                                      if (value?.isEmpty ?? true) {
                                        return 'Please enter your password';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      labelText: "Confirm your password",
                                      filled: false, // Remove white background
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20.0), // Curved corners
                                      ),
                                    ),
                                    onChanged: (_) => _validateForm(),
                                    validator: (value) {
                                      if (value?.isEmpty ?? true) {
                                        return 'Please confirm your password';
                                      }
                                      if (value != _passwordController.text) {
                                        return 'Passwords do not match';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 30),
                                  ElevatedButton(
                                    onPressed: _isButtonEnabled ? () => _signup() : null,
                                    child: const Text('Sign Up'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        //),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _validateForm() {
    setState(() {
      _isButtonEnabled = _formKey.currentState?.validate() ?? false;
    });
  }

  void _signup() {
    // Perform signup logic here
    Navigator.pop(context);
  }
}