import 'package:flutter/material.dart';
import 'package:trilhaapp/model/settings.dart';
import 'package:trilhaapp/repositories/settings_repository.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late SettingsRepository settingsRepository;
  Settings settings = Settings.empty();

  final TextEditingController _usernameController =
      TextEditingController(text: "");

  final TextEditingController _heightController =
      TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    settingsRepository = await SettingsRepository.load();
    settings = settingsRepository.getData();

    _usernameController.text = settings.username;
    _heightController.text = settings.height.toString();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text("Configurações")),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: const InputDecoration(hintText: "Nome do usuário:"),
              controller: _usernameController,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: const InputDecoration(hintText: "Altura:"),
              keyboardType: TextInputType.number,
              controller: _heightController,
            ),
          ),
          const SizedBox(height: 16),
          SwitchListTile(
            title: const Text('Receber Notificações'),
            value: settings.notifyMe,
            onChanged: (bool value) {
              setState(() {
                settings.notifyMe = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Tema escuro'),
            value: settings.isDarkMode,
            onChanged: (bool value) {
              setState(() {
                settings.isDarkMode = value;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextButton(
              onPressed: () async {
                FocusManager.instance.primaryFocus!.unfocus();
                try {
                  settings.height = double.parse(_heightController.text);
                } catch (e) {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          title: const Text('Meu App'),
                          content: const Text('Informe uma altura válida!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('ok'),
                            ),
                          ],
                        );
                      });
                  return;
                }

                settings.username = _usernameController.text;
                settingsRepository.save(settings);

                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: const Text('Meu App'),
                        content: const Text('Salvo com sucesso!'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('ok'),
                          ),
                        ],
                      );
                    });
              },
              style: TextButton.styleFrom(backgroundColor: Colors.deepPurple),
              child: const Text(
                "Salvar",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
