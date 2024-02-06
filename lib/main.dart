// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:i_baza/core/adaptor/hive_type_adaptor.dart';
// import 'package:i_baza/core/data_base/objectBox.dart';
// import 'package:i_baza/features/presintation/pages/login_screen/login_screen.dart';
// import 'package:i_baza/features/presintation/pages/profile/profile.dart';
// import 'core/injector/setup_locator/setup_locator.dart';
// import 'core/injector/stage_repository/storage_repository.dart';
//
// void main() async {
//   registerAdapters();
//   WidgetsFlutterBinding.ensureInitialized();
//   await StorageRepository.getInstance();
//   await HiveRepository.getInstance();
//   await LocalDataBase.getInstance();
//   await Hive.initFlutter();
//
//   var box = await Hive.openBox("profile_name");
//   var box2 = await Hive.openBox("profile_location");
//   var box3 = await Hive.openBox("profile_avatar");
//
//   runApp(const MainApp());
// }
//
// class MainApp extends StatefulWidget {
//   const MainApp({Key? key}) : super(key: key);
//
//   @override
//   State<MainApp> createState() => _MainAppState();
// }
//
// class _MainAppState extends State<MainApp> {
//   void _increment() async {
//     await StorageRepository.setStatus(true);
//     await HiveRepository.putName();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ProfileScreen(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'features/presintation/pages/login_screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue, // Set your desired theme color
      ),
      home: LoginScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          MobileScanner(
            controller: MobileScannerController(
              torchEnabled: true,
              facing: CameraFacing.back,
            ),
            onDetect: (barcodeCapture) {
              print(barcodeCapture.barcodes.first);
            },
          ),
          Center(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 5,
                  color: Colors.white10,
                ),
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
              ),
              child: Center(
                child: Text(
                  'Scan Here',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white10, // Text color
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
