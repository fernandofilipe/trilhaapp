import 'package:flutter/material.dart';
import 'package:trilhaapp/repositories/languages_respository.dart';
import 'package:trilhaapp/repositories/level_repository.dart';
import 'package:trilhaapp/shared/widgets/text_label.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _nameController = TextEditingController(text: "");
  final _birthDateController = TextEditingController(text: "");
  DateTime? birthDate;

  var levels = [];
  LevelRepository levelRepository = LevelRepository();
  var selectedLevel = "";

  var languages = [];
  LanguagesRepository languageRepository = LanguagesRepository();
  List<dynamic> selectedLanguages = [];

  var chosenWage = 0.0;
  int timeExperience = 0;

  bool saving = false;

  @override
  void initState() {
    super.initState();
    levels = levelRepository.getLevels();
    languages = languageRepository.getLanguages();
  }

  List<DropdownMenuItem> getExperienceItems(int listSize) {
    var experienceItems = <DropdownMenuItem>[];

    for (var i = 0; i < listSize; i++) {
      experienceItems.add(DropdownMenuItem(
        value: i,
        child: Text("$i"),
      ));
    }

    return experienceItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: saving
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  const TextLabel(text: "Nome:"),
                  TextField(
                    controller: _nameController,
                  ),
                  const TextLabel(text: "Data de Nascimento:"),
                  TextField(
                    readOnly: true,
                    controller: _birthDateController,
                    onTap: () async {
                      var selectedBirthDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime(2000, 1, 1),
                          firstDate: DateTime(1900, 1, 1),
                          lastDate: DateTime(2023, 10, 23));
                      debugPrint(selectedBirthDate.toString());

                      _birthDateController.text =
                          birthDate != null ? selectedBirthDate.toString() : "";

                      birthDate = selectedBirthDate;
                    },
                  ),
                  const TextLabel(text: "Nível de Experiência:"),
                  Column(
                    children: levels
                        .map((level) => RadioListTile(
                            title: Text(level),
                            value: level,
                            selected: selectedLevel == level,
                            groupValue: selectedLevel,
                            onChanged: (value) {
                              debugPrint(value.toString());
                              setState(() {
                                selectedLevel = value;
                              });
                            }))
                        .toList(),
                  ),
                  const TextLabel(text: "Linguagens de Programação:"),
                  Column(
                      children: languages
                          .map(
                            (language) => CheckboxListTile(
                                title: Text(language),
                                value: selectedLanguages.contains(language),
                                onChanged: (isSelected) {
                                  setState(() {
                                    isSelected!
                                        ? selectedLanguages.add(language)
                                        : selectedLanguages.remove(language);

                                    debugPrint(selectedLanguages.toString());
                                  });
                                }),
                          )
                          .toList()),
                  const TextLabel(text: "Tempo de Experiência:"),
                  DropdownButton(
                      value: timeExperience,
                      isExpanded: true,
                      items: getExperienceItems(50),
                      onChanged: (chosenTime) {
                        setState(() {
                          timeExperience = chosenTime!;
                        });
                        debugPrint(chosenTime.toString());
                      }),
                  TextLabel(
                      text:
                          "Pretenção Salarial: R\$ ${chosenWage.toStringAsFixed(2)}"),
                  Slider(
                      min: 0,
                      max: 10000,
                      value: chosenWage,
                      onChanged: (double value) {
                        setState(() {
                          chosenWage = value;
                        });
                        debugPrint(value.toString());
                      }),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          saving = false;
                        });
                        if (_nameController.text.trim().length < 3) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "O nome deve conter ao menos 3 caracteres.")));
                          return;
                        }

                        if (birthDate == null) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "A data de nascimento deve ser selecionada.")));
                          return;
                        }

                        if (selectedLevel.trim() == "") {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  "O nível de experiência deve ser selecionada.")));
                          return;
                        }

                        if (selectedLanguages.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Selecione ao menos uma linguagem.")));
                          return;
                        }

                        if (timeExperience == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Escolha o seu tempo de experiência.")));
                          return;
                        }

                        if (chosenWage == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Escolha a sua pretenção salarial.")));
                          return;
                        }

                        debugPrint(_nameController.text);
                        debugPrint(birthDate.toString());
                        debugPrint(selectedLevel);
                        debugPrint(selectedLanguages.toString());
                        debugPrint(timeExperience.toString());
                        debugPrint(chosenWage.toString());

                        setState(() {
                          saving = true;
                        });

                        Future.delayed(const Duration(seconds: 3), () {
                          setState(() {
                            saving = false;
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Dados salvos com sucesso!")));
                        });
                      },
                      child: const Text("Salvar"))
                ],
              ),
      ),
    );
  }
}
