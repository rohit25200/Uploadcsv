sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'db/orderdata/test/integration/FirstJourney',
		'db/orderdata/test/integration/pages/Orde01List',
		'db/orderdata/test/integration/pages/Orde01ObjectPage'
    ],
    function(JourneyRunner, opaJourney, Orde01List, Orde01ObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('db/orderdata') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheOrde01List: Orde01List,
					onTheOrde01ObjectPage: Orde01ObjectPage
                }
            },
            opaJourney.run
        );
    }
);