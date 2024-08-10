import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';

import '../../../../../generated/assets.dart';
import '../../models/model.dart';

class RemoteDataSourceLocal {
  Future<Either<dynamic, List<DataLocalModel>>> getData() async {
    try {
      final String res = await rootBundle.loadString(Assets.apiData);
      final List<dynamic> dataList = json.decode(res);

      final List<DataLocalModel> dataLocalModels = dataList
          .map((jsonItem) => DataLocalModel.fromJson(jsonItem))
          .toList();

      return Right(dataLocalModels);
    } catch (error) {
      return Left(error);
    }
  }
}
