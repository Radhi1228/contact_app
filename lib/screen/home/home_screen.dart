import 'package:contact_app/screen/home/provider/home_provider.dart';
import 'package:contact_app/utils/app_color.dart';
import 'package:contact_app/utils/shared_helper.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // Consumer<HomeProvider>(
          //   builder: (context, value, child) =>
          //     Row(
          //   children: [
          //     ElevatedButton(
          //       onPressed: () {
          //         context.read<HomeProvider>().changeTheme("light");
          //       },
          //       child: const Text("Light"),
          //       style: ButtonStyle(
          //           backgroundColor: WidgetStateProperty.all(
          //               value.themeName == "light"
          //                   ? Colors.green
          //                   : Colors.grey)),
          //     ),
          //     ElevatedButton(
          //       onPressed: () {
          //         context.read<HomeProvider>().changeTheme("dark");
          //       },
          //       child: const Text("Dark"),
          //       style: ButtonStyle(
          //           backgroundColor: WidgetStateProperty.all(
          //               value.themeName == "dark"
          //                   ? Colors.green
          //                   : Colors.grey)),
          //     ),
          //     ElevatedButton(
          //       onPressed: () {
          //         context.read<HomeProvider>().changeTheme("system");
          //       },
          //       child: const Text("System"),
          //       style: ButtonStyle(
          //           backgroundColor: WidgetStateProperty.all(
          //               value.themeName == "system"
          //                   ? Colors.green
          //                   : Colors.grey)),
          //     ),
          //   ],
          // ),
          // ),
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: const Text("light"),
                      onTap: () {
                        context.read<HomeProvider>().setTheme("light");
                      },
                    ),
                    PopupMenuItem(
                      child: const Text("dark"),
                      onTap: () {
                        context.read<HomeProvider>().setTheme("dark");
                      },
                    ),
                    PopupMenuItem(
                      child: const Text("system"),
                      onTap: () {
                        context.read<HomeProvider>().setTheme("system");
                      },
                    ),
                  ]),
          IconButton(
            onPressed: () async {
              LocalAuthentication c1 = LocalAuthentication();
              bool canAuthenticateWithBiometrics = await c1.canCheckBiometrics;
              bool canAuthenticate = canAuthenticateWithBiometrics;
              if (canAuthenticate) {
                List<BiometricType> isAvailable =
                    await c1.getAvailableBiometrics();
                if (isAvailable.isNotEmpty) {
                  bool isAuth = await c1.authenticate(
                      localizedReason:
                          "Enter correct pass to show hidden things");
                  if (isAuth) {
                    Navigator.pushNamed(context, 'hide');
                  } else {
                    print("===3===");
                  }
                } else {
                  print("===2===");
                }
              } else {
                print("===1===");
              }
            },
            icon: const Icon(Icons.remove_red_eye),
          ),
        ],
        centerTitle: true,
        backgroundColor: primary,
        title: const Text(
          "Home screen",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Consumer<HomeProvider>(
        builder: (context, value, child) => ListView.builder(
          itemCount: value.contactModelList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                context.read<HomeProvider>().addSelectedContact(
                    context.read<HomeProvider>().contactModelList[index]);
                Navigator.pushNamed(
                  context,
                  'details',
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${value.contactModelList[index].name}",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text("${value.contactModelList[index].email}"),
                    Row(
                      children: [
                        Text("${value.contactModelList[index].mobile}"),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              context.read<HomeProvider>().deleteContact(index);
                            },
                            icon: const Icon(Icons.delete))
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primary,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'contact');
        },
      ),
    );
  }
}
