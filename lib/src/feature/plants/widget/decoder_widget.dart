class DecoderWidget {
  DecoderWidget({required this.code, required this.length});
  String code;
  int length;

  int getCode(String code) {
    int index = 0;
    for (var i = 0; i < length; i++) {
      if (code == 'Plant$i') {
        index = i;
      }
    }
    return index;
  }
}
