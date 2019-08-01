import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:animator/animator.dart';

class Beach extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Container(
              color: Colors.lightBlueAccent,
              child: Stack(
                children: <Widget>[
                  Animator(
                    tween: Tween<Offset>(
                        begin: Offset(-0.9, 0), end: Offset(0.005, 0)),
                    duration: Duration(seconds: 2),
                    curve: Curves.bounceOut,
                    repeats: 1,
                    builder: (anim) => FractionalTranslation(
                      translation: anim.value,
                      child: Container(
                        child: Image.asset(
                          'assets/img/sand3.png',
                          fit: BoxFit.fitHeight,
                        ),
                        margin: EdgeInsets.only(top: 170),
                      ),
                    ),
                  ),
                  Animator(
                    tween: Tween<Offset>(
                        begin: Offset(-0.9, 0), end: Offset(0.2, 0)),
                    duration: Duration(seconds: 4),
                    curve: Curves.elasticOut,
                    repeats: 1,
                    builder: (anim) => FractionalTranslation(
                      translation: anim.value,
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Image.asset(
                          'assets/img/umbrella3.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Animator(
                      tween: Tween<double>(begin: 0, end: 0.2),
                      duration: Duration(seconds: 4),
                      curve: Curves.elasticOut,
                      repeats: 1,
                      builder: (anim) => Transform.scale(
                        scale: anim.value,
                        child: Container(
                          margin: EdgeInsets.only(top: 50, left: 20),
                          child: Image.asset(
                            'assets/img/bucket.png',
                            fit: BoxFit.fill,
                            scale: 1.7,
                          ),
                        ),
                      ),
                    ),
                    top: 100,
                    right: 100,
                  ),
                  Positioned(
                    child: Animator(
                      tween: Tween<double>(begin: 0, end: 0.2),
                      duration: Duration(seconds: 10),
                      curve: Curves.elasticOut,
                      repeats: 1,
                      builder: (anim) => Transform.scale(
                        scale: anim.value,
                        child: Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Image.asset(
                            'assets/img/sun3.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    bottom: 70,
                    right: 70,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: WaveWidget(
              waveFrequency: 4,
              duration: 20,
              config: CustomConfig(
                gradients: [
                  [Colors.lightBlue, Colors.blueAccent],
                  [Colors.blueAccent, Color(0xffff)],
                  [Colors.lightBlue, Colors.blueAccent],
                  [Colors.blueAccent, Color(0xffff)],
                  [Colors.lightBlue, Colors.blueAccent],
                  [Colors.blueAccent, Color(0xffff)],
                ],
                durations: [10000, 10000, 15000, 15000, 10000, 10000],
                heightPercentages: [-0.15, 0.05, 0.3, 0.42, 0.6, 0.72],
                blur: MaskFilter.blur(BlurStyle.solid, 10),
//            gradientBegin: Alignment.centerLeft,
//            gradientEnd: Alignment.centerRight,
              ),
              waveAmplitude: 5,
              heightPercentange: 0.25,
              backgroundColor: Colors.indigo,
              size: Size(
                double.infinity,
                double.infinity,
              ),
            ),
            flex: 5,
          ),
        ],
      ),
    );
  }
}
