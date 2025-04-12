import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:web/repositories/classroom_repository.dart';
import 'package:web/widgets/custom_switch.dart';

import 'models/classroom_model.dart';
import 'widgets/default_input.dart';

class ClassroomModal extends StatefulWidget {
  const ClassroomModal({super.key});

  @override
  State<ClassroomModal> createState() => _ClassroomModalState();
}

class _ClassroomModalState extends State<ClassroomModal> {
  bool projector = false;
  bool television = false;
  bool airConditioning = false;
  bool leftHandedDesk = false;
  bool handcapDesk = false;

  final TextEditingController classroomController = TextEditingController();
  final TextEditingController capacityController = TextEditingController();
  final TextEditingController computersCountController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ClassroomRepository().fetchAllClassrooms(),
      builder: (context, snapshot) {
        List<ClassroomModel> classroomList = [];

        if (snapshot.data != null && snapshot.data!.isNotEmpty) {
          classroomList = snapshot.data as List<ClassroomModel>;
        }

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
                        onPressed: () {},
                        icon: Icon(Icons.close, size: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        spacing: 20,
                        children: [
                          //TODO: avisar o usuário que só pode numérico nos campos capacidade e computadores
                          DefaultInput(
                            label: 'Sala',
                            controller: classroomController,
                            onlyNumbers: false,
                          ),
                          DefaultInput(
                            label: 'Capacidade',
                            controller: capacityController,
                            onlyNumbers: true,
                          ),
                          DefaultInput(
                            label: 'Nº. Computadores',
                            controller: computersCountController,
                            onlyNumbers: true,
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          CustomSwitch(
                            switchController: projector,
                            label: 'Projetor',
                          ),
                          CustomSwitch(
                            switchController: television,
                            label: 'TV',
                          ),
                          CustomSwitch(
                            switchController: airConditioning,
                            label: 'Ar condicionado',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          CustomSwitch(
                            switchController: leftHandedDesk,
                            label: 'Carteira p/ canhoto',
                          ),
                          CustomSwitch(
                            switchController: handcapDesk,
                            label: 'Carteira p/ PCD',
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
                        onPressed: () {
                          if (classroomController.text.isEmpty ||
                              capacityController.text.isEmpty ||
                              computersCountController.text.isEmpty) {
                            return;
                          }
                          print('validou');
                          try {
                            //TODO: os dados estão sendo enviados para o banco mas não registros lá debugar
                            final classroomModel = {
                              'capacity': int.parse(capacityController.text),
                              'classroom': classroomController.text,
                              'computersCount': int.parse(
                                computersCountController.text,
                              ),
                              'hasAirConditioning': airConditioning,
                              'hasHandicapDesk': handcapDesk,
                              'hasLeftHandedDesk': leftHandedDesk,
                              'hasProjector': projector,
                              'hasTelevision': television,
                            };
                            print('montei a classe');
                            Supabase.instance.client
                                .from('classroom')
                                .insert(classroomModel);
                            print('mandei pro banco');
                          } catch (e) {
                            print(e);
                          }
                        },
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
                      child:
                          snapshot.connectionState == ConnectionState.waiting
                              ? Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              )
                              : Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  20,
                                  12,
                                  20,
                                  0,
                                ),
                                child: ListView.builder(
                                  itemCount: classroomList.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      trailing: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.remove_red_eye_outlined,
                                        ),
                                      ),
                                      title: Text(
                                        '${classroomList[index].classroom}',
                                      ),
                                      tileColor: Colors.grey,
                                    );
                                  },
                                ),
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
