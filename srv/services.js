
const cds = require('@sap/cds');

module.exports = class IPLMatches extends cds.ApplicationService {
    async init() {
        const { Matches } = this.entities;

        this.before(['CREATE', 'UPDATE'], Matches, (req) => {
            const { homeTeam_ID, awayTeam_ID } = req.data;

            if (homeTeam_ID && awayTeam_ID && homeTeam_ID === awayTeam_ID) 
                {
                req.error( 400, 'Home Team and Away Team must be different', 'awayTeam_ID'
                );
            }
        });

        return super.init();
    }
};
