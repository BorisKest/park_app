import 'package:url_launcher/url_launcher.dart';

class Utils {
  static Future openLink({required Uri url}) => launchUrl(url);

  static Future lunchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}
