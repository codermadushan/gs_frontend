String getReadableDuration({
  required DateTime startAt,
  required DateTime endAt,
}) {
  final difference = endAt.difference(startAt).inMinutes;

  final minutes = difference % 60;
  final hours = difference ~/ 60;

  if (minutes == 0 && hours == 0) return 'Not available';

  if (minutes == 0) return '${hours}h';

  if (hours == 0) return '${minutes}m';

  return '${hours}h ${minutes}m';
}
