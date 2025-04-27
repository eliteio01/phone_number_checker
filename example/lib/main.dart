import 'package:flutter/material.dart';
import 'package:phone_number_checker/phone_number_checker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone Number Checker Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PhoneCheckerPage(),
    );
  }
}

class PhoneCheckerPage extends StatefulWidget {
  const PhoneCheckerPage({super.key});

  @override
  State<PhoneCheckerPage> createState() => _PhoneCheckerPageState();
}

class _PhoneCheckerPageState extends State<PhoneCheckerPage> {
  final TextEditingController _controller = TextEditingController();
  String? _networkResult;

  void _checkNetwork() {
    final number = _controller.text;
    final network = NetworkChecker.getNetwork(number);

    setState(() {
      _networkResult = network.name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Number Checker Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Enter Nigerian Phone Number',
                hintText: 'e.g. 08031234567 or +2348031234567',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkNetwork,
              child: const Text('Check Network'),
            ),
            const SizedBox(height: 30),
            if (_networkResult != null)
              Text(
                'Network: $_networkResult',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
