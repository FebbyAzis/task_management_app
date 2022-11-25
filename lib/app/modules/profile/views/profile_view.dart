import 'dart:html';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_management_app/app/utils/style/AppColors.dart';
import 'package:task_management_app/app/utils/widget/header.dart';
import 'package:task_management_app/app/utils/widget/sideBar.dart';


import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: const SideBar(),
      backgroundColor: AppColors.primaryBg,
      body:Row(
      children: [
        !context.isPhone
         ? const Expanded(
          flex: 2,
          child:   SideBar()
          )
          :const SizedBox(),
        Expanded(
          flex: 15,
          child: Column(children: [
         !context.isPhone
          ? const header()
          : Container(padding: EdgeInsets.all(20),
         child: Row(children: [IconButton(onPressed: (){
          _drawerKey.currentState!.openDrawer();
         },
          icon: Icon(
            Icons.menu,
            color:AppColors.primaryText,
         ),
         ),
         const SizedBox(
          width: 15,
           ),
         Column(
         // mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
        children:const [
          Text(
            'Task Management' ,
            style: TextStyle(fontSize: 20, color: AppColors.primaryText),
            ),
          Text(
            'Manage Task Made Easy With Friends',
             style: TextStyle(fontSize: 14, color: AppColors.primaryText),
            ),
        ],
        ),
        const Spacer(),
        const Icon(Icons.notifications, 
        color: AppColors.primaryText, size: 30
        ),
        const SizedBox(
          width: 15,
           ),
        ClipRRect(borderRadius: BorderRadius.circular(30),
        child: const CircleAvatar(
          backgroundColor: Colors.amber,
          radius: 25,
          foregroundImage: NetworkImage('https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1031&q=80'),
        ),
        )
         ],
         ),
         ),
          //CONTENT /ISI PAGE / SCREEN
            Expanded(
              child: Container(
              padding: const EdgeInsets.all(50),
              margin: !context.isPhone
              ?const EdgeInsets.all(10)
              :const EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:!context.isPhone
                ? BorderRadius.circular(50)
                : BorderRadius.circular(30),
              ),
            ))
          ]),
            )
      ],)
    );
  }
}