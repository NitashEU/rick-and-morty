extension ListExtension on List {
  List<T> joinCustom<T>(T join) {
    var joined = <T>[];

    for (var i = 0; i < length; i++) {
      if (i != length - 1) {
        joined.add(this[i]);
        joined.add(join);
      } else {
        joined.add(this[i]);
      }
    }
    return joined;
  }
}
