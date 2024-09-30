import 'package:dartz/dartz.dart';

import '../../../core/usecase/usecase.dart';
import '../../../service_locator.dart';
import '../entities/product_entity.dart';
import '../repository/product_repository.dart';

class AddOrRemoveFavoriteProductUseCase implements UseCase<Either,ProductEntity> {

  @override
  Future<Either> call({ProductEntity? params}) async {
    return await sl<ProductRepository>().addOrRemoveFavoriteProduct(params!);
  }

}
