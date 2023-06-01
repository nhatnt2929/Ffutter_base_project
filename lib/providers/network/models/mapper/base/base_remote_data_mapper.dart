import 'package:pes/providers/network/models/base/base_model.dart';
import 'package:pes/providers/network/models/base_data.dart';

abstract class BaseRemoteDataMapper<R extends BaseData, E extends BaseModel> {
  E mapToEntity(R? data);

  List<E> mapToListEntity(List<R>? listData) {
    return listData?.map(mapToEntity).toList() ?? List.empty();
  }
}