import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:slider_button/slider_button.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:munchy_mvp/view/diet_screen.dart';
import 'package:munchy_mvp/controller/VisiblePassword.dart';
import 'package:munchy_mvp/controller/User controller.dart';
import 'package:munchy_mvp/controller/Spinner.dart';
import 'package:munchy_mvp/widgets/MunchyTextField.dart';
import 'package:munchy_mvp/widgets/MunchyCheckBox.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<Spinner>(context, listen: false).showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 9.8.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 3.1.h,
              ),
              Center(
                child: Image.asset(
                  'assets/images/munchy_logo.png',
                  width: 60.5.w,
                  height: 21.4.h,
                ),
              ),
              SizedBox(
                height: 3.1.h,
              ),
              MunchyTextField(
                hintText: 'Email',
                obscureText: false,
                onChanged: (value) {
                  Provider.of<User>(context, listen: false).changeEmail(value);
                },
                optionalButton: Icon(
                  Icons.delete,
                ),
              ),
              SizedBox(
                height: 3.1.h,
              ),
              MunchyTextField(
                hintText: 'Password',
                obscureText: Provider.of<VisiblePassword>(context, listen: false).hidePassword,
                onChanged: (value) {
                  Provider.of<User>(context, listen: false).changePassword(value);
                },
                optionalButton: IconButton(
                  padding: EdgeInsets.symmetric(horizontal: 4.0.w, vertical: 0.97.h),
                  iconSize: 10.sp,
                  icon: Icon(Icons.radio_button_checked, color: Color(0x66000000)),
                  onPressed: () {
                    setState(() {
                      Provider.of<VisiblePassword>(context, listen: false).showPassword();
                    });
                  },
                ),
              ),
              SizedBox(
                height: 3.1.h,
              ),
              MunchyCheckBox(
                  initialState: Provider.of<User>(context, listen: false).promotion!,
                  text: 'I wish to receive promotional materials.',
                  onChanged: (bool? newValue) {
                    setState(() {
                      Provider.of<User>(context, listen: false).changePromotion(newValue);
                    });
                  }
              ),
              SizedBox(
                height: 19.2.h,
              ),
              Center(
                child: SliderButton(
                  action: () async {
                    setState(() {
                      Provider.of<Spinner>(context, listen: false).changeSpinner(true);
                    });
                    try {
                      Provider.of<User>(context, listen: false).loginUser(
                          Provider.of<User>(context, listen: false).email,
                          Provider.of<User>(context, listen: false).password
                      );
                      Navigator.pushNamed(context, DietScreen.id);
                      setState(() {
                        Provider.of<Spinner>(context, listen: false).changeSpinner(false);
                      });
                    } catch(e) {
                      throw Exception('An unknown error has occurred!');
                    }
                  },
                  label: Text(
                    'I am ready!',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w200,
                      fontSize: 13.sp,
                    ),
                  ),
                  alignLabel: Alignment(0.1,0),
                  icon: Center(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  width: 277,
                  height: 60,
                  radius: 20,
                  buttonColor: Color.fromARGB(255, 254, 106, 0),
                  backgroundColor: Color(0xFFFEB987),
                ),
              ),
              Flexible(
                child: Container(),
              ),
              Divider(
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Don't have an account? ",),
                  InkWell(
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontFamily: "Sans Serif",
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}

