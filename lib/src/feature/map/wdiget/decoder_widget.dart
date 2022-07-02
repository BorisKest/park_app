class DecoderWidget {
  DecoderWidget({required this.code});
  final String code;

  static getCode(String code) {
    switch (code) {
      case 'Plant1':
        return 0;
      case 'Plant2':
        return 1;
      case 'Plant3':
        return 2;
      case 'Plant4':
        return 3;
    }
  }
}
