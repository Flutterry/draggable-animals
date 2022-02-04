// import 'dart:convert';
// https://app.quicktype.io/
enum Types { animal, bird }

class Animal {
  final Types type;
  final String imagePath;

  Animal(this.type, this.imagePath);
}
