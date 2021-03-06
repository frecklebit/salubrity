@salubrity
  
  .controller 'SurveyCreateCtrl', 
    ($scope, SurveyService, $location, $modalInstance) ->


      $scope.init = ->
        @SurveyService = new SurveyService(serverErrorHandler)
        $scope.siteUrl = $location.protocol() + '://' + $location.host() + '/'
        $scope.btnLabel = 'Build Survey'


      $scope.proceed = (survey) ->
        @SurveyService.create survey, (survey) ->
          $modalInstance.close()
          $location.path "/surveys/#{survey.id}/build"


      serverErrorHandler = ->
        swal(
          title: 'Error!'
          text: "There was a server error, please reload the page and try again."
          type: 'error'
          confirmButtonText: 'Ok'
        )