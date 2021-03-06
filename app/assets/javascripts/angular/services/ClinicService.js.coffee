@salubrity
  
  .factory 'ClinicService', ($resource, $http) ->

    class ClinicService
      constructor: (errorHandler) ->
        @service = $resource('/clinics/:id.json',
          {id: '@id'},
          {update: {method: 'PATCH'}})
        @errorHandler = errorHandler

        # Fix needed for the PATCH method to use application/json content type
        defaults = $http.defaults.headers
        defaults.patch = defaults.patch || {}
        defaults.patch['Content-Type'] = 'application/json'

      create: (attrs, successHandler) ->
        new @service(clinic: attrs).$save ((clinic) -> successHandler(clinic)), @errorHandler

      delete: (clinic) ->
        new @service().$delete {id: clinic.id}, (-> null), @errorHandler

      update: (clinic, attrs) ->
        new @service(clinic: attrs).$update {id: clinic.id}, (-> null), @errorHandler

      all: (callback) ->
        @service.query(callback || (-> null), @errorHandler)

      find: (id, successHandler) ->
        @service.get(id: id, ((clinic)->
          successHandler?(clinic)
          clinic),
        @errorHandler)