import 'package:flutter_test/flutter_test.dart';
import 'package:phone_number_checker/phone_number_checker.dart';

void main() {
  group('NetworkChecker Tests', () {
    test('should detect MTN numbers', () {
      expect(NetworkChecker.getNetwork('08031234567'), NetworkProvider.MTN);
      expect(NetworkChecker.getNetwork('+2348031234567'), NetworkProvider.MTN);
    });

    test('should detect Airtel numbers', () {
      expect(NetworkChecker.getNetwork('08021234567'), NetworkProvider.Airtel);
      expect(NetworkChecker.getNetwork('+2348021234567'), NetworkProvider.Airtel);
    });

    test('should detect Glo numbers', () {
      expect(NetworkChecker.getNetwork('08051234567'), NetworkProvider.Glo);
      expect(NetworkChecker.getNetwork('+2348051234567'), NetworkProvider.Glo);
    });

    test('should detect 9mobile numbers', () {
      expect(NetworkChecker.getNetwork('08091234567'), NetworkProvider.NineMobile);
      expect(NetworkChecker.getNetwork('+2348091234567'), NetworkProvider.NineMobile);
    });

    test('should return Unknown for invalid numbers', () {
      expect(NetworkChecker.getNetwork('08191234567'), NetworkProvider.Unknown); // Not defined
      expect(NetworkChecker.getNetwork('12345'), NetworkProvider.Unknown);
      expect(NetworkChecker.getNetwork(''), NetworkProvider.Unknown);
    });
  });
}
