import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mekaaz/core/repositories/auth/model/get_role_response.dart';
import 'package:mekaaz/core/repositories/auth/services/auth_repository.dart';

final getRoleProvider =
    FutureProvider<GetRoleResponse>((ref) {
  return ref.watch(authRepositoryProvider).getRole();
});




// part 'filter_all_room_provider.g.dart';

// @riverpod
// class FilterAllRooms extends _$FilterAllRooms {
//   @override
//   Future<FilterRoomResponse> build(FilterRoomModel filterRoomModel) async {
//     return await ref
//         .read(roomsRepositoryProvider).filterRooms
//         (filterRoomModel);
//   }
// }
