import 'package:flutter/material.dart';
import 'package:projekt_aplikacje_mobilne/Firebase/database.dart';
import 'package:projekt_aplikacje_mobilne/Models/fridge_item/fridge_item_model.dart';
import 'package:projekt_aplikacje_mobilne/Models/product.dart';
import 'package:projekt_aplikacje_mobilne/Screens/fridge/fridge_item.dart';
import 'package:projekt_aplikacje_mobilne/Screens/share_fridge_popup.dart';
import 'package:projekt_aplikacje_mobilne/config/extensions.dart';

class FridgeContent extends StatefulWidget {
  const FridgeContent({
    super.key,
    required this.userId,
  });

  final String userId;

  @override
  State<FridgeContent> createState() => _FridgeContentState();
}

class _FridgeContentState extends State<FridgeContent> {
  Future<List<FridgeItemModel>> getProducts() =>
      MyDatabase.getAllUserProducts(widget.userId);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Your fridge Content:',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => shareFridgePopup(),
                );
              },
              icon: const Icon(Icons.ios_share),
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        FutureBuilder(
            future: getProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                print('${snapshot.data!.length} items');
                return SizedBox(
                  height: 200,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return FridgeItem(
                        product: snapshot.data![index],
                        userId: widget.userId,
                        onChanged: () {
                          setState(() {});
                        },
                      );
                    },
                    separatorBuilder: (context, index) => const VerticalDivider(
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
    );
  }
}
