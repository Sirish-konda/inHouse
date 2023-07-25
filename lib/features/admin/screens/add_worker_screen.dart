import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fyp/common/custom_button.dart';
import 'package:fyp/common/custom_textfield.dart';
import 'package:fyp/constants/utils.dart';
import 'package:fyp/features/admin/services/admin_services.dart';

class AddWorkerScreen extends StatefulWidget {
  static const String routeName = '/add-product';
  const AddWorkerScreen({super.key});

  @override
  State<AddWorkerScreen> createState() => _AddWorkerScreenState();
}

class _AddWorkerScreenState extends State<AddWorkerScreen> {
  final TextEditingController employeeNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  final AdminServices adminServices = AdminServices();
  String gender = 'Male';

  List<String> genderList = ['Male', 'Female', 'Other'];

  File? images;

  final _addProductFormKey = GlobalKey<FormState>();

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  void sellProducts() {
    if (_addProductFormKey.currentState!.validate() && images != null) {
      adminServices.addWorker(
        context: context,
        name: employeeNameController.text,
        description: descriptionController.text,
        fee: double.parse(salaryController.text),
        gender: gender,
        profilePicture: images!,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Add Employee'),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _addProductFormKey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: selectImages,
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          border: Border.all(width: 3),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: images == null
                            ? const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add,
                                    size: 54,
                                  ),
                                  Text(
                                    'Select Image',
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.grey),
                                  )
                                ],
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  image: DecorationImage(
                                    image: FileImage(images!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: employeeNameController,
                      hintText: 'Employee Name',
                      labelText: 'Employee Name',
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: descriptionController,
                      hintText: 'Description',
                      labelText: 'Description',
                      maxLines: 5,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      keyboardType: TextInputType.number,
                      controller: salaryController,
                      hintText: 'Fee',
                      labelText: 'Fee',
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 3),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20)),
                      child: DropdownButton(
                        isExpanded: true,
                        value: gender,
                        items: genderList.map(
                          (String e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            );
                          },
                        ).toList(),
                        onChanged: (String? newVal) {
                          setState(
                            () {
                              gender = newVal!;
                            },
                          );
                        },
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 42,
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: 'Hire',
                      onTap: sellProducts,
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
