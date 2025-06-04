sap.ui.define(
    ["sap/fe/core/AppComponent", "sap/ui/core/Component"],
    function (AppComponent, Component) {
      "use strict";
  
      return AppComponent.extend("gameui.Component", {
        metadata: {
          manifest: "json",
        },
  
        init: function () {
          AppComponent.prototype.init.apply(this, arguments);
  
          // Zorg dat de juiste taal gezet wordt op het i18n-model
          const sLang = sap.ui.getCore().getConfiguration().getLanguage();
          const oModel = this.getModel("i18n");
          if (oModel && oModel.enhance) {
            oModel.enhance({
              bundleName: "gameui.i18n.i18n",
              bundleLocale: sLang
            });
          }
        }
      });
    }
  );
  