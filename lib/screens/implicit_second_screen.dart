import 'package:flutter/material.dart';

class ImplicitSecondScreen extends StatefulWidget {
  const ImplicitSecondScreen({Key? key}) : super(key: key);

  @override
  _ImplicitSecondScreenState createState() => _ImplicitSecondScreenState();
}

final List<Map<String, dynamic>> data = List.generate(
    30,
    (index) => {
          'title': 'My expansion tile $index',
          'logo': const FlutterLogo(size: 40),
          'content':
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel condimentum eros. Sed non ligula rhoncus, eleifend ante non, congue urna. Sed sed nisi vitae mi ullamcorper interdum. Pellentesque scelerisque ornare justo ac dictum. Fusce molestie erat id rhoncus consectetur. Nullam eu fermentum odio. Aliquam tristique gravida diam, at congue turpis. Etiam eleifend fermentum dictum. Sed ultrices, ipsum id fermentum cursus, leo eros im',
        });

List<bool> listIsTap = List.generate(data.length, (index) => false);

class _ImplicitSecondScreenState extends State<ImplicitSecondScreen> {
  final duration = 200;
  var isTap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyScrollView'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (ctx, index) {
          return Column(
            children: [
              ListTile(
                leading: Text('${data[index]['title']}'),
                trailing: AnimatedRotation(
                  turns: listIsTap[index] ? 0.5 : 0,
                  duration: Duration(milliseconds: duration),
                  child: const Icon(Icons.arrow_drop_down),
                ),
                onTap: () {
                  setState(() {
                    listIsTap[index] = !listIsTap[index];
                  });
                },
              ),
              AnimatedAlign(
                heightFactor: listIsTap[index] ? 1 : 0,
                alignment: Alignment.center,
                duration: Duration(milliseconds: duration),
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: duration),
                  opacity: listIsTap[index] ? 1 : 0,
                  child: Column(children: [
                    data[index]['logo'],
                    Text(
                      data[index]['content'].toString(),
                      textAlign: TextAlign.justify,
                    ),
                  ]),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
