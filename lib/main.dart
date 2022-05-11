import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsappclone/utils/constants.dart';
import 'package:whatsappclone/whatsapp_home.dart';

List<CameraDescription>? cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xff075E54),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color(0xff25D366)),
      ),
      home: WhatsAppHome(cameras: cameras),
    );
  }
}
