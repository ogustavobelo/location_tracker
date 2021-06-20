import 'package:injectable/injectable.dart';
import 'package:location_tracker/core/helpers/strings_helpers.dart';
import 'package:location_tracker/core/usecase/usecase.dart';

@injectable
class GenerateUID extends UseCase<String, void> {
  @override
  String call({Object? params}) {
    return StringHelper.uId();
  }
}
