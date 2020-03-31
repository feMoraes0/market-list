import 'package:marketlist/models/local_db.dart';
import 'package:marketlist/models/product.dart';
import 'package:mobx/mobx.dart';
part 'market_controller.g.dart';

class MarketController = MarketControllerBase with _$MarketController;

abstract class MarketControllerBase with Store {
  @observable
  ObservableList<Product> products = ObservableList<Product>();

  @observable
  int checkedCount = 0;

  @action
  getProducts() async {
    await LocalDb().selectAll().then((List localProducts) {
      localProducts.forEach((product) {
        if (product.getStatus()) checkedCount++;
        products.add(product);
      });
    });
  }

  @action
  saveProduct(String name) async {
    Product product = new Product(
      name: name,
      status: false,
    );

    await LocalDb().insert(product);

    products.insert(0, product);
  }

  @action
  markProduct(int id) async {
    Product product = products[id];
    if (product.getStatus())
      checkedCount--;
    else
      checkedCount++;
    products.removeAt(id);
    product.setStatus(!product.getStatus());

    await LocalDb().update(product);
    products.insert(id, product);
  }
}
