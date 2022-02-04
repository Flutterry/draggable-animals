import 'package:application/src/application.dart';
import 'package:application/src/screen/splash/local_model/animal.dart';
import 'package:application/src/screen/splash/local_widget/local_widgets.dart';

class DraggablePoint extends StatelessWidget {
  final List<Animal> data;
  final List<Types> acceptTypes;
  final String title;
  final void Function(Animal) onAccept;

  const DraggablePoint({
    Key? key,
    required this.data,
    required this.acceptTypes,
    required this.title,
    required this.onAccept,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.blueAccent,
      radius: getWidth(20),
      child: DragTarget<Animal>(
        onAccept: onAccept,
        onWillAccept: (animal) => true,
        builder: (_, __, ___) {
          return Stack(
            alignment: Alignment.center,
            children: [
              ...data.map((animal) => CustomDraggable(animal)),
              IgnorePointer(
                child: CustomText(
                  text: title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.8),
                        blurRadius: 15,
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
