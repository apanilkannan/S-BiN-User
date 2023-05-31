import 'package:get/get.dart';
import 'package:s_bin/src/modules/map/controllers/map_controller.dart';

class MapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapController>(() => MapController());
  }
}
