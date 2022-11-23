flutter test --coverage
lcov --remove coverage/lcov.info \
'lib/main.dart' \
'lib/*/*.g.dart' \
-o coverage/lcov.info
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html