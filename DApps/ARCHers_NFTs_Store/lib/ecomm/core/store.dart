
import 'package:app/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/cart.dart';

class MyStore extends VxStore {
  CatelogModel? catelog;
  CartModel? cart;

  MyStore() {
    catelog = CatelogModel();
    cart = CartModel();
    cart!.catelog = catelog!;
  }
}
