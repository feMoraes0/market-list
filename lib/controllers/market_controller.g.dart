// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MarketController on MarketControllerBase, Store {
  final _$productsAtom = Atom(name: 'MarketControllerBase.products');

  @override
  ObservableList<Product> get products {
    _$productsAtom.context.enforceReadPolicy(_$productsAtom);
    _$productsAtom.reportObserved();
    return super.products;
  }

  @override
  set products(ObservableList<Product> value) {
    _$productsAtom.context.conditionallyRunInAction(() {
      super.products = value;
      _$productsAtom.reportChanged();
    }, _$productsAtom, name: '${_$productsAtom.name}_set');
  }

  final _$checkedCountAtom = Atom(name: 'MarketControllerBase.checkedCount');

  @override
  int get checkedCount {
    _$checkedCountAtom.context.enforceReadPolicy(_$checkedCountAtom);
    _$checkedCountAtom.reportObserved();
    return super.checkedCount;
  }

  @override
  set checkedCount(int value) {
    _$checkedCountAtom.context.conditionallyRunInAction(() {
      super.checkedCount = value;
      _$checkedCountAtom.reportChanged();
    }, _$checkedCountAtom, name: '${_$checkedCountAtom.name}_set');
  }

  final _$getProductsAsyncAction = AsyncAction('getProducts');

  @override
  Future getProducts() {
    return _$getProductsAsyncAction.run(() => super.getProducts());
  }

  final _$saveProductAsyncAction = AsyncAction('saveProduct');

  @override
  Future saveProduct(String name) {
    return _$saveProductAsyncAction.run(() => super.saveProduct(name));
  }

  final _$markProductAsyncAction = AsyncAction('markProduct');

  @override
  Future markProduct(int id) {
    return _$markProductAsyncAction.run(() => super.markProduct(id));
  }

  @override
  String toString() {
    final string =
        'products: ${products.toString()},checkedCount: ${checkedCount.toString()}';
    return '{$string}';
  }
}
