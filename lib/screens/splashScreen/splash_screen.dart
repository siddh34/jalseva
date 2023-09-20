import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    // Initialize the animation controller
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    // Create a sequence of tweens that alternate between 1 and 0
    final tweenSequence = TweenSequence<double>([
      TweenSequenceItem(tween: Tween<double>(begin: 1, end: 0.25), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 0.25, end: 1), weight: 1),
    ]);

    // Create an animation that repeats the sequence indefinitely
    animation = tweenSequence.animate(controller)..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reset();
        controller.forward();
      }
    });

    // Start the animation
    controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/Post');
    });
  }

  @override
  void dispose() {
    // Dispose of the animation controller when the widget is disposed
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B1D48),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 2,
            ),
            Image.asset(
              'assets/title.png',
              width: 240,
            ),
            GFAnimation(
              scaleAnimation: animation,
              controller: controller,
              type: GFAnimationType.scaleTransition,
              child: Image.asset(
                'assets/drop.png',
                width: 80,
                height: 80,
              ),
            ),
            Image.asset(
              'assets/spsc_bottom_img.png',
            ),
          ],
        ),
      ),
    );
  }
}
