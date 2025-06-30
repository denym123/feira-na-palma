import '../../../core/core.dart';
import '../help.dart';

class HelpController with ControllerLifeCycle, HelpVariables {
  final HelpRepository _helpRepository;

  HelpController({
    required HelpRepository helpRepository,
  }) : _helpRepository = helpRepository;
}
