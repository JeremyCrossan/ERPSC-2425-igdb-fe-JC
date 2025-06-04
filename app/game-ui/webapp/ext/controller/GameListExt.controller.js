sap.ui.define([
    "sap/fe/core/controllerextensions/ListReport/Controller"
  ], function (ListReportController) {
    "use strict";
  
    return ListReportController.extend("gameui.ext.controller.GameListExt", {
      onGoToStudents: function () {
        this.extensionAPI.navigateToRoute("StudentList");
      }
    });
  });
  