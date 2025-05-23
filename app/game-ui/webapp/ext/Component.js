sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/core/UIComponent"
  ], function (Controller, UIComponent) {
    "use strict";
  
    return {
      onLanguageChange: function (oEvent) {
        const sSelectedLang = oEvent.getSource().getSelectedKey();
        const oComponent = UIComponent.getOwnerComponentFor(oEvent.getSource());
        const oI18nModel = oComponent.getModel("i18n");
  
        sap.ui.getCore().getConfiguration().setLanguage(sSelectedLang);
        oI18nModel.enhance({
          bundleName: "gameui.i18n.i18n",
          bundleLocale: sSelectedLang
        });
      },
  
      onGoToStudents: function () {
        const oShell = sap.ushell && sap.ushell.Container;
        if (oShell) {
          oShell.getService("CrossApplicationNavigation").toExternal({
            target: {
              shellHash: "#StudentList"
            }
          });
        } else {
          // Fallback (bijv. lokaal): gebruik hash direct
          window.location.hash = "#StudentList";
        }
      }
      
    };
  });
  