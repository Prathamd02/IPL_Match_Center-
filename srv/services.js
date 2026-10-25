const cds = require('@sap/cds');
const { SELECT, DELETE, UPDATE } = require('@sap/cds/lib/ql/cds-ql');
module.exports = class IPLMatches extends cds.ApplicationService {
    async init() {
        const { Matches, Players, Teams } = this.entities;

        this.before(['CREATE', 'UPDATE'], Matches, (req) => {
            const { homeTeam_ID, awayTeam_ID } = req.data;

            if (homeTeam_ID && awayTeam_ID && homeTeam_ID === awayTeam_ID) 
                {
                req.error( 400, 'Home Team and Away Team must be different', 'awayTeam_ID');
            }
        });

        // Rejects a second captain in the same team
        this.before(['CREATE', 'UPDATE'], Players, async (req) => {
    
            const { ID, team_ID, isCaptain } = req.data;
            // Validate only when the player is marked as captain
            if (isCaptain !== true || !team_ID) return;

            // Check whether another captain already exists in this team
            const existingCaptain = await SELECT.one.from(Players).where({team_ID : team_ID, isCaptain:true});

            if(existingCaptain && existingCaptain.ID !== ID){
                req.error(400, 'This team already has a captain. Only one captain is allowed per team.','isCaptain');
            }
        });

        // DELETE on Teams---> Rejects if the team still has players or matches
        this.before(DELETE, Teams, async (req) => {
            const teams_ID = req.params[0].ID;
            const enrollments = SELECT.from('ipl.players').where({team_ID : team_ID });
             const players = await SELECT.from(Players).where({ team_ID: teamID });

            if (enrollments.length >0){
                req.error(409, 'Cannot delete team : ${enrollments.length} player(s) are in team. Remove the player(s) first')
            }
        });

        // Sets status to Completed with winner and margin; only for Scheduled matches; winner must be the home or away team

        this.on('completeMatch', async (req)=>{
            const {winner, resultMargin} = req.data;
            const matchID = req.params[0].ID;

            // Fetch the match
            const match = await SELECT.one.from(Matches).where({ID : matchID });

            // If match not found 
            if(!match){
                return req.reject(404, 'Match not found.');
            }

            // Only scheduled matches can be completed
            if (match.status !== 'SCHEDULED'){
                return req.reject(400,'Only scheduled matches can be completed.');
            }

             // Winner must be either the home or away team
             if (winner !== match.homeTeam_ID && winner.awayTeam_ID){
                return req.reject(400, 'Winner must be either the home team or away team.');
             }

             // If Result margin leave empty
             if(!resultMargin || !resultMargin.trim()){
                return req.reject(400, 'Result margin is required.');
             }

             // Update match result
             await UPDATE(Matches).set({
                    status: 'COMPLETED',
                    winner_ID: winner,
                    resultMargin: resultMargin
             }).where({ID: matchID});

             // Return updated match
             return SELECT.one.from(Matches).where({ID: matchID});
        });

        this.on('abandonMatch', async req=>{
            const matchID = req.params[0].ID;
             // Fetch the match
            const match = await SELECT.one.from(Matches).where({ ID: matchID });

            if (!match) {
                return req.reject(404, 'Match not found.');
            }

            // Only scheduled matches can be abandoned
            if (match.status !== 'SCHEDULED') {
                return req.reject(400,'Only scheduled matches can be abandoned.');
            }

            // Update status
            await UPDATE(Matches).set({status: 'ABANDONED'}).where({ ID: matchID });

            // Return updated match
            return SELECT.one.from(Matches).where({ ID: matchID });
        });

        return super.init();
    }
};
