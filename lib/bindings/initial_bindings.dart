import 'package:btp/controllers/converter.dart';
import 'package:btp/controllers/dataReader.dart';
import 'package:get/get.dart';

import 'package:btp/controllers/theme_controller.dart';

class InitialBindings implements Bindings {
  late DataReader controller = Get.put(DataReader());
  // Future<WordPaperModel>? controller2;
  @override
  void dependencies() {
    Get.put(ThemeController());
    DataReader controller = Get.put(DataReader());
    // controller2 = controller.readData();
  }
}
