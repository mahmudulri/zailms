import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lmszai/app/module/affiliate/affiliate_panel.dart';
import 'package:lmszai/app/module/ask_a_question/ask_a_question.dart';
import 'package:lmszai/app/module/base_page/search_page/search_page.dart';
import 'package:lmszai/app/module/base_view/base_view.dart';
import 'package:lmszai/app/module/change_password/change_password.dart';
import 'package:lmszai/app/module/checkout/check_out.dart';
import 'package:lmszai/app/module/consultation_booking/booking.dart';
import 'package:lmszai/app/module/course_details/course_details.dart';
import 'package:lmszai/app/module/edit_profile/edit_profile.dart';
import 'package:lmszai/app/module/forum/forum.dart';
import 'package:lmszai/app/module/forum_leaderboard/forum_leaderboard.dart';
import 'package:lmszai/app/module/help_support/help_support.dart';
import 'package:lmszai/app/module/leader_board/leader_board.dart';
import 'package:lmszai/app/module/multi_languages/multi_language.dart';
import 'package:lmszai/app/module/my_learning/my_learning.dart';
import 'package:lmszai/app/module/open_screen/open_screen.dart';
import 'package:lmszai/app/module/otp_screen/otp_screen.dart';
import 'package:lmszai/app/module/payment/payment.dart';
import 'package:lmszai/app/module/profile_setting/profile_setting.dart';
import 'package:lmszai/app/module/purchased_course/purchased_course.dart';
import 'package:lmszai/app/module/purchased_course_details/assignment/assignment.dart';
import 'package:lmszai/app/module/purchased_course_details/assignment_details/assignment_details.dart';
import 'package:lmszai/app/module/purchased_course_details/assignment_upload/upload_assignment.dart';
import 'package:lmszai/app/module/purchased_course_details/course_resourse/course_resourse.dart';
import 'package:lmszai/app/module/purchased_course_details/course_review/course_review.dart';
import 'package:lmszai/app/module/purchased_course_details/course_video_play/course_video_play.dart';
import 'package:lmszai/app/module/purchased_course_details/discussion/discussion.dart';
import 'package:lmszai/app/module/purchased_course_details/live_class/live_class.dart';
import 'package:lmszai/app/module/purchased_course_details/notice_board/notice_board.dart';
import 'package:lmszai/app/module/purchased_course_details/overivew/purchased_course_overview.dart';
import 'package:lmszai/app/module/purchased_course_details/quiz/all_quiz/all_quiz.dart';
import 'package:lmszai/app/module/purchased_course_details/quiz/start_quiz/start_quiz.dart';
import 'package:lmszai/app/module/register_screen/register_screen.dart';
import 'package:lmszai/app/module/sign_in_screen/sign_in_screen.dart';
import 'package:lmszai/app/module/splash_screen/splash_screen.dart';
import 'package:lmszai/app/module/subscription_panel/subscription_panel.dart';
import 'package:lmszai/app/module/top_instructor2/top_instructor.dart';
import 'package:lmszai/app/module/welcome_screen/welcome.dart';
import '../module/view_all/board/board_viewall.dart';
import '../module/view_all/bundle/bundle_viewall.dart';
import '../module/view_all/one_to_one/one_to_one_view.dart';
import '../module/view_all/topinstructor/all_top_instructor_view.dart';
import '../module/view_all/upcoming/upcoming_view_all.dart';

const String welcome = '/welcome';
const String splash = '/splash-screen';
const String open_screen = '/open-screen';
const String register_screen = '/register-screen';
const String sign_in_screen = '/sign-in-screen';
const String otp_screen = '/otp-screen';
const String base_view = '/base-screen';
const String view_allCourse = '/view-allcourse';
const String view_all_bundles = '/view-bundles';
const String one_to_one_view_all = '/one-to-one-view-all';
const String view_all_instructor = '/view_all_instructor';
const String upcoming_view_all = '/upcoming_view_all';
const String search_screen = '/search-screen';
const String course_details = '/course-details';
const String my_learning = '/my-learning';
const String purchase_course = '/purchase-course';
const String course_video_play = '/course-video-play';
const String multi_languages = '/multi-languages';
const String purchased_course_overview = '/purchased-course-overview';
const String course_resources = '/course-resources';
const String all_quiz = '/all-quiz';
const String start_quiz = '/start-quiz';
const String leader_board = '/leader-board';
const String course_review = '/course-review';
const String assignment = '/assignment';
const String assignment_details = '/assignment-details';
const String upload_assignment = '/upload-assignment';
const String notice_board = '/notice-board';
const String live_class = '/live-class';
const String discussion = '/discussion';
const String topinstructor = '/topinstructor';
const String profile_setting = '/profile-setting';
const String edit_profile = '/edit-profile';
const String change_password = '/change-passworld';
const String help_support = '/help-support';
const String booking = '/booking';
const String payment = '/payment';
const String checkout = '/checkout';
const String forum = '/forum';
const String forum_leaderboard = '/forum-leaderboard';
const String ask_a_question = '/ask-a-question';
const String subscription_panel = '/subscription-panel';
const String affiliate_panel = '/affiliate-panel';

// control all pages from here

