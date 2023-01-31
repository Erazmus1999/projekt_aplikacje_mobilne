import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Firebase/database.dart';
import '../../Firebase/share_fridge.dart';
import 'fridge_item.dart';
import 'package:projekt_aplikacje_mobilne/config/extensions.dart';

class SharedFridgeContent extends StatelessWidget {
  final String userId;
  SharedFridgeContent({required this.userId});

  Future<List<String>> getSharedFridges() async {
    List<String> getShared = <String>[];
    getShared = await ShareFridge().getUserSharedFridges(userId);
    return getShared;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getSharedFridges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Expanded(
              child: snapshot.data!.isNotEmpty ? ListView(
                children: [
                  for (int i = 0; i < snapshot.data!.length; i++)
                    Column(
                      children: [
                        Text(
                          snapshot.data![i].substring(0,snapshot.data![i].indexOf("@")),
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        FutureBuilder(
                            future:
                                MyDatabase.getAllUserProducts(snapshot.data![i]),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return SizedBox(
                                  height: 100,
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot.data!.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return FridgeItem(
                                          product: snapshot.data![index]);
                                    },
                                    separatorBuilder: (context, index) =>
                                        const VerticalDivider(),
                                  ),
                                );
                              } else {
                                return const CircularProgressIndicator();
                              }
                            }),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                ],
              ) : SizedBox(),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
