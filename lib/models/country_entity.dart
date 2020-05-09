import 'package:azlistview/azlistview.dart';

class CountryInfo extends ISuspensionBean {
  String name;
	String code;
	String dialCode;
  String tagIndex;
  String upperName;

	CountryInfo({this.name, this.dialCode, this.code, this.tagIndex, this.upperName});

	CountryInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'] == null ? "" : json['name'];
    code = json['code'] == null ? "" : json['code'];
    dialCode = json['dialCode'] == null ? "" : json['dialCode'];
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'code': code,
    'dialCode': dialCode,
    'tagIndex': tagIndex,
    'upperName': upperName,
  };

  @override
  String getSuspensionTag() => tagIndex;

  @override
  String toString() => "CountryBean {" + " \"name\":\"" + name + "\"" + '}';

}