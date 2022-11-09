class ApiUrl {
  // ค่าตัวแปรสำหรับใช้งานจริง
  static const String liveBaseURL =
      "https://medcare-database-test.herokuapp.com";
  // กรณีทดสอบที่ localhost android ใช้ค่าตามนี้ได้เลย เปลี่ยน path และ port เท่านั้น;

  static const String login = liveBaseURL + "/login";
  static const String register = liveBaseURL + "/register";
}
