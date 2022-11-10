import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/app/routes/app_pages.dart';
import 'package:unicons/unicons.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5,
      child: Container(
        height: Get.height,
        color: Colors.blue[100],
         child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //logo
              Container(
                height: 100,
                padding: EdgeInsets.only(top: 50),
                width: double.infinity,
                alignment: Alignment.topCenter,
                  child: const Image(
                    image: AssetImage('assets/icons/icon.png'),
                    ),
                   ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 100,
                    child: Center(
                      child: InkWell(
                        child: Column(children: [
                          Container(
                            height: 40,
                            width: 100,
                            decoration: Get.currentRoute == '/home'
                            ? BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.white,
                              )
                              : BoxDecoration(),
                            child:  Icon(
                              Get.currentRoute == '/home'
                              ? UniconsLine.desktop
                              : UniconsLine.desktop_alt_slash,
                              color: Colors.grey,
                              size: 30),
                          ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text('Home',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16
                        ),
                        ),
                        ],
                        ),
                        onTap: () => Get.toNamed(Routes.HOME),
                        ),
                        ),
                  ),
                 
                 SizedBox(
                    height: 100,
                    child: Center(
                      child: InkWell(
                        child: Column(children: [
                          Container(
                            height: 40,
                            width: 100,
                            decoration: Get.currentRoute == '/task'
                            ? BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.white,
                              )
                              : BoxDecoration(),
                            child:  Icon(
                              Get.currentRoute == '/task'
                              ? UniconsLine.cube
                              : UniconsLine.cube,
                              color: Colors.grey,
                              size: 30),
                          ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text('Task',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16
                        ),
                        ),
                        ],
                        ),
                        onTap: () => Get.toNamed(Routes.TASK),
                        ),
                        ),
                  ),
                  SizedBox(
                    height: 100,
                    child: Center(
                      child: InkWell(
                        child: Column(children: [
                          Container(
                            height: 40,
                            width: 100,
                            decoration: Get.currentRoute == '/friends'
                            ? BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.white,
                              )
                              : BoxDecoration(),
                            child:  Icon(
                              Get.currentRoute == '/friends'
                              ? UniconsLine.heart
                              : UniconsLine.heart_alt,
                              color: Colors.grey,
                              size: 30),
                          ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text('Friends',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16
                        ),
                        ),
                        ],
                        ),
                        onTap: () => Get.toNamed(Routes.FRIENDS),
                        ),
                        ),
                  ),
                  SizedBox(
                    height: 100,
                    child: Center(
                      child: InkWell(
                        child: Column(children: [
                          Container(
                            height: 40,
                            width: 100,
                            decoration: Get.currentRoute == '/profile'
                            ? BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.white,
                              )
                              : BoxDecoration(),
                            child:  Icon(
                              Get.currentRoute == '/profile'
                              ? UniconsLine.user
                              : UniconsLine.user,
                              color: Colors.grey,
                              size: 30),
                          ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text('Profile',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16
                        ),
                        ),
                        ],
                        ),
                        onTap: () => Get.toNamed(Routes.PROFILE),
                        ),
                        ),
                  ),
                  ],
                ),
              ),
            ),
    );
  }
}
