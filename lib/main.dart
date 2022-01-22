import 'package:colour_guess/core/locator.dart';
import 'package:colour_guess/core/services/shared_pref_service.dart';
import 'package:colour_guess/core/viewModels/game_view_model.dart';
import 'package:colour_guess/ui/shared/app_themes.dart';
import 'package:colour_guess/ui/views/game_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //initialize GetIt Locator
  initLocator();

  //initialize shrared preferences instance
  await initSharedPrefs();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //set preferred device orientations
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        //provider for main game view
        ChangeNotifierProvider<GameModel>(
          create: (_) => GameModel(),
        ),
      ],
      child: GestureDetector(
        //to dismiss active focus when tap outside an input area
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MaterialApp(
          //remove ui banner for debug mode
          debugShowCheckedModeBanner: false,
          title: 'Colour Guess',
          theme: lightTheme,
          builder: (BuildContext context, Widget? child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaleFactor: 1.0,
              ),
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: child!,
              ),
            );
          },
          initialRoute: '/',
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/':
                return MaterialPageRoute(
                  builder: (context) {
                    return const Main();
                  },
                );
              default:
                return MaterialPageRoute(
                  builder: (context) {
                    return const Main();
                  },
                );
            }
          },
        ),
      ),
    );
  }
}

///scroll behavior to remove overscroll splash from Android scroll views
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  ///app lifecycle logic
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        // print("APP STATE RESUMED");
        break;
      case AppLifecycleState.inactive:
        // print("APP STATE INACTIVE");
        break;
      case AppLifecycleState.paused:
        // print("APP STATE PAUSED");
        break;
      case AppLifecycleState.detached:
        // print("APP STATE DETACHED");
        break;
      default:
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const GameView();
  }
}
