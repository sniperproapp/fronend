import 'package:flutter/material.dart';
import 'package:sniper_pro/src/presentation/pages/auth/login/LoginPage.dart';
import 'package:video_player/video_player.dart';
 

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
     late final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset("assets/img/INTROAPP.mp4")
        ..initialize().then((_)=>  {_videoPlayerController.play()
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        });
         
  @override
  void initState() {
    super.initState();
    var d = const Duration(seconds: 4);
    Future.delayed(d, () {
        _videoPlayerController.dispose();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) =>  LoginPage()),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
           
              // image: DecorationImage(
              //   image: AssetImage("assets/img/INTROAPP.gif"),
              //   fit: BoxFit.cover,
              // ),
    VideoPlayer(_videoPlayerController),
             
             
              
           
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(70),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    
                    titleTextStyle: TextStyle(color: Colors.white),
                    title: Text(
                      " ",
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Text(
                      " ",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  CircularProgressIndicator(
                    color: Colors.indigo,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}