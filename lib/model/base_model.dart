abstract class BaseModel {
  BaseModel fromMap(Map<String, dynamic> map);
}

// 数据包装类
class BaseEntity {
  int code;
  String message;
  Map<String, dynamic> data;

  BaseEntity({this.code, this.message, this.data});

  factory BaseEntity.fromMap(Map<String, dynamic> map) {
    return BaseEntity(
      code: map["code"],
      message: map["msg"],
      data: EntityFactory.generateOBJ(map["data"]),
    );
  }
}

class EntityFactory {
  static Map<String, dynamic> generateOBJ(data) {
    if (data == null) {
      return null;
    } else {
      // _InternalLinkedHashMap<String, dynamic> 转成 Map<String, dynamic>
      return Map<String, dynamic>.from(data);
    }
  }
}
