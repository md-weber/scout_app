import 'package:flutter_test/flutter_test.dart';
import 'package:scout_app/utils/readable_date.dart';

void main() {
  group('readableDate', () {
    test('should return a formatted Date in the format "dd-MM-yyyy', () {
      var formattedDate = readableDate(DateTime(2023, 10, 09), "dd-MM-yyyy");
      expect(formattedDate, "09-10-2023");
    });
  });
}
