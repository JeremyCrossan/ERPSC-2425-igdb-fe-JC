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
   
/*   sap.ui.define(
    ["sap/fe/core/AppComponent"],
    function (AppComponent) {
      "use strict";
  
      return AppComponent.extend("gameui.Component", {
        metadata: {
          manifest: "json"
        },
  
        init: function () {
          // Init van AppComponent
          AppComponent.prototype.init.apply(this, arguments);
  
          // ✅ FORCEER TEMPORAIR DE TAAL (bv. Spaans)
          sap.ui.getCore().getConfiguration().setLanguage("es");
  
          // ✅ Zorg dat de juiste taal geladen wordt in het i18n-model
          const sLang = sap.ui.getCore().getConfiguration().getLanguage();
          const oModel = this.getModel("i18n");
  
          if (oModel && oModel.enhance) {
            oModel.enhance({
              bundleName: "gameui.i18n.i18n",
              bundleLocale: sLang
            });
          }
  
          // ✅ Test: label ophalen (zie console)
          if (oModel && oModel.getResourceBundle) {
            const sTestLabel = oModel.getResourceBundle().getText("First_name");
            console.log("Voorbeeldlabel [First_name]:", sTestLabel);
          }
        }
      });
    }
  ); */
  