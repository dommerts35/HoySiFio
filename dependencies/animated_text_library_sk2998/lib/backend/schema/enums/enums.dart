import 'package:collection/collection.dart';
import 'package:ff_commons/flutter_flow/enums.dart';
export 'package:ff_commons/flutter_flow/enums.dart';

/// Eight distinct animation types, each with specific parameters optimized
/// for their visual effects
enum AnimationTypes {
  Fade,
  Type,
  Typewriter,
  Scale,
  Rotate,
  Colorize,
  Wavy,
  Flicker,
}

enum FFTextAlign {
  left,
  right,
  center,
  justify,
  start,
  end,
}

enum FFTextDirection {
  ltr,
  rtl,
}

enum FFFontWeight {
  thin,
  extraLight,
  light,
  normal,
  medium,
  semiBold,
  bold,
  extraBold,
  black,
}

enum FFAlignment {
  topLeft,
  topCenter,
  topRight,
  centerLeft,
  center,
  centerRight,
  bottomLeft,
  bottomCenter,
  bottomRight,
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (AnimationTypes):
      return AnimationTypes.values.deserialize(value) as T?;
    case (FFTextAlign):
      return FFTextAlign.values.deserialize(value) as T?;
    case (FFTextDirection):
      return FFTextDirection.values.deserialize(value) as T?;
    case (FFFontWeight):
      return FFFontWeight.values.deserialize(value) as T?;
    case (FFAlignment):
      return FFAlignment.values.deserialize(value) as T?;
    default:
      return null;
  }
}
