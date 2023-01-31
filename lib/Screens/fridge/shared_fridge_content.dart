import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Firebase/database.dart';
import '../../Firebase/share_fridge.dart';
import 'fridge_item.dart';
import 'package:projekt_aplikacje_mobilne/config/extensions.dart';

class SharedFridgeContent extends StatefulWidget {
  final String userId;
  SharedFridgeContent({required this.userId});

  @override
  State<SharedFridgeContent> createState() => _SharedFridgeContentState();
}

class _SharedFridgeContentState extends State<SharedFridgeContent> {
  Future<List<String>> getSharedFridges() async {
    List<String> getShared = <String>[];
    getShared = await ShareFridge().getUserSharedFridges(widget.userId);
    return getShared;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getSharedFridges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Expanded(
              child: snapshot.data!.isNotEmpty
                  ? ListView(
                      children: [
                        for (int i = 0; i < snapshot.data!.length; i++)
                          Column(
                            children: [
                              const Divider(
                                thickness: 2,
                              ),
                              Text(
                                snapshot.data![i].substring(
                                    0, snapshot.data![i].indexOf("@")),
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              FutureBuilder(
                                  future: MyDatabase.getAllUserProducts(
                                      snapshot.data![i]),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      return SizedBox(
                                        height: 100,
                                        child: ListView.separated(
                                          shrinkWrap: true,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          itemCount: snapshot.data!.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return FridgeItem(
                                              product: snapshot.data![index],
                                              userId: widget.userId,
                                              onChanged: () {
                                                setState(() {});
                                              },
                                            );
                                          },
                                          separatorBuilder: (context, index) =>
                                              const VerticalDivider(
                                            thickness: 2,
                                          ),
                                        ),
                                      );
                                    } else {
                                      return const CircularProgressIndicator();
                                    }
                                  }),
                              const SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                      ],
                    )
                  : const SizedBox(),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
