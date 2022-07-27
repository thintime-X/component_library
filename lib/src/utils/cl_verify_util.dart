
// @author: zx
// @description: 验证相关工具，仅保存代码，暂时未暴露

///验证手机号或邮箱
///[data] 需要验证的值
///[onIsPhone] 返回当前验证的数据是手机号还是邮件 true手机号 false邮件
bool verifyPhoneOrEmail(dynamic data, {Function(bool result)? onIsPhone}) {
  if (verifyPhone(data)) {
    if (onIsPhone != null) onIsPhone(true);
    return true;
  } else if (verifyEmail(data)) {
    if (onIsPhone != null) onIsPhone(false);
    return true;
  }
  return false;
}

///验证是否为手机号
bool verifyPhone(String mobile) {
  var result = false;
  RegExp phoneExp = RegExp(r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
  if (phoneExp.hasMatch(mobile)) {
    result = true;
  }
  return result;
}

///验证是否为邮件
bool verifyEmail(String email) {
  var result = false;
  RegExp emailExp = RegExp("^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$");
  if (emailExp.hasMatch(email)) {
    result = true;
  }
  return result;
}
