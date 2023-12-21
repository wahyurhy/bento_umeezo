import 'package:bento_umeezo/misc/colors.dart';
import 'package:bento_umeezo/model/bento_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final BentoModel bento;

  const DetailScreen({super.key, required this.bento});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cardColorDarkGrey,
      appBar: AppBar(
        backgroundColor: AppColors.cardColorDarkGrey,
        title: Text(
          bento.bentoTitle,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const ImageIcon(
            AssetImage("images/icon-back.png"), color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  // image
                  Hero(
                    tag: bento.image,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(bento.image)),
                  ),
                  // deskripsi
                  Container(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, top: 20, bottom: 15),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: Text(
                        bento.deskripsiBento,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  // bahan-bahan
                  const Text(
                    'Bahan-bahan',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.only(
                          left: 25, right: 25, top: 5, bottom: 5),
                      child: Text(
                        bento.bahanBahan,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      )),
                  // tahap-tahap
                  const Text(
                    'Cara membuat',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  for (int i = 0; i < bento.tahapTahap.length; i++) ...{
                    for (int j = 0; j < bento.tahapTahap[1].length; j++) ...{
                      if (bento.tahapTahap[j] == bento.tahapTahap[0]) ...[
                        Text('Langkah ${i + 1}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        Container(
                            width: double.maxFinite,
                            padding: const EdgeInsets.only(
                                left: 25, right: 25, top: 5, bottom: 5),
                            child: Text(
                              bento.tahapTahap[i][j],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ))
                      ],
                      SizedBox(
                        height: 250,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: bento.tahapImages[i].map((url) {
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    imageUrl: url,
                                    progressIndicatorBuilder: (context, url,
                                        downloadProgress) =>
                                        CircularProgressIndicator(
                                            value:
                                            downloadProgress.progress),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                              );
                            }).toList(),
                        ),
                      )

                    }
                  }
                  // referensi
                  ,
                  Container(
                    padding: const EdgeInsets.all(25),
                    child: SelectableText(
                      "Referensi Resep: ${bento.referensi}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 14),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
