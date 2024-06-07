import 'dart:io';

import 'package:contact_app/screen/home/provider/home_provider.dart';
import 'package:contact_app/utils/app_color.dart';
import 'package:contact_app/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../model/contact_model.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  ImagePicker picker = ImagePicker();
  String? path;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primary,
        title: const Text("Create contact"),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  const SizedBox(height: 10,),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: FileImage(File("$path")),
                          //child: Image.file(File("$path"),fit: BoxFit.fill,),
                        ),
                      ),
                      SizedBox(
                        height: 120,
                        child: Align(
                          alignment: const Alignment(0.3,0.9),
                          child: IconButton.filledTonal(
                            onPressed: () async {
                              XFile? image = await picker.pickImage(
                                  source: ImageSource.gallery);
                              setState(() {
                                path = image!.path;
                              });
                            },
                            icon: const Icon(Icons.add),
                            // style: ButtonStyle(
                            //   backgroundColor:
                            //   MaterialStatePropertyAll(Colors.green.shade200),
                            // ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10,left: 10),
                        child: TextFormField(
                            controller: txtName,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("Name :"),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "This Field is required";
                              }
                              return null;
                            }
                        ),
                      )),
                  const SizedBox(height:15),
                  SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10,left: 10),
                      child: TextFormField(
                        controller: txtPhone,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Phone :"),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This Field is required";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height:15),
                  SizedBox(height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10,left: 10),
                      child: TextFormField(
                        controller: txtEmail,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Email :"),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This Field is required";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,backgroundColor: primary),
                      onPressed: () {
                        ContactModel c1 = ContactModel(
                          name: txtName.text,
                          mobile: txtPhone.text,
                          email: txtEmail.text,
                        );
                        context.read<HomeProvider>().addContact(c1);
                          Navigator.pop(context);
                        },
                      child: const Text("OK"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
