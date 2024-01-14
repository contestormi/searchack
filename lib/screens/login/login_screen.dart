import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchack/screens/main/main_screen.dart';
import 'package:searchack/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool visibility = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Войти',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2.0),
                ),
                labelText: "Введите почту",
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              obscureText: visibility,
              controller: passwordController,
              decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        visibility = !visibility;
                      });
                    },
                    child: visibility
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  labelText: 'Введите пароль'),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 320,
              height: 40,
              child: ElevatedButton(
                key: const ValueKey('Login Login Button'),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: const BorderSide(color: Colors.purple),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.purple),
                  elevation: MaterialStateProperty.all(0),
                ),
                onPressed: () async {
                  var _result =
                      await context.read<AuthenticationService>().signIn(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                  _result
                      ? Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainScreen()),
                          (_) => false)
                      : null;
                },
                child: const Text("Войти"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
