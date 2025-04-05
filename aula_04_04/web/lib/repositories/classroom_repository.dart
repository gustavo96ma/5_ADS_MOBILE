import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:web/models/classroom_model.dart';

class ClassroomRepository {
  Future<List<ClassroomModel>> fetchAllClassrooms() async {
    List<Map<String, dynamic>> dataBaseValues =
        await fetchClassroomsFromDatabase();

    return formatClassroomData(dataBaseValues);
  }

  fetchClassroomsFromDatabase() async {
    var response = await Supabase.instance.client.from('classroom').select();
    print(response);
  }

  Future<List<ClassroomModel>> formatClassroomData(
    List<Map<String, dynamic>> dataBaseValues,
  ) {
    for (var classroom in dataBaseValues) {
      ClassroomModel(
        classroom: classroom['classroom'],
        capacity: classroom['capacity'],
        computersCount: classroom['computersCount'],
        hasAirConditioning: classroom['hasAirConditioning'],
        hasHandicapDesk: classroom['hasHandicapDesk'],
        hasLeftHandedDesk: classroom['hasLeftHandedDesk'],
        hasProjector: classroom['hasProjector'],
        hasTelevision: classroom['hasTelevision'],
      );
    }
  }
}
