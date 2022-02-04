import 'package:application/src/application.dart';
import 'package:application/src/screen/splash/local_model/animal.dart';

class CustomDraggable extends StatelessWidget {
  final Animal animal;

  const CustomDraggable(this.animal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable<Animal>(
      data: animal,
      child: _container(),
      feedback: _container(),
      childWhenDragging: Container(),
    );
  }

  Widget _container() {
    return Container(
      width: getWidth(40),
      height: getWidth(40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(animal.imagePath),
        ),
      ),
    );
  }
}
