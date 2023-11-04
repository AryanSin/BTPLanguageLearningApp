import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:btp/controllers/data_uploader.dart';
import 'package:get/get.dart';
// import 'package:btp/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:btp/references/loading_status.dart';

class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({super.key});
  DataUploader controller = Get.put(DataUploader());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Obx(() => Text(
          controller.loadingStatus.value == LoadingStatus.completed
              ? "Uploading completed"
              : "Uploading")),
    ));
  }
}
