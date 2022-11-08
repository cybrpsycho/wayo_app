import 'package:flutter/material.dart';
import 'package:wayo/screens/generic_widgets/custom_appbar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          title: 'Search',
          flexSpace: TextFormField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(48),
                  borderSide: BorderSide(color: Colors.grey[400]!),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                suffixIcon: const Icon(Icons.search_rounded)),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.all(16),
        //   child: ,
        // ),
        Expanded(child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              leading: const CircleAvatar(backgroundColor: Colors.blueGrey),
              title: Text('$index'),
              trailing: const CircleAvatar(backgroundColor: Colors.blueGrey),
            );
          },
        ))
      ],
    );
  }
}
