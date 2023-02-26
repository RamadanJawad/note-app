class ApiSetting {
  static const _baseApi = "http://demo-api.mr-dev.tech/api/";
  static const login = "${_baseApi}students/auth/login";
  static const createTask = "${_baseApi}tasks";
  static String updateTaskUrl(int id) {
    return "${_baseApi}tasks/$id";
  }
}
