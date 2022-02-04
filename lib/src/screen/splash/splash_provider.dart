import 'package:application/src/application.dart';
import 'package:application/src/screen/splash/local_model/animal.dart';

class SplashProvider extends ChangeNotifier {
  final all = [
    Animal(Types.animal, getImage('animals/animal1.png')),
    Animal(Types.animal, getImage('animals/animal2.png')),
    Animal(Types.animal, getImage('animals/animal3.png')),
    Animal(Types.bird, getImage('animals/bird1.png')),
    Animal(Types.bird, getImage('animals/bird2.png')),
    Animal(Types.bird, getImage('animals/bird3.png')),
  ]..shuffle();

  final animals = <Animal>[];
  final birds = <Animal>[];

  void onAcceptAll(Animal p1) {
    all.add(p1);
    animals.removeWhere((element) => element.imagePath == p1.imagePath);
    birds.removeWhere((element) => element.imagePath == p1.imagePath);
    notifyListeners();
  }

  void onAcceptBird(Animal p1) {
    if (p1.type != Types.bird) return;
    all.removeWhere((element) => element.imagePath == p1.imagePath);
    animals.removeWhere((element) => element.imagePath == p1.imagePath);
    birds.add(p1);
    notifyListeners();
  }

  void onAcceptAnimal(Animal p1) {
    if (p1.type != Types.animal) return;
    all.removeWhere((element) => element.imagePath == p1.imagePath);
    birds.removeWhere((element) => element.imagePath == p1.imagePath);
    animals.add(p1);
    notifyListeners();
  }
}
