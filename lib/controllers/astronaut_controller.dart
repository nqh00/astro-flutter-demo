import 'package:get/get.dart';
import '../models/astronaut.dart';
import '../services/api_service.dart';

class AstronautController extends GetxController {
  final ApiService _apiService = ApiService();
  final RxList<Astronaut> astronauts = <Astronaut>[].obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAstronauts();
  }

  Future<void> fetchAstronauts() async {
    try {
      isLoading.value = true;
      final List<Astronaut> fetchedAstronauts = await _apiService.getAstronauts();
      astronauts.assignAll(fetchedAstronauts);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch astronauts: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
