import 'package:contact_app/screen/intro/provider/intro_provider.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';


class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});


  @override
  State<IntroScreen> createState() => _IntroScreenState();
}


class _IntroScreenState extends State<IntroScreen> {
  GlobalKey  introKey = GlobalKey<IntroductionScreenState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<IntroProvider>(builder: (context, value, child) =>IntroductionScreen(
          key:introKey ,
          showSkipButton: true,
          pages: [
            PageViewModel(
                title: "Contact introduction page1",
                decoration: const PageDecoration(imageAlignment: Alignment.center,),
                image: Image.asset("assets/image/img.png",width: MediaQuery.sizeOf(context).width,fit: BoxFit.cover,),
                bodyWidget: Column(
                  children: [

                    ElevatedButton(onPressed: () {

                    }, child: const Center())
                  ],
                )
            ),
            PageViewModel(
                title: "Contact introduction page2",
                decoration: const PageDecoration(imageAlignment: Alignment.center,),
                image: Image.asset("assets/image/img1.png",width: MediaQuery.sizeOf(context).width,fit: BoxFit.cover,),
                bodyWidget: Column(
                  children: [
                    const Text(""),
                    ElevatedButton(onPressed: () {

                    }, child: const Center())
                  ],
                )
            ),
            PageViewModel(
                title: "Contact introduction page3",
                decoration: const PageDecoration(imageAlignment: Alignment.center,),
                image: Image.asset("assets/image/img3.png",width: MediaQuery.sizeOf(context).width,fit: BoxFit.cover,),
                bodyWidget: const Column(
                  children: [
                    ],
                )
            ),
          ],
          showNextButton: true,
          skip: const Text("Skip"),
          next: const Text("Next"),
          done: const Text("Done"),
          onDone: () {
            context.read<IntroProvider>().setIntro();
            Navigator.pushNamed(context,"home");
          },
        ),
      ),
    );
  }


}