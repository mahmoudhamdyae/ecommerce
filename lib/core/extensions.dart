String reformatData(String data) {
  String reformattedData = data.replaceAll(RegExp(r'<[^>]*>'), '').replaceAll('&nbsp;', '');
  return reformattedData;
}