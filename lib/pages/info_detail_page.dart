import 'package:flutter/material.dart';
import 'package:trilhaapp/model/info_detail.dart';

class InfoDetailPage extends StatelessWidget {
  final InfoDetail infoDetail;
  const InfoDetailPage({super.key, required this.infoDetail});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: infoDetail.id,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                ),
                Row(
                  children: [
                    Image.network(
                      infoDetail.url,
                      height: 100,
                    ),
                  ],
                ),
                Text(
                  infoDetail.title,
                  style: const TextStyle(
                      fontSize: 26, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Text(
                    infoDetail.text,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
