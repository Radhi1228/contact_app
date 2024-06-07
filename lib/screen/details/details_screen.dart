import 'package:contact_app/model/contact_model.dart';
import 'package:contact_app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../home/provider/home_provider.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  TextEditingController txtName =TextEditingController();
  TextEditingController txtPhone =TextEditingController();
  TextEditingController txtEmail =TextEditingController();

  HomeProvider? provider;

  @override
  Widget build(BuildContext context) {
    provider = context.read<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(itemBuilder: (context) => [
            PopupMenuItem(onTap: () {
              update();
            },child: const Text("Update"),),
            PopupMenuItem(onTap:(){
              Share.share("${provider!.selectedContact!.name}\n${provider!.selectedContact!.mobile}");
            },child: const Text("Share"))
          ],)
          ],
        title: const Text("Contact Details",
        ),
        backgroundColor: primary,
      ),
      body: Column(
        children: [
          Placeholder(
            fallbackWidth: MediaQuery.sizeOf(context).width,
            fallbackHeight: 180,
          ),
          ListTile(
            title: const Text("Name"),
            subtitle: Text("${provider!.selectedContact!.name}"),
            trailing: IconButton(onPressed: (){},icon: const Icon(Icons.person),)
          ),
          ListTile(
            title: const Text("Mobile"),
            subtitle: Text("${provider!.selectedContact!.mobile}"),
            trailing:  IconButton(onPressed: () async {
              Uri uri = Uri.parse("tel: +91 ${provider!.selectedContact!.mobile}");
              await launchUrl(uri);
            },icon: const Icon(Icons.call),)
          ),
          ListTile(
            title: const Text("Message"),
            subtitle: Text("${provider!.selectedContact!.mobile}"),
            trailing: IconButton(onPressed: () async {
              Uri uri = Uri.parse("sms: ${provider!.selectedContact!.mobile}");
              await launchUrl(uri);
            },icon:const Icon(Icons.message),)
          ),
          ListTile(
            title: const Text("Email"),
            subtitle: Text("${provider!.selectedContact!.email}"),
            trailing: IconButton(onPressed: () async {
              Uri uri = Uri.parse("mailto:${provider!.selectedContact!.email}");
              await launchUrl(uri);
            },icon: const Icon(Icons.email),),
          ),

          Spacer(),
        IconButton(onPressed: (){
          provider!.addHideContact(provider!.selectedContact!);
          Navigator.pop(context);
        }, icon: const Icon(Icons.lock),)
        ],
      ),
    );
  }
  void update()
  {
    txtName.text=provider!.selectedContact!.name!;
    txtPhone.text=provider!.selectedContact!.mobile!;
    txtEmail.text=provider!.selectedContact!.email!;
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: const Text("Update"),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: txtName,
                decoration: const InputDecoration(
                  hintText: "Enter your name",
                  border: OutlineInputBorder(),
                ),
              ),
              TextFormField(
                controller: txtPhone,
                decoration: const InputDecoration(
                  hintText: "Enter your No",
                  border: OutlineInputBorder(),
                ),
              ),
              TextFormField(
                controller: txtEmail,
                decoration: const InputDecoration(
                  hintText: "Enter your Email",
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(onPressed: () {
                if(formKey.currentState!.validate())
                  {
                    ContactModel c2 = ContactModel(
                      name: txtName.text,
                      mobile:txtPhone.text,
                      email: txtEmail.text,
                    );
                    context.read<HomeProvider>().updateContact(c2);
                    Navigator.pop(context);
                  }
              }, child: const Text("Save"))
            ],
          ),
        ),
      );
    },
    );
  }
}
