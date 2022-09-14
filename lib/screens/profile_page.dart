import 'package:flutter/material.dart';
import 'package:notely/utils/util.dart';

class ProfilePage extends StatefulWidget {
  static const id = 'profilePage';
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Helper.titleAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 80,
                backgroundColor: const Color.fromARGB(255, 237, 203, 196),
                child: Image.asset('assets/images/Mask Group 1.png')),
            const SizedBox(height: 20),
            Column(
              children: [
                Text(
                  'Shambhavi Mishra',
                  style: AppTheme.titleTextStyle2,
                ),
                Text(
                  'Lucknow, India',
                  style: AppTheme.textStyle,
                ),
                const ProfileTile(
                  title: 'Buy Premium',
                  icon: AppIcons.premium_icon,
                ),
                const ProfileTile(
                  title: 'Edit Profile',
                  icon: AppIcons.edit_icon,
                ),
                ProfileTile(
                  title: 'App Theme',
                  icon: AppIcons.theme_icon,
                ),
                ProfileTile(
                  title: 'Notification',
                  icon: AppIcons.notification_icon,
                ),
                ProfileTile(
                  title: 'Security',
                  icon: AppIcons.security_icon,
                ),
                ProfileTile(
                  title: 'Log Out',
                  icon: AppIcons.logout_icon,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final Widget icon;
  final String title;
  const ProfileTile({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Container(
          height: 36,
          width: 36,
          decoration: const BoxDecoration(
            color: AppTheme.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: icon,
        ),
        title: Text(
          title,
          style: AppTheme.textStyle,
        ),
        trailing: AppIcons.forward_icon,
      ),
    );
  }
}
