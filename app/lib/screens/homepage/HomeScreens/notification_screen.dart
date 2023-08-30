import 'package:flutter/material.dart';
import 'package:wellbe/widgets/custom_text.dart';

import '../../../utilites/colors.dart';
import '../../../widgets/custom_inkwell_btn.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        leading: CustomInkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/icons/arrow_back_02.png",
              scale: 1.1,
            ),
          ),
        ),
        title: CustomText(
          title: "Notifications",
          fontSize: 16,
          color: blackColor,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: ListView(
        children: [
          _buildNotificationCard(
            title: 'New Message',
            subtitle: 'You have a new message from John Doe',
            icon: Icons.message,
            color: Colors.blue,
          ),
          _buildNotificationCard(
            title: 'New Like',
            subtitle: 'Your post received a new like from your follower',
            icon: Icons.thumb_up,
            color: Colors.green,
          ),
          _buildNotificationCard(
            title: 'New Follower',
            subtitle: 'You have a new follower in your friend list',
            icon: Icons.person_add,
            color: Colors.orange,
          ),
          _buildNotificationCard(
            title: 'New Comment',
            subtitle: 'Your post received a new comment',
            icon: Icons.comment,
            color: Colors.red,
          ),
          _buildNotificationCard(
            title: 'Friend Request',
            subtitle: 'You have a new friend request',
            icon: Icons.person_add,
            color: Colors.purple,
          ),
          _buildNotificationCard(
            title: 'Event Reminder',
            subtitle: 'You have an upcoming event tomorrow',
            icon: Icons.event,
            color: Colors.teal,
          ),
          _buildNotificationCard(
            title: 'New Task',
            subtitle: 'You have a new task assigned',
            icon: Icons.assignment,
            color: Colors.amber,
          ),
          _buildNotificationCard(
            title: 'Payment Received',
            subtitle: 'You received a payment of \$50',
            icon: Icons.attach_money,
            color: Colors.lightBlue,
          ),
          _buildNotificationCard(
            title: 'New Announcement',
            subtitle: 'Important announcement regarding the project',
            icon: Icons.announcement,
            color: Colors.redAccent,
          ),
          _buildNotificationCard(
            title: 'New Request',
            subtitle: 'You have a new request pending',
            icon: Icons.check_circle_outline,
            color: Colors.yellow,
          ),
          _buildNotificationCard(
            title: 'New Task',
            subtitle: 'A new task has been assigned to you',
            icon: Icons.assignment,
            color: Colors.indigo,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      elevation: 4,
      color: kPrimaryColor,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        title: CustomText(
          title: title,
          fontWeight: FontWeight.bold,
        ),
        subtitle: CustomText(
          title: subtitle,
          fontSize: 12,
          color: textGreyColor2,
        ),
      ),
    );
  }
}
