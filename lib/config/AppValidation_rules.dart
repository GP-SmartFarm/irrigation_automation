String validateFaulName(String value) {
  if (value.length < 1) return 'ادخل اسمك';
  if (value.length < 15) return 'يجب ان يكون الاسم اكثر من 15 حرف';
  return null;
}
String validateSsn(String value) {
  if (value.length < 1) return 'ادخل رقم البطاقة';
  if (value.length != 14) return 'يجب ان يكون هناك 14 رقم';
  return null;
}
String validatePhone(String value) {
  if (value.length < 1) return 'ادخل رقم تليفونك';
  if (value.length != 11) return 'يجب ان يكون هناك 11 رقم';
  return null;
}
String validateUserName(String value) {
  if (value.length < 1) return 'ادخل اسم المستخدم';
  if (value.length < 8) return 'يجب ان يكون اسم المستخدم اكثر من 8 حرف';
  return null;
}

String validatePassWord(String value) {
  if (value.length < 1) return 'ادخل الرقم السرى ';
 // if (value.length < 8) return 'يجب ان يكون الرقم السرى اكثر من 8 حرف';
  return null;
}

String validateConfirmPassword(String value, String value2) {
  if (value.length < 1) return 'اعد ادخال الرقم السرى';
  //if (value.length < 9) return 'يجب ان يكون الرقم السرى اكثر من 8 حرف';
  if (value != value2) return 'الرقمين $value2 السرى $valueعير تماما متطابقين';
  return null;
}


String validateArea(String value) {
  if (value.length < 1) return 'ادخل المساحة';
  return null;
}

String validateEmail(String value) {
  if (value.length < 1) return 'ادخل الايميل';

  else
    return null;
}

String validatePassword(String value) {
  if (value.length < 1) return 'Enter a password';
  if (value.length < 1) return 'Password must be 6 chrachter long';
  return null;
}

