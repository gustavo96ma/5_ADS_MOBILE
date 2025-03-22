import 'package:flutter/material.dart';

class ClassroomModal extends StatelessWidget {
  const ClassroomModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.centerLeft,
      insetPadding: EdgeInsets.only(left: 100, bottom: 50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Container(
        height: 300.0,
        width: 300.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              children: [
                TextField(),
                TextField(),
                TextButton(onPressed: () {}, child: Row(
                  children: [
                    Icon(Icons.save_outlined),
                    Text('Salvar'),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
