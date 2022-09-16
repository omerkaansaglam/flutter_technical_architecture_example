import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('App Performance Test', () {
    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      await driver.close();
    });

    test('Scrolling Test For ListView', () async {
      final listFinder = find.byType('ListView');
      final scrollingTimeline = await driver.traceAction(() async {
        await driver.scroll(listFinder, 0, -7000, const Duration(seconds: 1));
        await driver.scroll(listFinder, 0, 7000, const Duration(seconds: 1));
      });
      final scrollingSummary = TimelineSummary.summarize(scrollingTimeline);
      await scrollingSummary.writeTimelineToFile('scrolling', pretty: true);
    });
  });
}
