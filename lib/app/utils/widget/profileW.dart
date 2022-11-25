import 'package:flutter/material.dart';
import 'package:task_management_app/app/utils/style/AppColors.dart';
import 'package:get/get.dart';

class ProfileW extends StatelessWidget {
  const ProfileW({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: !context.isPhone ?
       Row(
        children: [
          const Expanded(
            flex: 1,
            child: ClipRRect(
                    child: CircleAvatar(
                      backgroundColor: Colors.amber, 
                      radius: 150, 
                      foregroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1031&q=80'),
                    ),
                    ),
                   ),
            const SizedBox(width: 20,),

      Expanded(
        flex: 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Nico Firmansyah', 
              style: TextStyle(
              color: AppColors.primaryText, 
              fontSize: 40,
              ),
              ),
              Text(
              'nicofirmansyah057@gmail.com', 
              style: TextStyle(
              color: AppColors.primaryText, 
              fontSize: 16,
              ),
              ),
          ],
        ),
      ),
        ],
      )
      :Center(
        child: Column(
          children: const [
             SizedBox(
             height: 40,
              ),
            ClipRRect(
                    child: CircleAvatar(
                      backgroundColor: Colors.amber, 
                      radius: 150, 
                      foregroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1031&q=80'),
                    ),
                    ),
              SizedBox(
                height: 20,
                ),
        Text(
          'Nico Firmansyah', 
          style: TextStyle(
          color: AppColors.primaryText, 
          fontSize: 40,
          ),
          ),
          Text(
          'nicofirmansyah057@gmail.com', 
          style: TextStyle(
          color: AppColors.primaryText, 
          fontSize: 16,
          ),
          ),
          ],
        ),
      ),
      
      );
  }
}