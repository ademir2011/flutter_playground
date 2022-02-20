import 'package:flutter/material.dart';
import 'package:flutter_playground/src/pages/playground/mvw/src/enum/page_enum.dart';
import 'package:flutter_playground/src/pages/playground/mvw/src/stores/cpfStore.dart';
import 'package:flutter_playground/src/pages/playground/mvw/src/stores/pageStore.dart';
import 'package:flutter_playground/src/pages/playground/mvw/src/widgets/button_choose_widget.dart';
import 'package:flutter_playground/src/pages/playground/mvw/src/widgets/generic_border_widget.dart';

class CpfGenValPage extends StatefulWidget {
  const CpfGenValPage({Key? key}) : super(key: key);

  @override
  _CpfGenValPageState createState() => _CpfGenValPageState();
}

class _CpfGenValPageState extends State<CpfGenValPage> {
  final cpfStore = CpfStore();
  final pageStore = PageStore();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageStore.addListener(() {
      cpfStore.inputCpfController.text = '';
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1A1125),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GenericBorderWidget(
                    isOff: pageStore.pageEnum != PageEnum.generate,
                    child: ButtonChooseWidget(
                      text: 'GENERATE',
                      onPressed: pageStore.generatedPressed,
                    )),
                GenericBorderWidget(
                  isOff: pageStore.pageEnum != PageEnum.validate,
                  child: ButtonChooseWidget(
                    text: 'VALIDATE',
                    onPressed: pageStore.validatePressed,
                  ),
                ),
              ],
            ),
            const Spacer(),
            GenericBorderWidget(
              child: TextField(
                textAlign: TextAlign.center,
                controller: cpfStore.inputCpfController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(
                  color: Color(0xffFDC2FF),
                  fontSize: 30,
                  shadows: [
                    BoxShadow(
                      color: const Color(0xffFDC2FF).withAlpha(65),
                      blurRadius: 3,
                      spreadRadius: 2.5,
                    ),
                    BoxShadow(
                      color: const Color(0xffFDC2FF).withAlpha(20),
                      blurRadius: 4,
                      spreadRadius: 10,
                    ),
                  ],
                ),
                keyboardType: TextInputType.number,
                enabled: pageStore.pageEnum != PageEnum.generate,
              ),
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: const LinearGradient(
                  colors: [Color(0xff8632F2), Color(0xffF675A3)],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xffFDC2FF).withAlpha(65),
                    blurRadius: 3,
                    spreadRadius: 2.5,
                  ),
                  BoxShadow(
                    color: const Color(0xffFDC2FF).withAlpha(20),
                    blurRadius: 4,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: TextButton(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 65, vertical: 17.5),
                  child: Text(
                    pageStore.pageEnum == PageEnum.validate ? 'VALIDATE' : 'GENERATE',
                    style: const TextStyle(
                      fontSize: 22.5,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                onPressed: () {
                  cpfStore.actionPressButton(pageType: pageStore.pageEnum);
                },
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
