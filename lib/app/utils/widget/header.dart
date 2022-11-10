import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:task_management_app/app/routes/app_pages.dart';

class header extends StatelessWidget {
  const header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center,  
        children: [
        Column(
         // mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
        children:const [
          Text(
            'Task Management' ,
            style: TextStyle(fontSize: 30, color: Colors.grey),
            ),
          Text(
            'Manage Task Made Easy With Friends',
             style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
        ],
        ),
         const Spacer(flex: 1,),
        Expanded(
          flex: 1,
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: 
              const EdgeInsets.only(left: 40, right: 30),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.blue),
              ),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              hintText: 'Search',
            ),
          ),
          ),
          const SizedBox(
            width: 20,
          ),
          const Icon(Iconsax.notification, color: Colors.grey),
          const SizedBox(
            width: 20,
          ),
         GestureDetector  (
          onTap: () {
            Get.defaultDialog(title: 'Sign Out',
            content: const Text('Are You Sure Want to Sign Out?'),
            cancel: ElevatedButton(
              onPressed:() => Get.back(),
               child: const Text('Cancel'),
               ),
               confirm: ElevatedButton(
              onPressed:() => Get.toNamed(Routes.LOGIN),
               child: const Text('Sign Out'),
               ),
            );
          },
            child: Row(
              children: const [
                 Text('Sign Out', style: TextStyle(color: Colors.grey),),
                 SizedBox(
              width: 5,
            ),
             Icon(Iconsax.logout, color: Colors.grey),
              ],
            ),
          ),
          
          ]),
      ),
    );
  }
}
