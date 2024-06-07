import 'package:contact_app/model/contact_model.dart';
import 'package:contact_app/utils/global.dart';
import 'package:contact_app/utils/shared_helper.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider with ChangeNotifier {
  bool colorOn = true;
  String? theme;
  String themeName = "system";
  List<ContactModel> contactModelList = [];
  List<ContactModel> hiddenModelList = [];
  ContactModel? selectedContact;
  int selectIndex = 0;

  // void changeTheme (String name)
  // {
  //   themeName = name;
  //   notifyListeners();
  // }

  void addSelectedContact(ContactModel contact) {
    selectedContact = contact;
  }

  void setTheme(String theme) {
    SharedHelper helper = SharedHelper();
    helper.setThemeName(theme);
    getTheme();
  }

  Future<void> getTheme() async {
    SharedHelper helper = SharedHelper();
    theme = await helper.getThemeName();
    notifyListeners();
  }

  void addContact(ContactModel model) {
    contactModelList.add(model);
    notifyListeners();
  }

  void deleteContact(int index) {
    contactModelList.removeAt(index);
    notifyListeners();
  }

  void updateData(int i) {
    i = selectIndex;
    notifyListeners();
  }

  void updateContact(ContactModel c2) {
    contactModelList[selectIndex] = c2;
    notifyListeners();
  }

  void addHideContact(ContactModel model)
  {
    hiddenModelList.add(model);
    contactModelList.removeAt(selectIndex);
    notifyListeners();
  }
}
