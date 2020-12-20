import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/counter/counterController.dart';

//obx logic getx
class CounterApp extends StatelessWidget {
  final CounterController counterController = CounterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
        actions: [_getScreenSize()],
      ),
      floatingActionButton: _floatingButton(),
      body: _body(),
    );
  }

  Widget _getScreenSize() {
    return IconButton(
        icon: Icon(Icons.info),
        onPressed: () {
          Get.dialog(SimpleDialog(
            children: [
              Text("Screen Height:${counterController.getScreenSize().height}"),
              Text("Screen Width:${counterController.getScreenSize().width}"),
            ],
          ));
        });
  }

  Widget _floatingButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        _btn(
            onPress: () {
              counterController.incrementCounter();
            },
            icon: Icon(Icons.add),
            buttonColor: Colors.green),
        SizedBox(
          width: 5,
        ),
        _btn(
            onPress: () {
              counterController.decrementCounter();
            },
            icon: Icon(Icons.remove),
            buttonColor: Colors.red),
      ],
    );
  }

  Widget _btn({
    @required Function onPress,
    Widget icon,
    @required Color buttonColor,
  }) {
    return FloatingActionButton(
      backgroundColor: buttonColor,
      child: icon,
      onPressed: onPress,
    );
  }

  Widget _body() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("you have pushed the button this many times"),
          Obx(() => Text(counterController.counter.toString()))
        ],
      ),
    );
  }
}
