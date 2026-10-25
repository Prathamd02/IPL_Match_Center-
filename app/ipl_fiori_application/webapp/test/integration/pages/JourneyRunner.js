sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"iplfioriapplication/test/integration/pages/TeamsList.gen",
	"iplfioriapplication/test/integration/pages/TeamsObjectPage.gen"
], function (JourneyRunner, TeamsListGenerated, TeamsObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('iplfioriapplication') + '/test/flp.html#app-preview',
        pages: {
			onTheTeamsListGenerated: TeamsListGenerated,
			onTheTeamsObjectPageGenerated: TeamsObjectPageGenerated
        },
        async: true
    });

    return runner;
});

