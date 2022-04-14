class EmpDetails {
   int id;
   String fName;
   String mName;
   String lName;
   String gender;
   String bg;
   double salary;

  EmpDetails( this.id, thisfName, this.mName, this.lName, this.gender, this.bg,
      this.salary);

  factory EmpDetails.fromJson(Map<String, dynamic> json) {
    return EmpDetails(id, thisfName, mName, lName, gender, bg, salary)
  }

  void setId(int id) {
    this.id = id;
  }

  int getId() {
    return id;
  }

  void setfName(String fName) {
    this.fName = fName;
  }

  String getfName() {
    return fName;
  }

  void setmName(String mName) {
    this.mName = mName;
  }

  String getmName() {
    return mName;
  }

  void setlName(String lName) {
    this.lName = lName;
  }

  String getlName() {
    return lName;
  }

  void setGender(String gender) {
    this.gender = gender;
  }

  String getGender() {
    return gender;
  }

  void setBloodGroup(String bg) {
    this.bg = bg;
  }

  String getBloodGroup() {
    return bg;
  }

  void setSalary(double salary) {
    this.salary = salary;
  }

  double getSalary() {
    return salary;
  }
}
