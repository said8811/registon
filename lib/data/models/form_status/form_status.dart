enum FormStatus {
  pure,
  loading,
  success,
  failure,

  //GET
  gettingInProgress,
  gettingInFailure,
  gettingInSuccess,

  //DELETE

  deletingInProgress,
  deletingInSuccess,
  deletingInFailure,

  //CREATE

  creatingInProgress,
  creatingInSuccess,
  creatingInFailure,

  gettingStudentInfoInProgress,
  gettingStudentInfoInSuccess,
  gettingStudentInfoInFailury,

  //DELETE Student

  deletingStudentInfoInProgress,
  deletingStudentInfoInSuccess,
  deletingStudentInfoInFailury,

  //UPDATE Student INFO

  updateStudentInfoInProgress,
  updateStudentInfoInSuccess,
  updateStudentInfoInFailury,
}
