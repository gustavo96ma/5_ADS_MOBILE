import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffe3e7d9),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              Image.network(
                'https://unicv.edu.br/wp-content/uploads/2020/12/cropped-logo-verde-280X100.png',
                width: 200,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Card(
                  color: Color(0xff84996c),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    spacing: 10,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 15,
                          children: [
                            TextButton(
                              style: ButtonStyle(
                                overlayColor: WidgetStatePropertyAll(
                                  Color(0xffe49937),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                'Cadastro',
                                style: TextStyle(color: Color(0xffe3e7d9)),
                              ),
                            ),
                            TextButton(
                              style: ButtonStyle(
                                overlayColor: WidgetStatePropertyAll(
                                  Color(0xffe49937),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                'Login',
                                style: TextStyle(color: Color(0xffe3e7d9)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
