import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:update_to_do_app/core/utils/app_assets.dart';
import 'package:update_to_do_app/core/local/local_data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String userName =
        LocalData.userName ?? "Guest"; // Get username from Singleton

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Info Section
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(AppAssets.flagIcon),
              ),
              title: const Text(
                "Hello!",
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
              subtitle: Text(userName, style: const TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 30),

            // Options Section
            ProfileOption(
              icon: AppAssets.profileIcon,
              title: "Update Profile",
              onTap: () {},
            ),
            ProfileOption(
              icon: AppAssets.lockIcon,
              title: "Change Password",
              onTap: () {},
            ),
            ProfileOption(
              icon: AppAssets.settingIcon,
              title: "Settings",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable Profile Option Widget
class ProfileOption extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;

  const ProfileOption({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon, height: 24),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    );
  }
}
