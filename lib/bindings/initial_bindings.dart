import 'package:btp/controllers/auth_controller.dart';
import 'package:btp/controllers/converter.dart';
import 'package:btp/controllers/dataReader.dart';
import 'package:btp/controllers/word_groups_controller.dart';
import 'package:get/get.dart';

import 'package:btp/controllers/theme_controller.dart';

class InitialBindings implements Bindings {
  late DataReader controller = Get.put(DataReader());
  // Future<WordPaperModel>? controller2;
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController());
    Get.put(WordGroupsController());

    // controller2 = controller.readData();
  }
}
