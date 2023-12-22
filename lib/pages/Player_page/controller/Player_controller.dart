import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class PlayerController extends GetxController {
  final audioQuery = OnAudioQuery();
  var isCheckingPermission = true.obs;

  @override
  void onInit() {
    super.onInit();
    checkPermission();
  }

  checkPermission() async {
    isCheckingPermission.value = true;
    var perm = await Permission.storage.request();
    if (perm.isGranted) {
      // Izin diberikan
    } else {
      checkPermission();
    }
    isCheckingPermission.value = false;
  }
}
