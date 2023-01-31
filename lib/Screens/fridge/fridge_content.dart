import 'package:flutter/material.dart';
import 'package:projekt_aplikacje_mobilne/Firebase/database.dart';
import 'package:projekt_aplikacje_mobilne/Models/product.dart';
import 'package:projekt_aplikacje_mobilne/Screens/fridge/fridge_item.dart';
import 'package:projekt_aplikacje_mobilne/Screens/share_fridge_popup.dart';
import 'package:projekt_aplikacje_mobilne/config/extensions.dart';

class FridgeContent extends StatelessWidget {
  const FridgeContent({
    super.key,
    required this.userId,
  });

  final String userId;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
            bottom: BorderSide(
          color: Colors.black,
          width: 2,
        )),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Your fridge Content:',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => shareFridgePopup(),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                ),
                icon: const Icon(Icons.ios_share),
                label: const Text(""),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          FutureBuilder(
              future: MyDatabase.getAllUserProducts(userId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  print('${snapshot.data!.length} items');
                  return SizedBox(
                    height: 100,
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return FridgeItem(product: snapshot.data![index]);
                      },
                      separatorBuilder: (context, index) =>
                          const VerticalDivider(),
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
    );
  }
}
