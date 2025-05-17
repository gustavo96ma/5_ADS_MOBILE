import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:web/repositories/classroom_repository.dart';
import 'package:web/widgets/custom_switch.dart';

import 'models/classroom_model.dart';
import 'widgets/default_input.dart';

// TODO: Arrumar o layout quando scrolla a lista

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

  int id = 0;
  bool isEditMode = false;

  final TextEditingController classroomController = TextEditingController();
  final FocusNode classroomFocus = FocusNode();

  final TextEditingController capacityController = TextEditingController();
  final FocusNode capacityFocus = FocusNode();

  final TextEditingController computersCountController =
      TextEditingController();
  final FocusNode computersFocus = FocusNode();

  final formValidator = GlobalKey<FormState>();

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
          child: SizedBox(
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
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.close, size: 16),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      child: Form(
                        key: formValidator,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 20,
                            children: [
                              //TODO: avisar o usuário que só pode numérico nos campos capacidade e computadores
                              DefaultInput(
                                focusNode: classroomFocus,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Campo Nome obrigatório';
                                  }
                                  return null;
                                },
                                label: 'Sala',
                                controller: classroomController,
                                onlyNumbers: false,
                              ),
                              DefaultInput(
                                focusNode: capacityFocus,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Campo Capacidade obrigatório';
                                  }
                                  return null;
                                },
                                label: 'Capacidade',
                                controller: capacityController,
                                onlyNumbers: true,
                              ),
                              DefaultInput(
                                focusNode: computersFocus,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Campo Nº. Computadores obrigatório';
                                  }
                                  return null;
                                },
                                label: 'Nº. Computadores',
                                controller: computersCountController,
                                onlyNumbers: true,
                              ),
                            ],
                          ),
                        ),
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
                    Row(
                      spacing: 8,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 180,
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Color(0xff2b4612),
                              ),
                            ),
                            onPressed: () async {
                              formValidator.currentState!.validate();
                              if (classroomController.text.isNotEmpty) {
                                classroomFocus.requestFocus();
                              }
                              print('validou');
                              try {
                                final classroomModel = {
                                  'capacity': int.parse(
                                    capacityController.text,
                                  ),
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
                                if (isEditMode) {
                                  await Supabase.instance.client
                                      .from('classroom')
                                      .update(classroomModel)
                                      .eq('id', '$id');
                                } else {
                                  await Supabase.instance.client
                                      .from('classroom')
                                      .insert(classroomModel);
                                }

                                setState(() {
                                  classroomController.text = '';
                                  capacityController.text = '';
                                  computersCountController.text = '';
                                  id = 0;
                                  isEditMode = false;
                                  projector = false;
                                  television = false;
                                  airConditioning = false;
                                  leftHandedDesk = false;
                                  handcapDesk = false;
                                });
                              } catch (e) {
                                print(e);
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 8,
                              children: [
                                Icon(Icons.save_outlined, color: Colors.white),
                                Text(
                                  isEditMode ? 'Editar' : 'Registrar',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 180,
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Colors.grey,
                              ),
                            ),
                            onPressed: () async {
                              classroomController.text = '';
                              capacityController.text = '';
                              computersCountController.text = '';
                              setState(() {
                                id = 0;
                                isEditMode = false;
                                projector = false;
                                television = false;
                                airConditioning = false;
                                leftHandedDesk = false;
                                handcapDesk = false;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 8,
                              children: [
                                Icon(Icons.clear_outlined, color: Colors.white),
                                Text(
                                  'Limpar campos',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 200,
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
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              classroomController.text =
                                                  classroomList[index].classroom;
                                              capacityController.text =
                                                  classroomList[index].capacity
                                                      .toString();
                                              computersCountController.text =
                                                  classroomList[index]
                                                      .computersCount
                                                      .toString();
                                          
                                              setState(() {
                                                id = classroomList[index].id;
                                                isEditMode = true;
                                                projector =
                                                    classroomList[index]
                                                        .hasProjector;
                                                television =
                                                    classroomList[index]
                                                        .hasTelevision;
                                                airConditioning =
                                                    classroomList[index]
                                                        .hasAirConditioning;
                                                leftHandedDesk =
                                                    classroomList[index]
                                                        .hasLeftHandedDesk;
                                                handcapDesk =
                                                    classroomList[index]
                                                        .hasHandicapDesk;
                                              });
                                            },
                                            icon: Icon(
                                              Icons.remove_red_eye_outlined,
                                            ),
                                          ),
                                          IconButton(
                                            color: Colors.red,
                                            onPressed: () async {
                                            try {
                                              await Supabase.instance.client.from('classroom').delete().eq('id', classroomList[index].id);
                                              setState(() {
                                                
                                              });
                                            } catch (e) {
                                              print(e);
                                            }
                                            
                                          }, icon: Icon(Icons.delete_outlined))
                                        ],
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
