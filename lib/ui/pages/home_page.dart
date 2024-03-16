import 'package:assistant_ai/ui/pages/groups/groups_page.dart';
import 'package:assistant_ai/ui/pages/people/people_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chats_list/chat_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final List _pages = const [
    ChatListPage(),
    GroupsPage(),
    PeoplePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chat',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 3,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              child: FlutterLogo(),
            ),
          )
        ],
      ),
      body: _pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        backgroundColor: Colors.blue.shade50,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blueGrey.shade900,
        unselectedItemColor: Colors.grey,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.group),
            label: 'Groups',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.globe),
            label: 'People',
          ),
        ],
      ),
    );
  }
}
