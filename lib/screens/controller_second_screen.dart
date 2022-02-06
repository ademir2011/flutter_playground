import 'dart:math';

import 'package:flutter/material.dart';

class ControllerSecondScreen extends StatefulWidget {
  const ControllerSecondScreen({Key? key}) : super(key: key);

  @override
  _ControllerSecondScreenState createState() => _ControllerSecondScreenState();
}

class Data {
  final String title;
  final FlutterLogo logo;
  final String content;
  final AnimationController controller;
  final Animation<double?> heightFactorAnimation;
  final Animation<double?> radiansAnimation;

  Data({
    required this.title,
    required this.logo,
    required this.content,
    required this.controller,
    required this.heightFactorAnimation,
    required this.radiansAnimation,
  });
}

List<Data> data = [];

class _ControllerSecondScreenState extends State<ControllerSecondScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    data.addAll(
      List.generate(
        30,
        (index) {
          final animationController = AnimationController(
            vsync: this,
            duration: const Duration(seconds: 1),
          );
          return Data(
            title: 'My expansion tile $index',
            logo: const FlutterLogo(size: 40),
            content:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel condimentum eros. Sed non ligula rhoncus, eleifend ante non, congue urna. Sed sed nisi vitae mi ullamcorper interdum. Pellentesque scelerisque ornare justo ac dictum. Fusce molestie erat id rhoncus consectetur. Nullam eu fermentum odio. Aliquam tristique Sed ultrices, ipsum id fermentum cursus, leo eros im',
            controller: animationController,
            heightFactorAnimation: Tween(begin: 0.0, end: 1.0).animate(
              animationController,
            ),
            radiansAnimation: Tween(begin: 0.0, end: pi).animate(
              animationController,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyScrollView'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (ctx, index) {
          return AnimatedBuilder(
            animation: data[index].controller,
            builder: (ctx, child) {
              return Column(
                children: [
                  ListTile(
                    leading: Text(data[index].title),
                    trailing: Transform.rotate(
                      angle: data[index].radiansAnimation.value!,
                      child: const Icon(Icons.arrow_drop_down),
                    ),
                    onTap: () {
                      setState(() {
                        // listIsTap[index] = !listIsTap[index];
                        if (data[index].controller.value == 0) {
                          data[index].controller.forward();
                        } else {
                          data[index].controller.reverse();
                        }
                      });
                    },
                  ),
                  ClipRect(
                    child: Align(
                      heightFactor: data[index].heightFactorAnimation.value,
                      child: Column(children: [
                        data[index].logo,
                        Text(
                          data[index].content,
                          textAlign: TextAlign.justify,
                        ),
                      ]),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    data.forEach((element) {
      element.controller.dispose();
    });
  }
}
