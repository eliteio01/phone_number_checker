import 'package:flutter_test/flutter_test.dart';
import 'package:phone_number_checker/phone_number_checker.dart';

void main() {
  group('NetworkChecker Tests', () {
    test('should detect MTN numbers', () {
      expect(NetworkChecker.getNetwork('08031234567'), NetworkProvider.mtn);
      expect(NetworkChecker.getNetwork('+2348031234567'), NetworkProvider.mtn);
    });

    test('should detect Airtel numbers', () {
      expect(NetworkChecker.getNetwork('08021234567'), NetworkProvider.airtel);
      expect(NetworkChecker.getNetwork('+2348021234567'), NetworkProvider.airtel);
    });

    test('should detect Glo numbers', () {
      expect(NetworkChecker.getNetwork('08051234567'), NetworkProvider.glo);
      expect(NetworkChecker.getNetwork('+2348051234567'), NetworkProvider.glo);
    });

    test('should detect 9mobile numbers', () {
      expect(NetworkChecker.getNetwork('08091234567'), NetworkProvider.nineMobile);
      expect(NetworkChecker.getNetwork('+2348091234567'), NetworkProvider.nineMobile);
    });

    test('should return Unknown for invalid numbers', () {
      expect(NetworkChecker.getNetwork('08191234567'), NetworkProvider.unknown); // Not defined
      expect(NetworkChecker.getNetwork('12345'), NetworkProvider.unknown);
      expect(NetworkChecker.getNetwork(''), NetworkProvider.unknown);
    });
  });
}
