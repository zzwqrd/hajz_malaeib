import 'package:dartz/dartz.dart';
import 'package:hajz_malaeib/features/home/data/models/model.dart';

import '../../domain/repositories/repository_name.dart';
import '../datasources/local/remote_data_source_local.dart';

class ProductRepositoryImp extends ProductRepository {
  final productEndPoint = RemoteDataSourceLocal();

  @override
  Future<Either<dynamic, List<DataLocalModel>>> getData() async {
    return await productEndPoint.getData();
  }
}
