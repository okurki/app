import 'package:image_picker/image_picker.dart';
import 'package:okurki_app/features/classification/data/models/classify_result.dart';
import 'package:okurki_app/features/classification/data/models/similar_person.dart';

// reason: might be expanded.
// ignore: one_member_abstracts
abstract interface class ClassificationRepo {
  Future<(ClassifyResult, List<SimilarPerson>)> classify(XFile image);
}