Map<String, WidgetBuilder> mypagemap = {
  welcome: (context) => WelcomeScreen(),
  splash: (context) => SplashScreen(),
  base_view: (context) => BaseView(),
  view_allCourse: (context) => ViewAllCourse(),
  view_all_bundles: (context) => ViewAllBundles(),
  one_to_one_view_all: (context) => OneToOneAllView(),
  view_all_instructor: (context) => AlltopInstructorView(),
  upcoming_view_all: (context) => UpcomingviewAll(),
  open_screen: (context) => OpenScreen(),
  register_screen: (context) => RegisterScreen(),
  sign_in_screen: (context) => SignInScreen(),
  otp_screen: (context) => OtpScreen(),
  search_screen: (context) => SearchScreen(),
  course_details: (context) => CourseDetails(),
  my_learning: (context) => MyLearning(),
  purchase_course: (context) => PurchasedCourse(),
  course_video_play: (context) => CourseVideoPlay(),
  multi_languages: (context) => MultiLanguages(),
  purchased_course_overview: (context) => PurchasedCourseOverview(),
  course_resources: (context) => CourseResourse(),
  all_quiz: (context) => AllQuiz(),
  start_quiz: (context) => StartQuiz(),
  leader_board: (context) => LeaderBoard(),
  course_review: (context) => CourseReview(),
  assignment: (context) => AssignMent(),
  assignment_details: (context) => AssainmnetDetails(),
  upload_assignment: (context) => UploadAssignment(),
  notice_board: (context) => NoticeBoard(),
  live_class: (context) => LiveClass(),
  discussion: (context) => Discussion(),
  topinstructor: (context) => TopInstructor(),
  profile_setting: (context) => ProfileSetting(),
  edit_profile: (context) => EditProfile(),
  change_password: (context) => ChangePassword(),
  help_support: (context) => HelpAndSupport(),
  booking: (context) => Booking(),
  payment: (context) => Payment(),
  checkout: (context) => CheckOut(),
  forum: (context) => Forum(),
  forum_leaderboard: (context) => SplashScreen(),
  ask_a_question: (context) => SplashScreen(),
  subscription_panel: (context) => SplashScreen(),
  affiliate_panel: (context) => SplashScreen(),
};

List<GetPage> getPages = [
  GetPage(
    name: splash,
    page: () => SplashScreen(),
  ),
  GetPage(
    name: open_screen,
    page: () => OpenScreen(),
  ),
  GetPage(
    name: register_screen,
    page: () => RegisterScreen(),
  ),
  GetPage(
    name: sign_in_screen,
    page: () => SignInScreen(),
  ),
  GetPage(
    name: otp_screen,
    page: () => OtpScreen(),
  ),
  GetPage(
    name: base_view,
    page: () => BaseView(),
  ),
  GetPage(
    name: search_screen,
    page: () => SearchScreen(),
  ),
  GetPage(
    name: course_details,
    page: () => CourseDetails(),
  ),
  GetPage(
    name: my_learning,
    page: () => MyLearning(),
  ),
  GetPage(
    name: purchase_course,
    page: () => PurchasedCourse(),
  ),
  GetPage(
    name: course_video_play,
    page: () => CourseVideoPlay(),
  ),
  GetPage(
    name: multi_languages,
    page: () => MultiLanguages(),
  ),
  GetPage(
    name: purchased_course_overview,
    page: () => PurchasedCourseOverview(),
  ),
  GetPage(
    name: course_resources,
    page: () => CourseResourse(),
  ),
  GetPage(
    name: all_quiz,
    page: () => AllQuiz(),
  ),
  GetPage(
    name: start_quiz,
    page: () => StartQuiz(),
  ),
  GetPage(
    name: leader_board,
    page: () => LeaderBoard(),
  ),
  GetPage(
    name: course_review,
    page: () => CourseReview(),
  ),
  GetPage(
    name: assignment,
    page: () => AssignMent(),
  ),
  GetPage(
    name: assignment_details,
    page: () => AssainmnetDetails(),
  ),
  GetPage(
    name: upload_assignment,
    page: () => UploadAssignment(),
  ),
  GetPage(
    name: notice_board,
    page: () => NoticeBoard(),
  ),
  GetPage(
    name: live_class,
    page: () => LiveClass(),
  ),
  GetPage(
    name: discussion,
    page: () => Discussion(),
  ),
  GetPage(
    name: topinstructor,
    page: () => TopInstructor(),
  ),
  GetPage(
    name: profile_setting,
    page: () => ProfileSetting(),
  ),
  GetPage(
    name: edit_profile,
    page: () => EditProfile(),
  ),
  GetPage(
    name: change_password,
    page: () => ChangePassword(),
  ),
  GetPage(
    name: help_support,
    page: () => HelpAndSupport(),
  ),
  GetPage(
    name: booking,
    page: () => Booking(),
  ),
  GetPage(
    name: payment,
    page: () => Payment(),
  ),
  GetPage(
    name: checkout,
    page: () => CheckOut(),
  ),
  GetPage(
    name: forum,
    page: () => Forum(),
  ),
  GetPage(
    name: forum_leaderboard,
    page: () => ForumLeaderBoard(),
  ),
  GetPage(
    name: ask_a_question,
    page: () => AskQuesion(),
  ),
  GetPage(
    name: subscription_panel,
    page: () => SubscriptionPanel(),
  ),
  GetPage(
    name: affiliate_panel,
    page: () => AffiliatePanel(),
  ),
];
