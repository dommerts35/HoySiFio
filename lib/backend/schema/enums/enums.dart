import "package:animated_text_library_sk2998/backend/schema/enums/enums.dart"
    as animated_text_library_sk2998_enums;
import 'package:ff_commons/flutter_flow/enums.dart';
export 'package:ff_commons/flutter_flow/enums.dart';

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (animated_text_library_sk2998_enums.AnimationTypes):
      return animated_text_library_sk2998_enums.AnimationTypes.values
          .deserialize(value) as T?;
    case (animated_text_library_sk2998_enums.FFTextAlign):
      return animated_text_library_sk2998_enums.FFTextAlign.values
          .deserialize(value) as T?;
    case (animated_text_library_sk2998_enums.FFTextDirection):
      return animated_text_library_sk2998_enums.FFTextDirection.values
          .deserialize(value) as T?;
    case (animated_text_library_sk2998_enums.FFFontWeight):
      return animated_text_library_sk2998_enums.FFFontWeight.values
          .deserialize(value) as T?;
    case (animated_text_library_sk2998_enums.FFAlignment):
      return animated_text_library_sk2998_enums.FFAlignment.values
          .deserialize(value) as T?;
    default:
      return null;
  }
}
