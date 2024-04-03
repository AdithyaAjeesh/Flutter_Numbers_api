import 'package:flutter/material.dart';
import 'package:flutter_numbers_api_app/controller.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FunctionProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Random Facts About Numbers'),
        centerTitle: true,
        backgroundColor: Colors.blue.withOpacity(0.7),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<FunctionProvider>(builder: (context, pro, child) {
              return Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(bottom: 50),
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(15)),
                height: 250,
                width: 250,
                child: Text(
                  pro.output,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              );
            }),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    controller: provider.numberController,
                    decoration: InputDecoration(
                      hintText: 'Enter a Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      final num = provider.numberController.text.trim();
                      provider.getAllData(number: num);
                    },
                    child: const Text('Check'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
