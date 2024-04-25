import 'package:sniper_pro/src/domain/useCases/products/CreateProductUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/products/DeleteProductUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/products/GetProducrankingUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/products/GetProducreportUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/products/GetProductByCategoryUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/products/GetProductByCategoryUseidCase.dart';
import 'package:sniper_pro/src/domain/useCases/products/GetProductByCategorylikeUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/products/GetProductUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/products/UpdateProductUseCasa.dart';
import 'package:sniper_pro/src/domain/useCases/products/activatetpProductUseCase.dart';
import 'package:sniper_pro/src/domain/useCases/products/likeProductUseCase.dart';

class ProductsUseCase {
  CreateProductUseCase create;
  UpdateProductUseCasa update;
  DeleteProductUseCase delete;
  GetProductByCategoryUseCase getProductByCategory;
  GetProductByCategoryUseidCase getProductByCategoryuser;
  ActivatetpProductUseCase activatetp;
  GetProductByCategorylikeUseCase getProductByCategorylikeUseCase;
  LikeProductUseCase like;
  GetProducreportUseCase report;
  GetProducrankigUseCase ranking;
  GetProductUseCase product;
  ProductsUseCase(
      {required this.create,
      required this.getProductByCategory,
      required this.update,
      required this.delete,
      required this.product,
      required this.getProductByCategoryuser,
      required this.activatetp,
      required this.like,
      required this.getProductByCategorylikeUseCase,
      required this.report,
      required this.ranking});
}
