class Counter {
  int _count = 0;
  int get count => _count;

  void incrementCount() {
    _count++;
  }

  void decrementCount() {
    _count--;
  }

  void resetCount() {
    _count = 0;
  }
}
