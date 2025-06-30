import '../../../core/core.dart';
import '../producer_detail.dart';

class ProducerDetailController with ControllerLifeCycle, ProducerDetailVariables {
  final ProducerDetailRepository _producer_detailRepository;

  ProducerDetailController({
    required ProducerDetailRepository producer_detailRepository,
  }) : _producer_detailRepository = producer_detailRepository;
}
