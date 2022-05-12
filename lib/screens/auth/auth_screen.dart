import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 540,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'assets/splash_background.png',
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/search_icon.png',
                      scale: 2,
                    ),
                    const SizedBox(width: 10),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'SearcHack',
                        style: TextStyle(fontSize: 46),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Войти',
                    style: TextStyle(
                      color: Colors.purple,
                    ),
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    elevation: MaterialStateProperty.all(0),
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Регистрация',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
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
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
