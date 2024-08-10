import 'package:dartz/dartz.dart';

import '../../data/models/model.dart';

abstract class ProductRepository {
  Future<Either<dynamic, List<DataLocalModel>>> getData();
}
