import 'package:flutter/material.dart';
import 'package:trilhaapp/model/info_detail.dart';
import 'package:trilhaapp/pages/info_detail_page.dart';
import 'package:trilhaapp/repositories/info_detail_repository.dart';

class ExampleOnePage extends StatefulWidget {
  const ExampleOnePage({super.key});

  @override
  State<ExampleOnePage> createState() => _ExampleOnePageState();
}

class _ExampleOnePageState extends State<ExampleOnePage> {
  InfoDetail? infoDetail;
  var infoDetailRepository = InfoDetailRepository();

  void loadInfoDetailData() async {
    infoDetail = await infoDetailRepository.get();

    if (!mounted) return;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadInfoDetailData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          width: double.infinity,
          child: infoDetail == null
              ? const LinearProgressIndicator()
              : InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InfoDetailPage(
                          infoDetail: infoDetail!,
                        ),
                      ),
                    );
                  },
                  child: Hero(
                    tag: infoDetail!.id,
                    child: Card(
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  infoDetail!.url,
                                  height: 20,
                                ),
                                Text(
                                  infoDetail!.title,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              infoDetail!.text,
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                child: const Text("Leia mais"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
