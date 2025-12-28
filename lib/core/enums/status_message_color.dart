enum StatusMessageColor { green, red, muted }

extension StatusMessageColorExt on StatusMessageColor {
  String get label {
    switch (this) {
      case StatusMessageColor.green:
        return 'green';

      case StatusMessageColor.red:
        return 'red';

      case StatusMessageColor.muted:
        return 'muted';
    }
  }
}
