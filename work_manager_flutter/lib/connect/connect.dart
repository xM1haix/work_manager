import "package:flutter/material.dart";
import "package:work_manager_flutter/connect/login.dart";
import "package:work_manager_flutter/connect/register.dart";

class Connect extends StatefulWidget {
  const Connect({super.key});

  @override
  State<Connect> createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
  var _isLogin = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 500,
          constraints: const BoxConstraints(maxHeight: 500),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF121212),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.orange,
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
                  if (_isLogin)
                    const Login()
                  else
                    Register(() => setState(() => _isLogin = true)),
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
