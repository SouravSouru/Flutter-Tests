import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_lab/counter.dart';

void main() {
// given when then
  //Arrange
  late Counter counter;

  setUpAll(
    () {
      counter = Counter();
    },
  );

  group(
    'Counter Class',
    () {
      test(
        'given counter class when it is instantiated then value of count should be 0',
        () {
          // Act
          final val = counter.count;
          //Assert
          expect(val, 0);
        },
      );

      test(
        "given counter class when it is incremented then the value of count should be 1",
        () {
          // Act
          counter.incrementCount();
          final val = counter.count;
          //Assert
          expect(val, 1);
        },
      );
      test(
        "given counter class when it is decremented then the value of count should be 0",
        () {
          // Act
          counter.decrementCount();
          final val = counter.count;
          //Assert
          expect(val, 0);
        },
      );
      test(
        "given counter class when it is reset then the value of count should be 0",
        () {
          // Act
          counter.resetCount();
          final val = counter.count;
          //Assert
          expect(val, 0);
        },
      );
    },
  );
}
