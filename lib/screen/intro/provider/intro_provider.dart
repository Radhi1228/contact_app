import 'package:contact_app/utils/shared_helper.dart';
import 'package:flutter/material.dart';

class IntroProvider with ChangeNotifier
{
  bool intro = false;
  SharedHelper int1 = SharedHelper();


   Future<void>  getIntro()
   async {
     intro = (await int1.getIntro())!;
     notifyListeners();
   }

   Future<void>  setIntro()
   async {
     await int1.setIntro(true);
   }


}
