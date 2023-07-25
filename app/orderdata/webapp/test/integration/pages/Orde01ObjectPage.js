sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'db.orderdata',
            componentId: 'Orde01ObjectPage',
            entitySet: 'Orde01'
        },
        CustomPageDefinitions
    );
});