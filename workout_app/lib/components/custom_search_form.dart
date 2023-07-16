import 'package:flutter/material.dart';

class CustomSearchForm extends StatefulWidget {
  const CustomSearchForm({super.key});

  @override
  State<CustomSearchForm> createState() => _CustomSearchFormState();
}

class _CustomSearchFormState extends State<CustomSearchForm> {
  final _formKey = GlobalKey<FormState>();
  String inputValue = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SizedBox(
        width: 300,
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              onChanged: (value) {
                setState(() {
                  inputValue = value;
                });
                print(inputValue);
              },
            ),
            ElevatedButton(onPressed: () {}, child: const Icon(Icons.search)),
          ],
        ),
      ),
    );
  }
}
