import 'package:get/get.dart';
import 'package:getx/api_service.dart';
import 'package:getx/models.dart';

class UserController extends GetxController {
  var isLoading = true.obs;
  var userList = <UserModel>[].obs;

  fetchUsers() async {
    try {
      isLoading(true);
      var userData = await ApiService().fetchUserData();
      userList.addAll(userData);
    } catch (e) {
      print("error fetching users data $e");
    } finally {
      isLoading(false);
    }
  }

  void onInit() {
    fetchUsers();
    super.onInit();
  }
}
