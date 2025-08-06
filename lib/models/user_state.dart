class UserState {
  String address;
  String sender;
  String senderId;
  String profileImgUrl;

  UserState({
    this.address = '',
    this.sender = '',
    this.senderId = '',
    this.profileImgUrl = '',
  });
}

// 사용 예시
// // 기본값으로 생성
// UserState user = UserState(); << 빈값''(String)으로 일단 다 들어갑니다

// // 특정 값으로 생성 << 이렇게 초기값을 줄 수 있습니다
// UserState user = UserState(
//   address: '부산광역시 동래구 온천동',
//   sender: '플러터',
//   senderId: 'user123',
//   profileImgUrl: 'https://example.com/profile.jpg',
// );