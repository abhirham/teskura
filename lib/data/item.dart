class Item {
  Item(this.title, this._completed);

  String title;
  bool _completed;

  void toggleChecked(bool val) {
    this._completed = val;
  }

  get completed => _completed;
}
