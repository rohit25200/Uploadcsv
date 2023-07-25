sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'db/finalorder/test/integration/FirstJourney',
		'db/finalorder/test/integration/pages/OrderList',
		'db/finalorder/test/integration/pages/OrderObjectPage'
    ],
    function(JourneyRunner, opaJourney, OrderList, OrderObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('db/finalorder') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheOrderList: OrderList,
					onTheOrderObjectPage: OrderObjectPage
                }
            },
            opaJourney.run
        );
    }
);