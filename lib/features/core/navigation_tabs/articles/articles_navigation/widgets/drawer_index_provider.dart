import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'drawer_index_provider.g.dart';

@riverpod
class DrawerIndex extends _$DrawerIndex {
  @override
  int build() {
    return 0;
  }

  void updateIndex(int index) {
    state = index;
    print(state);
  }
}
