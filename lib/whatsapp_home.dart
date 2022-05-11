import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsappclone/main.dart';
import 'package:whatsappclone/screens/call_screen.dart';
import 'package:whatsappclone/screens/camera_screen.dart';
import 'package:whatsappclone/screens/chat_screen.dart';
import 'package:whatsappclone/screens/status_screen.dart';
import 'package:whatsappclone/utils/constants.dart';

class WhatsAppHome extends StatefulWidget {
  final List<CameraDescription>? cameras;

  const WhatsAppHome({Key? key, this.cameras}) : super(key: key);

  @override
  State<WhatsAppHome> createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with TickerProviderStateMixin {
  TabController? _tabController;
  bool showFab = true;
  bool showFabEdit = false;
  int tabIndex = 1;
  Icon fabIcon = const Icon(
    Icons.message,
    color: Colors.white,
  );
  late AnimationController controller;
  Animation? animation;
  late Animation<Offset> offset;
  List<String> optionMenu = Constants.chatsMenu;
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text(Constants.appName);
  bool hideOptionMenu = true;
  Color appBarColor= const Color(0xff075E54);

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 10));
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    offset = Tween<Offset>(begin: Offset.zero, end: const Offset(0.0, 1.0))
        .animate(controller);
    controller.forward();
    _tabController = TabController(vsync: this, initialIndex: 1, length: 4);
    _tabController?.addListener(() {
      if (_tabController?.index == 1) {
        tabIndex = 1;
        optionMenu = Constants.chatsMenu;
        showFab = true;
        showFabEdit = false;
        controller.forward();
        fabIcon = const Icon(
          Icons.message,
          color: Colors.white,
        );
      } else if (_tabController?.index == 2) {
        tabIndex = 2;
        optionMenu = Constants.statusMenu;
        showFab = true;
        showFabEdit = true;
        controller.reverse();
        fabIcon = const Icon(
          Icons.camera_alt,
          color: Colors.white,
        );
      } else if (_tabController?.index == 3) {
        tabIndex = 3;
        optionMenu = Constants.callMenu;
        showFab = true;
        showFabEdit = false;
        controller.forward();
        fabIcon = const Icon(
          Icons.add_call,
          color: Colors.white,
        );
      } else {
        tabIndex = 0;
        optionMenu = Constants.emptyMenu;
        showFab = false;
        showFabEdit = false;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    void _selectedOptionMenu(String choice) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("You have clicked on $choice")));
    }

    return Scaffold(
        appBar: AppBar(
          title: customSearchBar,
          backgroundColor: appBarColor,
          elevation: 0.7,
          bottom: hideOptionMenu ? TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            tabs: const [
              Tab(
                icon: Icon(Icons.camera_alt),
              ),
              Tab(
                text: "CHATS" ,
              ),
              Tab(
                text: "STATUS",
              ),
              Tab(
                text: "CALLS",
              )
            ],
          ) : null,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    if (customIcon.icon == Icons.search) {
                      customIcon = const Icon(null);
                      appBarColor=const Color(0xffffffff);
                      hideOptionMenu=false;
                      customSearchBar = ListTile(
                        leading: InkWell(
                          onTap: (){
                            setState(() {
                              hideOptionMenu=true;
                              appBarColor= const Color(0xff075E54);
                              customIcon = const Icon(Icons.search);
                              customSearchBar = const Text("ChatApp");
                            });
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.grey,
                            size: 25,
                          ),
                        ),
                        title: const TextField(
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      );
                    } else {
                      hideOptionMenu=true;
                      appBarColor= const Color(0xff075E54);
                      customIcon = const Icon(Icons.search);
                      customSearchBar = const Text("ChatApp");
                    }
                  });
                },
                icon: customIcon),
            hideOptionMenu
                ? PopupMenuButton(
                    onSelected: _selectedOptionMenu,
                    itemBuilder: (BuildContext context) {
                      return optionMenu.map((String choice) {
                        return PopupMenuItem(
                          value: choice,
                          child: Text(
                            choice,
                            style: const TextStyle(fontSize: 14),
                          ),
                        );
                      }).toList();
                    })
                : Container(),
          ],
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            CameraScreen(cameras: cameras),
            const ChatScreen(),
            const StatusScreen(),
            const CallsScreen(),
          ],
        ),
        floatingActionButton: showFab
            ? Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (showFabEdit)
                    SlideTransition(
                      position: offset,
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: FittedBox(
                          child: FloatingActionButton(
                            onPressed: () => print("Open status edit"),
                            backgroundColor: Colors.grey,
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  else
                    const SizedBox(),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: FittedBox(
                      child: FloatingActionButton(
                        onPressed: () => print("Open Chats"),
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        child: fabIcon,
                      ),
                    ),
                  ),
                ],
              )
            : null);
  }
}
