import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teplo_voda_store/pages/home/home_view.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  bool isCodeSent = false; // Для отображения поля ввода кода

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Вход')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Войдите, чтобы реализовать все возможности",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                  labelText: 'Телефон',
                  hintText: 'XXXXXXXXXX',
                  prefixText: '+7'),
            ),
            if (isCodeSent) ...[
              const SizedBox(height: 16),
              TextField(
                controller: codeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Введите код',
                ),
              ),
            ],
            const SizedBox(height: 8),
            const Text(
              "Отправим SMS-сообщение с кодом подтверждения",
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Эмуляция отправки кода
                setState(() {
                  isCodeSent = true;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content:
                          Text('Код отправлен на указанный номер телефона')),
                );
              },
              child: const Text('Получить код'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomeView()),
                );
              },
              child: const Text('Продолжить без регистрации'),
            ),
            const SizedBox(height: 16),
            const Text(
              "Вводя телефон вы даете согласие на обработку персональных данных",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
