import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  double _buttonRadious = 150;
  final Tween<double> _backgroundScale = Tween<double>(begin: 0.0, end: 1.0);
  AnimationController? _moonIconAnimationController;

  @override
  void initState() {
    super.initState();
    _moonIconAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    );
    _moonIconAnimationController!.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            _pageBackground(),
            // _circularAnimationButton(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _circularAnimationButton(),
                _moonIcon(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _pageBackground() {
    return TweenAnimationBuilder(
      tween: _backgroundScale,
      curve: Curves.easeInOutCubicEmphasized,
      duration: const Duration(seconds: 1),
      builder: (_context, double _scale, _child) {
        return Transform.scale(
          scale: _scale,
          child: _child,
        );
      },
      child: Container(
        color: Color(0xFF1F1F1F),
      ),
    );
  }

  Widget _circularAnimationButton() {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _buttonRadious += _buttonRadious == 250 ? -100 : 100;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          curve: Curves.bounceInOut,
          height: _buttonRadious,
          width: _buttonRadious,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(_buttonRadious),
          ),
          child: const Center(
            child: Text(
              '#Animdo',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget _moonIcon() {
  //   return AnimatedBuilder(
  //       animation: _moonIconAnimationController!.view,
  //       builder: (_buildContext, _child) {
  //         return Transform.rotate(
  //           angle: _moonIconAnimationController!.value * 2 * pi,
  //           child: _child,
  //         );
  //       },
  //       child: Image.network(
  //         'https://th.bing.com/th/id/R.d17eafc34bd70efe0530afb8c569dc30?rik=pDJEwzX9Uec2kA&riu=http%3a%2f%2fassets.stickpng.com%2fthumbs%2f58f9fde10ed2bdaf7c12832d.png&ehk=oK0gTG%2fUpdi06YX9MifCtVHTtYU4AjC6n8zDyb%2bPXdI%3d&risl=&pid=ImgRaw&r=0',
  //       ),);
  // }

  Widget _moonIcon(){
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _buttonRadious += _buttonRadious == 250 ? -100 : 100;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          curve: Curves.bounceInOut,
          height: _buttonRadious,
          width: _buttonRadious,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_buttonRadious),
          ),
          child: AnimatedBuilder(
        animation: _moonIconAnimationController!.view,
        builder: (_buildContext, _child) {
          return Transform.rotate(
            angle: _moonIconAnimationController!.value * 2 * pi,
            child: _child,
          );
        },
        child: Image.network(
          'https://th.bing.com/th/id/R.d17eafc34bd70efe0530afb8c569dc30?rik=pDJEwzX9Uec2kA&riu=http%3a%2f%2fassets.stickpng.com%2fthumbs%2f58f9fde10ed2bdaf7c12832d.png&ehk=oK0gTG%2fUpdi06YX9MifCtVHTtYU4AjC6n8zDyb%2bPXdI%3d&risl=&pid=ImgRaw&r=0',
        ),),
        ),
      ),
    );
  }
}
