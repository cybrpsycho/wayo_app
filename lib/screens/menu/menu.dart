import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        clipBehavior: Clip.none,
        slivers: [
          SliverAppBar(
            pinned: true,
            title: const Text('Menu'),
            actions: [
              AspectRatio(
                aspectRatio: 1,
                child: IconButton(
                  tooltip: 'Notifications',
                  onPressed: () => context.goNamed('notifications'),
                  icon: const Icon(Icons.notifications_rounded),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: AspectRatio(
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
                            Text('WAYO'),
                            SizedBox(height: 8),
                            Text('Brief info about Wayo'),
                            SizedBox(height: 16),
                            Text('TAP TO FIND OUT MORE'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                leading: const Icon(Icons.call_rounded),
                title: const Text('Call us on 0712345678'),
                contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.email_rounded),
                title: const Text('Send us an email at mail@wayo.com'),
                contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.policy_rounded),
                title: const Text('Policies'),
                contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                onTap: () {},
              ),
              const ListTile(
                dense: true,
                title: Center(child: Text('App Version 1.0.0')),
                contentPadding: EdgeInsets.symmetric(horizontal: 24),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
