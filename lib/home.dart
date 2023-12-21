import 'package:bento_umeezo/misc/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'detail_screen.dart';
import 'model/bento_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<BentoModel> displayList = List.from(bentoList);

  void updateList(String value) {
    setState(() {
      displayList = bentoList
          .where((element) =>
              element.bentoTitle.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            // search bar
            Container(
              margin: const EdgeInsets.only(left: 25, right: 25, top: 5),
              child: TextField(
                onChanged: (value) => updateList(value),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none),
                    hintText: 'Cari makanan...',
                    prefixIcon: ImageIcon(
                      const AssetImage('images/ic-search.png'),
                      color: AppColors.cardColorDarkGrey,
                      size: 24,
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // list bento
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
                  child: InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailScreen(
                          bento: displayList[index],
                        );
                      }));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.cardColorDarkGrey,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Hero(
                                tag: displayList[index].image,
                                child: Container(
                                    padding: const EdgeInsets.only(
                                        top: 17,
                                        right: 17,
                                        left: 17,
                                        bottom: 7),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: CachedNetworkImage(
                                          imageUrl: displayList[index].image,
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                              CircularProgressIndicator(
                                                  value: downloadProgress
                                                      .progress),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        )))),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    displayList[index].bentoTitle,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 17, right: 17, bottom: 17),
                                    child: Text(
                                      displayList[index].deskripsiBento,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 5,
                                      textAlign: TextAlign.justify,
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: displayList.length,
            ))
          ],
        ),
      ),
    );
  }
}
