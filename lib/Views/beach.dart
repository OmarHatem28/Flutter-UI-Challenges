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
              child: Animator(
                tween:
                    Tween<Offset>(begin: Offset(-0.9, 0), end: Offset(0, 0)),
                duration: Duration(seconds: 2),
                curve: Curves.bounceOut,
                repeats: 1,
                builder: (anim) => FractionalTranslation(
                  translation: anim.value,
                  child: Image.asset('assets/img/beach4.png', fit: BoxFit.fill,),
                ),
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
