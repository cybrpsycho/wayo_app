import "package:url_launcher/url_launcher.dart";

class LauncherService {
  Future<bool> launchDialer(String phoneNumber) async {
    final url = Uri.parse("tel:$phoneNumber");

    return await launchUrl(url);
  }

  Future<bool> launchMailer(String email) async {
    final url = Uri.parse("mailto:$email");

    return await launchUrl(url);
  }

  Future<bool> launchBrowser(String link) async {
    final url = Uri.parse(link);

    return await launchUrl(url);
  }
}
