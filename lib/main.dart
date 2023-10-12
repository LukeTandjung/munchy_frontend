import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:munchy_mvp/view/registration_screen.dart';
import 'package:munchy_mvp/view/login_screen.dart';
import 'package:munchy_mvp/view/onboard_name.dart';
import 'package:munchy_mvp/view/onboard_Q1.dart';
import 'package:munchy_mvp/view/onboard_Q3.dart';
import 'package:munchy_mvp/view/onboard_Q4.dart';
import 'package:munchy_mvp/view/onboard_Q5.dart';
import 'package:munchy_mvp/view/onboard_Q6.dart';
import 'package:munchy_mvp/view/onboard_Q8.dart';
import 'package:munchy_mvp/view/onboard_Q9.dart';
import 'package:munchy_mvp/view/onboard_Q10.dart';
import 'package:munchy_mvp/view/onboard_welcome.dart';
// import 'package:munchy_mvp/view/welcome_screen3.dart';
import 'package:munchy_mvp/view/welcome_screen4.dart';
import 'package:munchy_mvp/view/diet_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:munchy_mvp/controller/User controller.dart';
import 'package:munchy_mvp/controller/Spinner.dart';
import 'package:munchy_mvp/controller/VisiblePassword.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => User()),
          ChangeNotifierProvider(create: (context) => Spinner()),
          ChangeNotifierProvider(create: (context) => VisiblePassword()),
          ChangeNotifierProvider(create: (context) => Diet()),
          ChangeNotifierProvider(create: (context) => JsonDiet())
        ],
        child: MaterialApp(
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              backgroundColor: Color.fromARGB(255, 254, 106, 0),
              titleTextStyle: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            tabBarTheme: TabBarTheme(
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 3.0,
                  color: Color(0xFFFEB987),
                ),
              ),
            ),
            fontFamily: 'Sans Serif',
            textTheme: const TextTheme().apply(
              bodyColor: const Color.fromARGB(255, 103, 97, 79),
              displayColor: const Color.fromARGB(255, 103, 97, 79),
            ),
          ),
          initialRoute: RegistrationScreen.id,
          routes: {
            RegistrationScreen.id: (context) => const RegistrationScreen(),
            LoginScreen.id: (context) => const LoginScreen(),
            OnboardName.id: (context) => const OnboardName(),
            OnboardQ1.id: (context) => const OnboardQ1(),
            OnboardWelcome.id: (context) => OnboardWelcome(),
            // OnboardQ2.id: (context) => const OnboardQ2(),
            OnboardQ3.id: (context) => const OnboardQ3(),
            OnboardQ4.id: (context) => const OnboardQ4(),
            OnboardQ5.id: (context) => const OnboardQ5(),
            OnboardQ6.id: (context) => const OnboardQ6(),
            // OnboardQ7.id: (context) => const OnboardQ7(),
            OnboardQ8.id: (context) => const OnboardQ8(),
            OnboardQ9.id: (context) => const OnboardQ9(),
            OnboardQ10.id: (context) => const OnboardQ10(),
            // WelcomeScreenSeqThree.id: (context) => WelcomeScreenSeqThree(),
            WelcomeScreenSeqFour.id: (context) => WelcomeScreenSeqFour(),
            // WelcomeScreenSeqFive.id: (context) => WelcomeScreenSeqFive(),
            DietScreen.id: (context) => DietScreen(),
          },
        ),
      ),
    );
  }
}

class Diet extends ChangeNotifier {
  List<String> diet = [];

  void changeDiet(List<String> newDiet) {
    diet = newDiet;
    notifyListeners();
  }
}

class JsonDiet extends ChangeNotifier {
  dynamic jsondiet;

  void changeJsonDiet(dynamic newJsonDiet) {
    jsondiet = newJsonDiet;
    notifyListeners();
  }
}

bool _pressedStateBread = false;
bool _pressedStateNoodles = false;
bool _pressedStateOats = false;
bool _pressedStatePasta = false;
bool _pressedStateQuinoa = false;
bool _pressedStateRice = false;

var carbohydrateFoodItemListState = [
  _pressedStateBread,
  _pressedStateNoodles,
  _pressedStateOats,
  _pressedStatePasta,
  _pressedStateQuinoa,
  _pressedStateRice
];

bool _pressedStateChicken = false;
bool _pressedStateBeef = false;
bool _pressedStatePork = false;
bool _pressedStateTofu = false;
bool _pressedStateEgg = false;
bool _pressedStateCheese = false;

var proteinFoodItemListState = [
  _pressedStateChicken,
  _pressedStateBeef,
  _pressedStatePork,
  _pressedStateTofu,
  _pressedStateEgg,
  _pressedStateCheese
];

bool _pressedStateNuts = false;
bool _pressedStatePeanutButter = false;
bool _pressedStateAvocado = false;
bool _pressedStateSalmon = false;
bool _pressedStateTuna = false;
bool _pressedStateYogurt = false;

var fatFoodItemListState = [
  _pressedStateNuts,
  _pressedStatePeanutButter,
  _pressedStateAvocado,
  _pressedStateSalmon,
  _pressedStateTuna,
  _pressedStateYogurt
];