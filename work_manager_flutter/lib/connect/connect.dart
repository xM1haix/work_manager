import 'package:flutter/material.dart';

import 'login.dart';
import 'register.dart';

class Connect extends StatefulWidget {
  const Connect({super.key});

  @override
  State<Connect> createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
  bool _isLogin = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 500,
          constraints: const BoxConstraints(maxHeight: 500),
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: const Color(0xFF121212),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.orange,
              width: 1,
            ),
          ),
          child: SingleChildScrollView(
            child: AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    _isLogin ? "Login" : "Register",
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _isLogin
                      ? const Login()
                      : Register(() => setState(() => _isLogin = true)),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () => setState(() => _isLogin = !_isLogin),
                    child: Text(
                      _isLogin
                          ? "I don't have an account!"
                          : "I already have an account!",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
