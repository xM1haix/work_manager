import "dart:async";

import "package:flutter/material.dart";
import "package:work_manager_flutter/main.dart";
import "package:work_manager_flutter/nav.dart";
import "package:work_manager_flutter/popup.dart";
import "package:work_manager_flutter/tasks_list.dart";

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _email = TextEditingController();
  final _pass = TextEditingController();
  var _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _email,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _pass,
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelText: "Password",
                suffixIcon: IconButton(
                  onPressed: () => setState(() => _obscureText = !_obscureText),
                  icon: Icon(
                    Icons.remove_red_eye_outlined,
                    color: _obscureText ? Colors.grey : Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _login() async {
    try {
      final x =
          await client.modules.auth.email.authenticate(_email.text, _pass.text);
      if (!x.success) {
        throw Exception(x.failReason ?? "Unkwon error");
      }
      await sessionManager.registerSignedInUser(
        x.userInfo!,
        x.keyId!,
        x.key!,
      );
      if (!mounted) {
        return;
      }
      await nav(context, const TasksList(), true);
    } catch (e) {
      if (!mounted) {
        return;
      }
      unawaited(errorPopup(context, e));
    }
  }
}
