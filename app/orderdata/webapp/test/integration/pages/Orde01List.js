sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'db.orderdata',
            componentId: 'Orde01List',
            entitySet: 'Orde01'
        },
        CustomPageDefinitions
    );
});