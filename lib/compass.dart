import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Compass extends StatelessWidget {
  final _compassSvg = SvgPicture.asset('assets/compass.svg');
  final _needleSvg = SvgPicture.asset(
    'assets/needle.svg',
    fit: BoxFit.contain,
    height: 300,
    alignment: Alignment.center,
  );

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FlutterQiblah.qiblahStream,
      builder: (_, AsyncSnapshot<QiblahDirection> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          );
        }

        final qiblahDirection = snapshot.data;

        return Scaffold(
          appBar: AppBar(
            title: Text('Qibla Compass'),
          ),
          body: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Transform.rotate(
                angle: ((qiblahDirection!.direction ?? 0) * (pi / 180) * -1),
                child: _compassSvg,
              ),
              Transform.rotate(
                angle: ((qiblahDirection.qiblah ?? 0) * (pi / 180) * -1),
                alignment: Alignment.center,
                child: _needleSvg,
              ),
              Positioned(
                bottom: 12,
                child: Text("${qiblahDirection.offset.toStringAsFixed(3)}°",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
