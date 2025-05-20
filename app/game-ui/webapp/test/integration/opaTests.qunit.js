sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'gameui/test/integration/FirstJourney',
		'gameui/test/integration/pages/GameList',
		'gameui/test/integration/pages/GameObjectPage'
    ],
    function(JourneyRunner, opaJourney, GameList, GameObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('gameui') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheGameList: GameList,
					onTheGameObjectPage: GameObjectPage
                }
            },
            opaJourney.run
        );
    }
);