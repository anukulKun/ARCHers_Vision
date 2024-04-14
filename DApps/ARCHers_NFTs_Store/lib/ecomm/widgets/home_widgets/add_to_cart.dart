import 'package:app/models/cart.dart';
import 'package:app/models/catelog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/store.dart';

class AddToCart extends StatelessWidget {
  final Item? catelog;
  AddToCart({Key? key, this.catelog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart!;
    bool isInCart = _cart.items.contains(catelog) ?? false;
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(catelog!);
        }
      },
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.theme.cardColor),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          )),
    );
  }
}
