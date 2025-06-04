sap.ui.define([
    "sap/fe/core/controllerextensions/ListReport/Controller"
  ], function (ListReportController) {
    "use strict";
  
    return ListReportController.extend("gameui.ext.controller.StudentListExt", {
      onGoToGames: function () {
        this.extensionAPI.navigateToRoute("GameList");
      }
    });
  });
  