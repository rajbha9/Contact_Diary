import 'dart:io';

class contact {
  String name;
  String number;
  String email;
  File? imgpic;

  contact(
      {required this.name,
      required this.email,
      required this.number,
      this.imgpic});
}
