import "package:flutter/material.dart";

class SearchInput extends StatelessWidget {
  final Function(String value)? onChanged;
  final Function(String value)? onSubmitted;

  const SearchInput({super.key, this.onChanged, this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Search for malls & stores",
        filled: false,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(48),
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(48),
          borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        suffixIcon: const Icon(Icons.search_rounded),
      ),
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
    );
  }
}
