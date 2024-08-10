import 'package:dartz/dartz.dart';

import '../../data/models/model.dart';
import '../../data/repository_impl/repository_impl.dart';

abstract class ProductUseCase {
  Future<Either<dynamic, List<DataLocalModel>>> getData();
}

class ProductUseCaseImp implements ProductUseCase {
  final productRepositoryImp = ProductRepositoryImp();

  @override
  Future<Either<dynamic, List<DataLocalModel>>> getData() async {
    return await productRepositoryImp.getData();
  }
}
