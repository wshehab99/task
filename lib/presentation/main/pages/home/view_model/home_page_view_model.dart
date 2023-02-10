import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:task/presentation/resources/assets_manager.dart';

import '../../../../../model/category.dart';
import '../../../../../model/freelancer.dart';
import '../../../../../model/product.dart';
import '../../../../base/base_view_model.dart';

class HomePageViewModel extends BaseView
    with HomePageViewModelInput, HomePageViewModelOutput {
  final StreamController _freeLancerShownStreamController =
      BehaviorSubject<bool>();
  final StreamController _productShownStreamController =
      BehaviorSubject<bool>();
  late final ProductModel _productModel;
  late final FreelancerModel _freelancerModel;
  final StreamController _productModelStreamController =
      BehaviorSubject<ProductModel>();
  final StreamController _freeLancerModelStreamController =
      BehaviorSubject<FreelancerModel>();

  bool _freeLancerShown = false;
  bool _productShown = false;
  @override
  Sink get inputFreeLancerShown => _freeLancerShownStreamController.sink;

  @override
  Sink get inputProductShown => _productShownStreamController.sink;
  @override
  Sink get inputFreeLancerModel => _freeLancerModelStreamController.sink;

  @override
  Sink get inputProductModel => _productModelStreamController.sink;

  @override
  Stream<bool> get outputFreeLancerShown =>
      _freeLancerShownStreamController.stream.map((value) => value);

  @override
  Stream<bool> get outputProductShown =>
      _productShownStreamController.stream.map((value) => value);
  @override
  Stream<FreelancerModel> get outputFreelancerModel =>
      _freeLancerModelStreamController.stream.map((model) => model);

  @override
  Stream<ProductModel> get outputProductModel =>
      _productModelStreamController.stream.map((model) => model);
  @override
  void dispose() {
    _freeLancerShownStreamController.close();
    _productShownStreamController.close();
  }

  @override
  void init() {
    _getData();
    inputFreeLancerShown.add(_freeLancerShown);
    inputProductShown.add(_productShown);
    inputFreeLancerModel.add(_freelancerModel);
    inputProductModel.add(_productModel);
  }

  _getData() {
    _productModel = ProductModel(newest: [
      Product("Special banner", 40, AssetImageManager.product),
      Product("Special banner", 40, AssetImageManager.product),
      Product("Special banner", 40, AssetImageManager.product),
      Product("Special banner", 40, AssetImageManager.product),
      Product("Special banner", 40, AssetImageManager.product),
      Product("Special banner", 40, AssetImageManager.product),
    ], higherRating: [
      Product("Special banner", 40, AssetImageManager.product),
      Product("Special banner", 40, AssetImageManager.product),
      Product("Special banner", 40, AssetImageManager.product),
      Product("Special banner", 40, AssetImageManager.product),
      Product("Special banner", 40, AssetImageManager.product),
      Product("Special banner", 40, AssetImageManager.product),
    ], category: [
      Category("Book markers", AssetImageManager.product),
      Category("Games", AssetImageManager.product),
      Category("Cards", AssetImageManager.product),
      Category("C.V", AssetImageManager.product),
      Category("Presentation", AssetImageManager.product),
      Category("Flyers", AssetImageManager.product),
      Category("Book markers", AssetImageManager.product),
      Category("Book markers", AssetImageManager.product),
    ]);
    _freelancerModel = FreelancerModel(higherRating: [
      Freelancer("Omar", 4.5, 0, AssetImageManager.omar),
      Freelancer("Ahmed", 4.5, 0, AssetImageManager.ahmed1),
      Freelancer("Ahmed", 4.5, 0, AssetImageManager.ahmed2),
      Freelancer("Ahmed", 4.5, 0, AssetImageManager.ahmed3),
      Freelancer("Ahmed", 4.5, 0, AssetImageManager.ahmed4),
    ], moreCompletedProjects: [
      Freelancer("Ahmed", 4.5, 80, AssetImageManager.ahmed5),
      Freelancer("Ahmed", 4.5, 80, AssetImageManager.ahmed6),
      Freelancer("Ahmed", 4.5, 80, AssetImageManager.ahmed7),
      Freelancer("Ahmed", 4.5, 80, AssetImageManager.ahmed8),
      Freelancer("Ahmed", 4.5, 80, AssetImageManager.ahmed4),
    ], category: [
      Category("Designing", AssetImageManager.product),
      Category("Content", AssetImageManager.product),
      Category("Voice services", AssetImageManager.product),
      Category("marketing", AssetImageManager.product),
      Category("Photography", AssetImageManager.product),
      Category("Flyers", AssetImageManager.product),
      Category("Book markers", AssetImageManager.product),
      Category("Book markers", AssetImageManager.product),
    ]);
  }

  @override
  switchFreeLancer() {
    _freeLancerShown = !_freeLancerShown;
    inputFreeLancerShown.add(_freeLancerShown);
  }

  @override
  switchProduct() {
    _productShown = !_productShown;
    inputProductShown.add(_productShown);
  }
}

abstract class HomePageViewModelInput {
  Sink get inputProductShown;
  Sink get inputFreeLancerShown;
  Sink get inputFreeLancerModel;
  Sink get inputProductModel;

  switchFreeLancer();
  switchProduct();
}

abstract class HomePageViewModelOutput {
  Stream<bool> get outputFreeLancerShown;
  Stream<bool> get outputProductShown;
  Stream<ProductModel> get outputProductModel;
  Stream<FreelancerModel> get outputFreelancerModel;
}
