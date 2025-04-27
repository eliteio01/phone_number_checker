enum NetworkProvider {
  MTN,
  Airtel,
  Glo,
  NineMobile,
  Unknown,
}

class NetworkChecker {
  static NetworkProvider getNetwork(String phoneNumber) {
    final cleaned = _cleanPhoneNumber(phoneNumber);

    if (cleaned.length < 4) return NetworkProvider.Unknown;
    final prefix = cleaned.substring(0, 4);

    if (_mtnPrefixes.contains(prefix)) {
      return NetworkProvider.MTN;
    } else if (_airtelPrefixes.contains(prefix)) {
      return NetworkProvider.Airtel;
    } else if (_gloPrefixes.contains(prefix)) {
      return NetworkProvider.Glo;
    } else if (_nineMobilePrefixes.contains(prefix)) {
      return NetworkProvider.NineMobile;
    } else {
      return NetworkProvider.Unknown;
    }
  }

  static String _cleanPhoneNumber(String phoneNumber) {
    // Remove all non-digit characters
    final digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // If it starts with +234, replace with 0
    if (digitsOnly.startsWith('234') && digitsOnly.length >= 13) {
      return '0${digitsOnly.substring(3)}';
    }

    return digitsOnly;
  }

  static const List<String> _mtnPrefixes = [
    '0803', '0806', '0703', '0706', '0810', '0813', '0814', '0816',
    '0903', '0906', '0913', '0916'
  ];

  static const List<String> _airtelPrefixes = [
    '0802', '0808', '0708', '0701', '0812', '0902', '0907', '0901', '0912'
  ];

  static const List<String> _gloPrefixes = [
    '0805', '0807', '0705', '0811', '0815', '0905', '0915'
  ];

  static const List<String> _nineMobilePrefixes = [
    '0809', '0817', '0818', '0909', '0908'
  ];
}
