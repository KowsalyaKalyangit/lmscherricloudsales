import 'dart:async';

import '../allpackages.dart';
import '../utils/textstyles.dart';
import 'home/home_screen.dart';
import 'login/login_screen.dart';

 
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   String? _version;
    
  

  @override
  void initState() {
    super.initState();
   
    Timer(const Duration(seconds: 3), () async {
      String? token;
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      token = sharedPreferences.getString(Constants.token);
      if (token != null) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            fullscreenDialog: true,
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return HomeScreen();
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return FadeTransition(
                opacity:
                    animation, // CurvedAnimation(parent: animation, curve: Curves.elasticInOut),
                child: HomeScreen(),
              );
            },
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            fullscreenDialog: true,
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return LoginScreen();
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return FadeTransition(
                opacity:
                    animation, // CurvedAnimation(parent: animation, curve: Curves.elasticInOut),
                child: const LoginScreen(),
              );
            },
          ),
        );
      }
    }

        // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //     builder: (BuildContext context) => const LoginScreen())
        );
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
              Center(child: Image.asset("assets/tech/applogo.png",height: 12.0.hp,)),
           SizedBox(height: 1.0.hp,),
          Center(child: Image.asset("assets/tech/logoname.png",height: 8.0.hp,)),
         
          

        ],
      )
    );
  }
}
  