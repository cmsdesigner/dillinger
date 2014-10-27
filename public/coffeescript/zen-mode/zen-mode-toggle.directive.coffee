
'use strict'

module.exports =
  angular
  .module('diZenMode.directives', [])
  .directive 'toggleZenMode',
  ->

    directive =
      restrict: 'E'
      replace: true
      controller: 'diZenMode'
      controllerAs: 'zenmode'
      template: require('raw!./zen-mode-toggle.directive.html')

    return directive
