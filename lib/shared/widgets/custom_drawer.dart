import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:trilhaapp/pages/login_page.dart';
import 'package:trilhaapp/pages/profile_page.dart';
import 'package:trilhaapp/pages/random_numbers_page.dart';
import 'package:trilhaapp/pages/settings_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  Widget customNavItem(
      context, String title, Icon icon, VoidCallback customOnTap) {
    return InkWell(
      onTap: customOnTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        width: double.infinity,
        child: Row(
          children: [
            icon,
            const SizedBox(
              width: 5,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }

  void navigateTo(context, Widget page) {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  void raisePrivacyModal(context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        context: context,
        builder: (BuildContext builderContext) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            child: const Wrap(
              children: [
                Text(
                  "Termos de Uso e Privacidade",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          );
        });
  }

  Future raisePrivacySlidingSheet(context) => showSlidingBottomSheet(
        context,
        builder: (context) => SlidingSheetDialog(
          snapSpec: const SnapSpec(snappings: [0.4, 0.7]),
          builder: buildSheet,
        ),
      );

  Widget buildSheet(context, state) => Material(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: const Wrap(
            children: [
              Text(
                "Termos de Uso e Privacidade",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
      );

  Future showExitMessage(context) => showDialog(
        context: context,
        builder: (BuildContext buildContext) => AlertDialog(
          alignment: Alignment.centerLeft,
          elevation: 8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: const Text(
            "Meu App",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Wrap(
            children: [
              Text("Você está saindo do aplicativo."),
              Text("Deseja realmente sair?"),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Não")),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                child: const Text("Sim")),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  context: context,
                  builder: (BuildContext buildContext) {
                    return Wrap(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text("Câmera"),
                          leading: const Icon(Icons.camera_enhance),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text("Galeria"),
                          leading: const Icon(Icons.image_search),
                        ),
                      ],
                    );
                  });
            },
            child: UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.orange),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.network(
                    "https://hermes.digitalinnovation.one/assets/diome/logo.png"),
              ),
              accountName: const Text("Fernando Reis"),
              accountEmail: const Text("fernando.reis@gmail.com"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: [
                customNavItem(
                  context,
                  "Dados Cadastrais",
                  const Icon(Icons.person),
                  () => navigateTo(
                    context,
                    const ProfilePage(),
                  ),
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                customNavItem(
                  context,
                  "Configurações",
                  const Icon(Icons.settings),
                  () => navigateTo(
                    context,
                    const SettingsPage(),
                  ),
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                customNavItem(
                  context,
                  "Gerador de Números",
                  const Icon(Icons.numbers),
                  () => navigateTo(
                    context,
                    const RandomNumbersPage(),
                  ),
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                customNavItem(
                  context,
                  "Termos de Uso e Privacidade",
                  const Icon(Icons.file_copy_sharp),
                  () => raisePrivacySlidingSheet(context),
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                customNavItem(
                  context,
                  "Sair",
                  const Icon(Icons.exit_to_app),
                  () => showExitMessage(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
