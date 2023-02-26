import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/controller/home_controller.dart';
import 'package:note_app/view/screen/all_view.dart';
import 'package:note_app/view/screen/folder_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.settings),
                )
              ],
              leadingWidth: 0,
              leading: const SizedBox.shrink(),
              title: const Text('Notes'),
              bottom: const TabBar(
                tabs: [
                  Tab(
                    text: 'All Notes',
                  ),
                  Tab(
                    text: 'All Tasks',
                  ),
                ],
              )),
          body: TabBarView(
            children: [AllView(), FolderView()],
          ),
        ));
  }
}
