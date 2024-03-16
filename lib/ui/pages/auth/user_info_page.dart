import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  final _nameController = TextEditingController();
  @override
  void dispose() {
    _nameController.dispose();
    _btnController.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeMQ = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Информация о пользователе',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    child: FlutterLogo(),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                      radius: 15,
                      child: Icon(
                        CupertinoIcons.photo_camera,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: sizeMQ.height * 0.05),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(14),
                  prefixIcon: Icon(CupertinoIcons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  labelText: 'Имя',
                ),
              ),
              SizedBox(height: sizeMQ.height * 0.05),
              SizedBox(
                width: double.infinity,
                child: RoundedLoadingButton(
                  controller: _btnController,
                  color: Colors.blueGrey.shade700,
                  onPressed: () {
                    /// сохранить информацию о юзере
                  },
                  successIcon: CupertinoIcons.check_mark,
                  successColor: Colors.green,
                  errorColor: Colors.redAccent,
                  failedIcon: CupertinoIcons.exclamationmark_bubble,
                  child: const Text(
                    'Сохранить',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
