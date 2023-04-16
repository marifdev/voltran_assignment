import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final MyHomePageController controller = Get.put(MyHomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voltran Assignment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx(() => Text(
                  '${controller.tapCount}',
                  style: Theme.of(context).textTheme.headlineMedium,
                )),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onLongPress: controller.onLongPress,
        child: Obx(
          () => FloatingActionButton(
            onPressed: controller.onTap,
            backgroundColor: controller.isIncreasing.value ? Colors.green : Colors.blue,
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
