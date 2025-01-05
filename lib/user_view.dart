import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller.dart';

class UserView extends StatefulWidget {
  UserView({super.key});

  final userController = Get.put(UserController());

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(() {
        if (widget.userController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: widget.userController.userList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                child: Container(
                  color: Colors.lightBlueAccent,
                  child: ListTile(
                    title: Text(widget.userController.userList[index].id.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
                    subtitle: Text(widget.userController.userList[index].name.toString(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.yellowAccent),),
                    trailing: Text(widget.userController.userList[index].data.toString(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
