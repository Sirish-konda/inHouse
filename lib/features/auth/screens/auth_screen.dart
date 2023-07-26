import 'package:flutter/material.dart';
import 'package:fyp/common/custom_button.dart';
import 'package:fyp/common/custom_textfield.dart';
import 'package:fyp/services/auth_services.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _signupFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final AuthService authService = AuthService();

  Auth _auth = Auth.signin;

  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
    );
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 50,
              color: Colors.grey,
              child: const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            ListTile(
              tileColor: _auth == Auth.signup ? Colors.green : Colors.grey,
              title: const Text('Create Account'),
              leading: Radio(
                  activeColor: Colors.yellow,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? value) {
                    setState(() {
                      _auth = value!;
                    });
                  }),
            ),
            if (_auth == Auth.signup)
              Container(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _signupFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        labelText: "Email",
                        controller: _emailController,
                        hintText: 'Email',
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        labelText: "Name",
                        controller: _nameController,
                        hintText: 'Name',
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        labelText: "Password",
                        controller: _passwordController,
                        hintText: 'Password',
                      ),
                      const SizedBox(height: 10),
                      CustomButton(
                        text: 'Sign up',
                        onTap: () {
                          if (_signupFormKey.currentState!.validate()) {
                            signUpUser();
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ListTile(
              tileColor: _auth == Auth.signin ? Colors.green : Colors.grey,
              title: const Text('Sign in'),
              leading: Radio(
                activeColor: Colors.yellow,
                value: Auth.signin,
                groupValue: _auth,
                onChanged: (Auth? value) {
                  setState(() {
                    _auth = value!;
                  });
                },
              ),
            ),
            if (_auth == Auth.signin)
              Container(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _signInFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        labelText: "Email",
                        controller: _emailController,
                        hintText: 'Email',
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        labelText: "Password",
                        controller: _passwordController,
                        hintText: 'Password',
                      ),
                      const SizedBox(height: 10),
                      CustomButton(
                        text: 'Sign In',
                        onTap: () {
                          if (_signInFormKey.currentState!.validate()) {
                            signInUser();
                          }
                        },
                      )
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
