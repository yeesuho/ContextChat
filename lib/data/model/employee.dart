class Employee {
  String profile;
  String name;

  Employee(
      this.profile,
      this.name,
  );

  factory Employee.fromJson(json) {
    return Employee(
      json['사원 프로필'],
      json['사원 이름'],
    );
  }
}