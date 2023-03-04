import 'package:flutter/material.dart';

class AdvertScreen extends StatefulWidget {
  const AdvertScreen({super.key});

  @override
  State<AdvertScreen> createState() => _AdvertScreenState();
}

class _AdvertScreenState extends State<AdvertScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('advert'));
  }
}
