import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/astronaut_controller.dart';

class AstronautListView extends GetView<AstronautController> {
  const AstronautListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Astronauts in Space'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: controller.astronauts.length,
            itemBuilder: (context, index) {
              final astronaut = controller.astronauts[index];
              return ListTile(
                title: Text(astronaut.name),
                subtitle: Text('Craft: ${astronaut.craft}'),
              );
            },
          );
        }
      }),
    );
  }
}
