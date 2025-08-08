import 'package:dio/dio.dart';

class LoginRepository {
  final Dio _client = Dio(BaseOptions(
    // 설정안할 시 실패 응답 시 throw
    validateStatus: (status) => true,
  ));

  Future<List<String>> findByLatLng({
    required double lat,
    required double lng,
  }) async {
    final response = await _client.get(
      'https://api.vworld.kr/req/data',
      queryParameters: {
        'request': 'GetFeature',
        'data': 'LT_C_ADEMD_INFO',
        'key': 'FF86CB2B-0160-3B0D-97A1-66A06C4717B0',
        'geomfilter': 'POINT($lng $lat)',
        'geometry': 'false',
        'size': 100, // Optional
      },
    );

    if (response.statusCode == 200) {
      if (response.data['response']['status'] == 'OK') {
        // 행정주소 외 정보는 쓰지 않아서 모델생성 X(개인취향)
        // 써드파티 API(외부 API) 모델링 시 프로젝트에 외부 모델이 추가가되어 관리 힘듦
        return List.of(response.data['response']['result']['featureCollection']
                ['features'])
            .map((e) => e['properties']['full_nm'].toString())
            .toList();
      } else if (response.data['response']['status'] == 'NOT_FOUND') {
        //시뮬레이터 설정에 따라 한국 위경도 아닐경우 전부 해외로 처리함
        return ['해외'];
      }
    }

    return [];
  }
}
