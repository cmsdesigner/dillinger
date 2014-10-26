
'use strict'

module.exports =
  angular
  .module('documents.export.service', ['documents.service'])
  .factory 'documentsExportService',
  ($http, documentsService, diNotify) ->

    service =

      type: null
      file: null

      fetchHTML: (styled) ->
        di = diNotify('Fetching HTML...')
        $http.post('factory/fetch_html',
          name: documentsService.getCurrentDocumentTitle()
          unmd: documentsService.getCurrentDocumentBody()
          formatting: if styled then styled else false
        )
        .success (response) ->
          di?.$scope.$close()
          service.type = 'html'
          service.file = response.data
        .error (err) ->
          diNotify(message: "An Error has happened: #{err}")

      fetchPDF: ->
        di = diNotify('Fetching PDF...')
        $http.post('factory/fetch_pdf',
          name: documentsService.getCurrentDocumentTitle()
          unmd: documentsService.getCurrentDocumentBody()
        )
        .success (response) ->
          di?.$scope.$close()
          service.type = 'pdf'
          service.file = response.data
        .error (err) ->
          diNotify(message: "An Error has happened: #{err}")

      fetchMarkdown: ->
        di = diNotify('Fetching Markdown...')
        $http.post('factory/fetch_markdown',
          name: documentsService.getCurrentDocumentTitle()
          unmd: documentsService.getCurrentDocumentBody()
        )
        .success (response) ->
          di?.$scope.$close()
          service.type = 'md'
          service.file = response.data
        .error (err) ->
          diNotify(message: "An Error has happened: #{err}")

    return service

