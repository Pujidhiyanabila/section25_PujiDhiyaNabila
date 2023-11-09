import 'package:flutter/material.dart';

class BaseView extends StatefulWidget {
  const BaseView({Key? key}) : super(key: key);

  static const String route = '/home';

  @override
  State<StatefulWidget> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detect"),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 80,
              child: Container(
                color: Colors.blueAccent,
                height: 40,
                child: const Icon(Icons.photo_library),
              ),
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Get Data"))
          ],
        ),
      ),
    );
  }
}
