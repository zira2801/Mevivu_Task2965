import 'package:flutter/material.dart';
import 'package:task_1/page_tab/bookmark.dart';
import 'package:task_1/page_tab/help.dart';
import 'package:task_1/page_tab/home.dart';
import 'package:task_1/page_tab/message.dart';
import 'package:task_1/page_tab/nearby.dart';
import 'package:task_1/page_tab/notification.dart';
import 'package:task_1/page_tab/profile.dart';
import 'package:task_1/page_tab/setting.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int _selectedIndex = 0;
  int _selectedDrawerIndex = 0;

  final List<String> _titles = [
    "Home",
    "Profile",
    "Nearby",
    "Bookmark",
    "Notification",
    "Message",
    "Setting",
    "Help",
  ];

  _loadWidget(int index) {
    var nameWidgets = "Home";
    switch (index) {
      case 0:
        return const HomeBuilder();
      case 1:
        return const ProfileBuilder();
      case 2:
        return const NearbyBuilder();
      case 3:
        return const BookmarkBuilder();
      case 4:
        return const NotificationBuilder();
      case 5:
        return const MessageBuilder();
      case 6:
        return const SettingBuilder();
      case 7:
        return const HelpBuilder();
      default:
        nameWidgets = "None";
        break;
    }
    return 0;
  }

  _onSelectItem(int index) {
    setState(() {
      _selectedDrawerIndex = index;
      _selectedIndex = index;
    });
    Navigator.pop(context); // close the drawer
  }

  Widget _buildDrawerItem(
      {required IconData icon,
      required String title,
      required int index,
      bool showDot = false}) {
    bool isSelected = _selectedDrawerIndex == index;
    return Padding(
      padding: const EdgeInsets.only(right: 120),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: ListTile(
          iconColor:
              isSelected ? const Color.fromRGBO(10, 142, 217, 1) : Colors.white,
          leading: Stack(
            children: [
              Icon(icon,
                  size: 24,
                  color: isSelected
                      ? const Color.fromRGBO(10, 142, 217, 1)
                      : Colors.white),
              if (showDot)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
          title: Text(
            title,
            style: TextStyle(
                color: isSelected ? Colors.blue : Colors.white, fontSize: 18),
          ),
          onTap: () => _onSelectItem(index),
        ),
      ),
    );
  }

  Widget _buildDrawerMessage(
      {required String imageAsset,
      required String title,
      required int index,
      bool showDot = false}) {
    bool isSelected = _selectedDrawerIndex == index;
    return Padding(
      padding: const EdgeInsets.only(right: 120),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: ListTile(
          iconColor:
              isSelected ? const Color.fromRGBO(10, 142, 217, 1) : Colors.white,
          leading: Stack(
            children: [
              Image.asset(
                imageAsset,
                color: isSelected
                    ? const Color.fromRGBO(10, 142, 217, 1)
                    : Colors.white,
                width: 24, // Điều chỉnh kích thước nếu cần
                height: 24, // Điều chỉnh kích thước nếu cần
              ),
              if (showDot)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
          title: Text(
            title,
            style: TextStyle(
                color: isSelected ? Colors.blue : Colors.white, fontSize: 16),
          ),
          onTap: () => _onSelectItem(index),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_titles[_selectedIndex]),
        ),
        drawer: Drawer(
          child: Container(
            decoration:
                const BoxDecoration(color: Color.fromRGBO(0, 142, 217, 1)),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(
                  height: 100,
                ),
                _buildDrawerItem(icon: Icons.home, title: 'Home', index: 0),
                const SizedBox(
                  height: 20,
                ),
                _buildDrawerItem(
                    icon: Icons.person_outline, title: 'Profile', index: 1),
                const SizedBox(
                  height: 20,
                ),
                _buildDrawerItem(
                    icon: Icons.location_on_outlined,
                    title: 'Nearby',
                    index: 2),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  height: 1,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 20,
                ),
                _buildDrawerItem(
                    icon: Icons.bookmark_border_outlined,
                    title: 'Bookmark',
                    index: 3),
                const SizedBox(
                  height: 20,
                ),
                _buildDrawerItem(
                    icon: Icons.notifications_outlined,
                    title: 'Notification',
                    index: 4,
                    showDot: true), // Thêm chấm đỏ ở đây
                const SizedBox(
                  height: 20,
                ),
                _buildDrawerMessage(
                  imageAsset:
                      'assets/chat_outline.png', // Đường dẫn đến hình ảnh
                  title: 'Message',
                  index: 5,
                  showDot: true, // Thêm chấm đỏ ở đây
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  height: 1,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 20,
                ),
                _buildDrawerItem(
                    icon: Icons.settings_outlined, title: 'Setting', index: 6),
                const SizedBox(
                  height: 20,
                ),
                _buildDrawerItem(
                    icon: Icons.help_outline, title: 'Help', index: 7),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  iconColor: Colors.white,
                  leading:
                      const Icon(Icons.logout_outlined, color: Colors.white),
                  title: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _selectedIndex = 0;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
        body: _loadWidget(_selectedIndex));
  }
}
