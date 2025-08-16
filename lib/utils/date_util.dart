class DateUtil {
  /// DateTime 객체를 '오전/오후 h:mm' 형식의 문자열로 변환
  static String formatMessageTime(DateTime dateTime) {
    String period = dateTime.hour < 12 ? '오전' : '오후';
    int hour = dateTime.hour % 12;
    if (hour == 0) {
      hour = 12; // 0시는 12시로, 12시는 12시로 표시
    }
    String minute = dateTime.minute.toString().padLeft(2, '0');
    return '$period $hour:$minute';
  }
}
