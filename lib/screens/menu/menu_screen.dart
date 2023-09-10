import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:sliver_tools/sliver_tools.dart";
import "package:url_launcher/url_launcher.dart";
import "package:wayo/widgets/frosted_appbar.dart";

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          const SliverPinnedHeader(child: FrostedAppBar()),
        ];
      },
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Stack(
              children: [
                const Placeholder(),
                Center(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text("WAYO"),
                          SizedBox(height: 8),
                          Text("Brief info about Wayo"),
                          SizedBox(height: 16),
                          Text("TAP TO FIND OUT MORE"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          ListTile(
            leading: const Icon(Icons.call_rounded),
            title: const Text("Call Us"),
            contentPadding: const EdgeInsets.symmetric(horizontal: 24),
            onTap: () => _launchDialer("+254712345678"),
          ),
          ListTile(
            leading: const Icon(Icons.email_rounded),
            title: const Text("Send Us An Email"),
            contentPadding: const EdgeInsets.symmetric(horizontal: 24),
            onTap: () => _launchMailer("info@wayo.site"),
          ),
          ListTile(
            leading: const Icon(Icons.settings_rounded),
            title: const Text("Settings"),
            contentPadding: const EdgeInsets.symmetric(horizontal: 24),
            onTap: () => context.goNamed("settings"),
          ),
          ListTile(
            leading: const Icon(Icons.policy_rounded),
            title: const Text("Policies"),
            contentPadding: const EdgeInsets.symmetric(horizontal: 24),
            onTap: () => context.goNamed("legal"),
          ),
          const ListTile(
            dense: true,
            title: Center(child: Text("App Version 1.0.0")),
            contentPadding: EdgeInsets.symmetric(horizontal: 24),
          ),
        ],
      ),
    );
  }

  Future<void> _launchDialer(String phoneNumber) async {
    final url = Uri.parse("tel:$phoneNumber");

    if (!await launchUrl(url)) throw Exception("Could not launch phone app");
  }

  Future<void> _launchMailer(String email) async {
    final url = Uri.parse("mailto:$email");

    if (!await launchUrl(url)) throw Exception("Could not launch email app");
  }
}
