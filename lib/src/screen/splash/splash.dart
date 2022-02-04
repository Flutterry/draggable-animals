import 'package:application/src/application.dart';
import 'package:application/src/screen/splash/local_model/animal.dart';
import 'package:application/src/screen/splash/local_widget/draggable_point.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = context.watch<SplashProvider>();
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (_, __) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(width: double.infinity),
              DraggablePoint(
                data: provider.all,
                acceptTypes: Types.values,
                title: 'All',
                onAccept: provider.onAcceptAll,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DraggablePoint(
                    data: provider.animals,
                    acceptTypes: const [Types.animal],
                    title: 'Animals',
                    onAccept: provider.onAcceptAnimal,
                  ),
                  DraggablePoint(
                    data: provider.birds,
                    acceptTypes: const [Types.bird],
                    title: 'Bards',
                    onAccept: provider.onAcceptBird,
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
