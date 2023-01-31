import 'package:flutter/material.dart';
import 'package:projekt_aplikacje_mobilne/Firebase/database.dart';
import 'package:projekt_aplikacje_mobilne/Models/fridge_item/fridge_item_model.dart';
import 'package:projekt_aplikacje_mobilne/Models/product.dart';
import 'package:projekt_aplikacje_mobilne/config/constants.dart';
import 'package:projekt_aplikacje_mobilne/config/extensions.dart';

class FridgeItem extends StatelessWidget {
  const FridgeItem({
    super.key,
    required this.product,
    required this.userId,
    required this.onChanged,
  });

  final String userId;
  final VoidCallback onChanged;
  final FridgeItemModel product;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '${product.product.name} ${product.grams.toStringAsFixed(0)}g',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(
          width: context.width() / 2,
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              Text('Carbo: ${product.product.carbo} '),
              Text('Kcal: ${product.product.kcal} '),
              Text('Fat: ${product.product.fat} '),
              Text('Proteins: ${product.product.protein} '),
              Text('Salt: ${product.product.salt} '),
              Text('Vegan: ${product.product.vegan} '),
            ],
          ),
        ),
        Text(
          'Expiration date: ${showableFormat.format(product.expirationDate)}',
        ),
        Row(
          children: [
            const Text('Modify grams'),
            SizedBox(
              width: 50,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: controller,
              ),
            ),
            IconButton(
              onPressed: () {
                MyDatabase.addGramsToProduct(userId, product.product.name,
                        double.parse(controller.text))
                    .then((value) => onChanged());
                controller.clear();
              },
              icon: const Icon(Icons.add),
            )
          ],
        )
      ],
    );
  }
}
