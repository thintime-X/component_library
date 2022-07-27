/// @author: zx
/// @description: 时间工具，仅保存代码，暂时未暴露
class ClDateUtil {

  ///获取目前的格式化日期 返回格式 YYYY-MM-dd HH:mm:ss
  static String getLongFormatDate() {
    return DateTime.now().toLocal().toString().substring(0, 19);
  }

  ///获取目前的格式化日期 返回格式 YYYY-MM-dd
  static String getShortFormatDate() {
    return DateTime.now().toLocal().toString().substring(0, 10);
  }

  ///DateTime 转换为 YYYY-MM-dd 或 YYYY年MM月dd日
  static String getDateTransformFormat(DateTime dateTime, {bool userChinese = false}) {
    String dateString = dateTime.toLocal().toString().substring(0, 10);
    if (userChinese) {
      dateString = dateString.replaceFirst("-", "年 ");
      dateString = dateString.replaceFirst("-", "月 ");
      dateString = "$dateString\t日";
    }
    return dateString;
  }

  ///DateTime 转换为 HH:mm 或 HH时 mm分
  static String getTimeTransformFormat(DateTime dateTime, {bool userChinese = false}) {
    String timeString = dateTime.toLocal().toString().substring(10, dateTime.toLocal().toString().length - 7);
    if (userChinese) {
      timeString = timeString.replaceFirst(":", "时 ");
      timeString = "$timeString分";
    }
    return timeString;
  }

  ///YYYY-MM-dd 转换为 DateTime
  static DateTime getFormatTransformDateTime(String date) {
    return DateTime.parse("$date 00:00:00");
  }

  ///获取目前的时间戳 返回格式十位数时间戳
  static int getLongDate() {
    return DateTime.now().millisecondsSinceEpoch ~/ 1000;
  }

  ///判断传入的格式化日期是否是今天
  static bool isToday(String date) {
    DateTime parse = DateTime.parse(date);
    DateTime now = DateTime.now();
    return parse.year == now.year && parse.month == now.month && parse.day == now.day;
  }
}