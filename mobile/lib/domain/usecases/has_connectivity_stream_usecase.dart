import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:location_tracker/core/usecase/usecase.dart';
import 'package:location_tracker/domain/repositories/user_repository.dart';

@injectable
class OnConnectivityChangeUseCase
    implements UseCase<StreamController<bool>, void> {
  final UserRepository userRepository;
  OnConnectivityChangeUseCase({
    required this.userRepository,
  });
  @override
  StreamController<bool> call({void params}) {
    return userRepository.hasConnectivityStream();
  }
}
