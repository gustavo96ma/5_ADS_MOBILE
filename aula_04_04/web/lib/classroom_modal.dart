import 'package:flutter/material.dart';
import 'package:web/repositories/classroom_repository.dart';

class ClassroomModal extends StatefulWidget {
  const ClassroomModal({super.key});

  @override
  State<ClassroomModal> createState() => _ClassroomModalState();
}

class _ClassroomModalState extends State<ClassroomModal> {
  bool projector = false;
  bool television = false;
  bool airConditioning = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ClassroomRepository().fetchAllClassrooms(),
      builder: (context, snapshot) {

        print(snapshot);


        return Dialog(
          alignment: Alignment.centerLeft,
          insetPadding: EdgeInsets.only(left: 100, bottom: 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Container(
            height: 500.0,
            width: 550.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: AlignmentDirectional.centerEnd,
                      child: IconButton(
                        style: ButtonStyle(
                          fixedSize: WidgetStatePropertyAll(Size(16, 16)),
                        ),
                        onPressed: () {
                          print('cliquei');
                        },
                        icon: Icon(Icons.close, size: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        spacing: 20,
                        children: [
                          SizedBox(
                            width: 150,
                            child: TextField(
                              decoration: InputDecoration(
                                label: Text(
                                  'Sala',
                                  style: TextStyle(
                                    color: Color(0xff2b4612),
                                    fontSize: 16,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff2b4612),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff2b4612),
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff2b4612),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: TextField(
                              decoration: InputDecoration(
                                label: Text(
                                  'Capacidade',
                                  style: TextStyle(
                                    color: Color(0xff2b4612),
                                    fontSize: 16,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff2b4612),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff2b4612),
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff2b4612),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: TextField(
                              decoration: InputDecoration(
                                label: Text(
                                  'Computadores',
                                  style: TextStyle(
                                    color: Color(0xff2b4612),
                                    fontSize: 16,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff2b4612),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff2b4612),
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff2b4612),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Projetor',
                                style: TextStyle(
                                  color: Color(0xff2b4612),
                                  fontSize: 16,
                                ),
                              ),
                              Transform.scale(
                                scale: 0.6,
                                child: Switch(
                                  value: projector,
                                  activeColor: Color(0xff2b4612),
                                  onChanged: (bool value) {
                                    setState(() {
                                      projector = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'TV',
                                style: TextStyle(
                                  color: Color(0xff2b4612),
                                  fontSize: 16,
                                ),
                              ),
                              Transform.scale(
                                scale: 0.6,
                                child: Switch(
                                  value: television,
                                  activeColor: Color(0xff2b4612),
                                  onChanged: (bool value) {
                                    setState(() {
                                      television = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Ar condicionado',
                                style: TextStyle(
                                  color: Color(0xff2b4612),
                                  fontSize: 16,
                                ),
                              ),
                              Transform.scale(
                                scale: 0.6,
                                child: Switch(
                                  value: airConditioning,
                                  activeColor: Color(0xff2b4612),
                                  onChanged: (bool value) {
                                    setState(() {
                                      airConditioning = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Carteira p/ canhoto',
                                style: TextStyle(
                                  color: Color(0xff2b4612),
                                  fontSize: 16,
                                ),
                              ),
                              Transform.scale(
                                scale: 0.6,
                                child: Switch(
                                  value: airConditioning,
                                  activeColor: Color(0xff2b4612),
                                  onChanged: (bool value) {
                                    setState(() {
                                      airConditioning = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Carteira p/ PCD',
                                style: TextStyle(
                                  color: Color(0xff2b4612),
                                  fontSize: 16,
                                ),
                              ),
                              Transform.scale(
                                scale: 0.6,
                                child: Switch(
                                  value: airConditioning,
                                  activeColor: Color(0xff2b4612),
                                  onChanged: (bool value) {
                                    setState(() {
                                      airConditioning = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      width: 100,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Color(0xff2b4612),
                          ),
                        ),
                        onPressed: () {},
                        child: Row(
                          spacing: 8,
                          children: [
                            Icon(Icons.save_outlined, color: Colors.white),
                            Text(
                              'Salvar',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text('Teste'),
                            tileColor: Colors.grey,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
