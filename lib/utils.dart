import 'dart:math';

getRandomItem(List<dynamic> list) {
  int nextIndex = new Random().nextInt(list.length);

  return list[nextIndex];
}

