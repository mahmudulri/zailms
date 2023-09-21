class ApiEndPoints {
  static String baseUrl = "https://stg-lms.zainikthemes.com/api/";
  static AuthendPoints authendPoints = AuthendPoints();
  static OtherendPoints otherendpoints = OtherendPoints();
}

class AuthendPoints {
  final String registerlink = "register";
  final String loginIink = "login";
  final String courses = "home/courses";
  final String changepassword = "student/change-password";
}

class OtherendPoints {
  final String coursedetails = "course-details/";
  final String mylearning = "student/my-learning";
  final String mycourses = "student/my-course/";
  final String liveclass = "student/live-class/";
  final String getcountry = "get-country";
}
