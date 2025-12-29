class ApiEndpoints {
  static const baseUrl = "http://172.252.13.92:8052";

  // AUTH
  static const register = "/user/register";
  static const activateUser = "/user/activate-user";
  static const login = "/user/login";
  static const myProfile = "/user/my-profile";
  static const updateProfile = "/user/update-profile";

  // TASK
  static const createTask = "/task/create-task";
  static const getAllTask = "/task/get-all-task";
  static const getTask = "/task/get-task/";
  static const deleteTask = "/task/delete-task/";
}
