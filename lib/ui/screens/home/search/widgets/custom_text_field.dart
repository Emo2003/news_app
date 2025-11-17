import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Function(String)? onChanged;
  final void Function()? onPressed;
  final TextEditingController controller;

  const CustomTextField({super.key,
    required this.onChanged,
    required this.controller,
    required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller:controller,
      decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          prefixIcon: const Icon(Icons.search, size: 27,),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          suffixIcon: IconButton(
              onPressed: () {
                onPressed!();
              },
              icon: const Icon(Icons.close_outlined, size: 27))
      ),

    );
  }
}
