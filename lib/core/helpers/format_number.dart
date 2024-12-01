String formatNumber(int number) {
  if (number >= 10000000000000) {
    return " >B";
  } else if (number >= 1000000000) {
    return "${(number / 1000000000).floor()}B";
  } else if (number >= 1000000) {
    return "${(number / 1000000).floor()}M";
  } else if (number >= 1000) {
    return "${(number / 1000).toStringAsFixed(1)}K";
  } else {
    return number.toString();
  }
}
