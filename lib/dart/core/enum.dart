/// 组织对象类型
enum TargetType {
  group("组织群"),
  person("人员"),
  cohort("群组"),
  company("单位"),
  college("学院"),
  major("专业"),
  section("科室"),
  office("办事处"),
  hospital("医院"),
  working("工作组"),
  university("大学"),
  department("部门"),
  research("研究所"),
  jobCohort("工作群"),
  laboratory("实验室"),
  station("岗位");

  const TargetType(this.label);

  final String label;

  static String getName(TargetType type) {
    return type.label;
  }

  static TargetType getType(String name) {
    return TargetType.values.firstWhere((element) => element.label == name);
  }
}

 enum TaskStatus {
  applyStart(0),
  approvalStart(100),
  refuseStart(200);

  final int status;
  const TaskStatus(this.status);
}

enum SpeciesType {
  /** 类别目录 */
  market('流通类'),
  resource('资源类'),
  store('属性类'),
  application('应用类'),
  dict('字典类'),
  /** 类别类目 */
  flow('流程类'),
  work('事项类'),
  thing('实体类'),
  data('数据类');

  final String label;

  const SpeciesType(this.label);

  static SpeciesType? getType(String name) {
    try{
      return SpeciesType.values.firstWhere((element) => element.label == name);
    }catch(e){
      return null;
    }
  }
}

/// 消息类型
enum MessageType {
  text("文本"),
  image("图片"),
  video("视频"),
  voice("语音"),
  recall("撤回"),
  readed("已读"),
  uploading("上传中"),
  file("文件");
  const MessageType(this.label);

  final String label;

  static String getName(MessageType type) {
    return type.label;
  }

  static MessageType? getType(String str) {
    switch(str){
      case "文本":
       return MessageType.text;
      case "图片":
        return MessageType.image;
      case "视频":
        return MessageType.video;
      case "语音":
        return MessageType.voice;
      case "撤回":
        return MessageType.recall;
      case "已读":
        return MessageType.readed;
      case "文件":
        return MessageType.file;
    }
    return null;
  }
}

/// 职权类型
enum AuthorityType {
  superAdmin("super-admin"),
  relationAdmin("relation-admin"),
  thingAdmin("thing-admin"),
  marketAdmin("market-admin"),
  applicationAdmin("application-admin");

  const AuthorityType(this.label);

  final String label;

  static String getName(MessageType type) {
    return type.label;
  }
}

/// 通用状态
enum CommonStatus {
  applyStartStatus(1),
  approveStartStatus(100),
  rejectStartStatus(200);

  const CommonStatus(this.value);

  final int value;

  static int getValue(CommonStatus status) {
    return status.value;
  }
}

/// 域类型
enum DomainTypes {
  user("user"),
  company("company"),
  all("all");

  const DomainTypes(this.label);

  final String label;

  static String getName(MessageType type) {
    return type.label;
  }
}

enum ProductType {
  webApp("web应用");

  const ProductType(this.label);

  final String label;

  static String getName(ProductType type) {
    return type.label;
  }
}

/// 订单状态
enum OrderStatus {
  deliver(102),
  buyerCancel(220),
  sellerCancel(221),
  rejectOrder(222);

  const OrderStatus(this.value);

  final int value;

  static int getValue(OrderStatus status) {
    return status.value;
  }
}

enum TodoType {
  frientTodo("好友申请"),
  orgTodo("组织审批"),
  orderTodo("订单管理"),
  marketTodo("市场管理"),
  applicationTodo("应用待办");

  const TodoType(this.label);

  final String label;

  static String getName(ProductType type) {
    return type.label;
  }
}

const companyTypes = [
  TargetType.company,
  TargetType.hospital,
  TargetType.university,
];

const targetDepartmentTypes = [
  TargetType.office,
  TargetType.section,
  TargetType.research,
  TargetType.laboratory,
  TargetType.jobCohort,
  TargetType.department,
];

const subDepartmentTypes = [
  TargetType.office,
  TargetType.section,
  TargetType.laboratory,
  TargetType.jobCohort,
  TargetType.research,
];
