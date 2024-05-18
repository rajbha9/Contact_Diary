import 'dart:io';

import 'package:contact_diary/modalClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'modalClass.dart';
import 'modalClass.dart';

class Providar_Data extends ChangeNotifier {
  bool themedata = true;
  File? picImage;

  void changeThemeData() {
    themedata = !themedata;
    notifyListeners();
  }

  int curentStep = 0;

  void nextstep() {
    if (curentStep < 3) {
      curentStep++;
    }
    notifyListeners();
  }

  void backstep() {
    if (curentStep > 0) {
      curentStep--;
    }
    notifyListeners();
  }

  TextEditingController NameController = TextEditingController(text: '');
  TextEditingController EmailController = TextEditingController(text: '');
  TextEditingController PhoneController = TextEditingController(text: '');
  List<contact> contacts = [
    contact(
        name: 'Rajbha', email: 'Baradrajbha1@gmail.com', number: '6263646500'),
    contact(
        name: 'Vishakha',
        email: 'vishubarad27@email.com',
        number: '7990301302'),
  ];
  List hidecontact = [];

  void addcontact(String name, String email, String number) {
    contacts.add(
      contact(name: name, email: email, number: number),
    );
    notifyListeners();
  }

  void addcontactWithImage(
      String name, String email, String number, File image) {
    contacts.add(
      contact(name: name, email: email, number: number, imgpic: image),
    );
    notifyListeners();
  }

  void chakeFild() {
    if (NameController.text.isNotEmpty &&
        EmailController.text.isNotEmpty &&
        PhoneController.text.isNotEmpty &&
        picImage != Null) {
      addcontactWithImage(NameController.text, EmailController.text,
          PhoneController.text, picImage!);
    } else if (NameController.text.isNotEmpty &&
        EmailController.text.isNotEmpty &&
        PhoneController.text.isNotEmpty &&
        picImage == Null) {
      addcontact(
          NameController.text, EmailController.text, PhoneController.text);
    }
    NameController.clear();
    PhoneController.clear();
    EmailController.clear();
    picImage = null;
  }

  dynamic galleryimg() async {
    final ImagePicker picker = ImagePicker();
    XFile? res = await picker.pickImage(source: ImageSource.gallery);
    String path = res!.path;
    picImage = File(path);
    notifyListeners();
  }

  dynamic cameraimg() async {
    final ImagePicker picker = ImagePicker();
    XFile? res = await picker.pickImage(source: ImageSource.camera);
    String path = res!.path;
    picImage = File(path);
    notifyListeners();
  }

  deletecontact(contact data) {
    contacts.remove(data);
    notifyListeners();
  }

  hidedata(contact data) {
    hidecontact.add(data);
    contacts.remove(data);
    notifyListeners();
  }

  unhidedata(contact data) {
    hidecontact.remove(data);
    contacts.add(data);
    notifyListeners();
  }
  void updateContact(contact data,String name,String number,String email){
    if(contacts.contains(data)){
      contacts.forEach((element) {
        if(element==data ){
          element.name=name;
          element.number=number;
          element.email=email;
        }
      });
    }
    NameController.clear();
    PhoneController.clear();
    EmailController.clear();
    notifyListeners();
  }
}
