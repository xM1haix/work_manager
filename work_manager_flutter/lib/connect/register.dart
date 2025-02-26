import 'package:flutter/material.dart';
import 'package:work_manager_flutter/main.dart';

import '../nav.dart';
import '../popup.dart';

class Register extends StatefulWidget {
  final void Function() goBack;
  const Register(this.goBack, {super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _obscureText = true;
  final _email = TextEditingController(),
      _username = TextEditingController(),
      _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _email,
          decoration: const InputDecoration(labelText: 'Email'),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: _username,
          decoration: const InputDecoration(labelText: 'Username'),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: _password,
          obscureText: _obscureText,
          decoration: InputDecoration(
            labelText: 'Password',
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
          onPressed: () async {
            try {
              final x = await client.modules.auth.email.createAccountRequest(
                  _username.text, _email.text, _password.text);
              if (!x) throw "Failed x is $x";
              if (!context.mounted) return;
              final code = await showDialog<String?>(
                context: context,
                builder: (context) {
                  final code = TextEditingController();
                  return AlertDialog(
                    title: const Text("Insert the code from email"),
                    content: SizedBox(
                      width: 100,
                      child: TextField(
                        controller: code,
                        decoration: const InputDecoration(labelText: 'Code'),
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => back(context, code.text),
                        child: const Text('Send'),
                      ),
                    ],
                  );
                },
              );
              if (code == null) throw 'No code provided';
              final sendCode = await client.modules.auth.email
                  .createAccount(_email.text, code);
              print(sendCode);
            } catch (e) {
              if (!context.mounted) return;
              errorPopup(context, e);
            }
          },
          child: const Text('Register'),
        ),
      ],
    );
  }
}
