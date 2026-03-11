import 'package:ateam_software_test/common/config.dart';
import 'package:ateam_software_test/di/di.dart';
import 'package:ateam_software_test/presentation/app.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDelegate {
  static Future<dynamic> run() async {
    WidgetsFlutterBinding.ensureInitialized();

    await ScreenUtil.ensureScreenSize();
    await dotenv.load(fileName: 'assets/.env');

    Config.instance.setup(dotenv.env);
    await configureDependencies();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    runApp(const App());
  }
}
