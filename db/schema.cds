namespace ipl;
using {cuid, managed} from '@sap/cds/common';


entity Teams : cuid , managed{
    teamCode : String(3) @assert.unique ;
    teamName : String(100) @mandatory;
    homeCity : String(20) @mandatory;
    foundedYear : Integer @mandatory;
    players : Composition of many Players on players.team = $self;      // one Team can have many Players.   
 
}

entity Players : cuid , managed{
    playerName : String(100) @mandatory;
    dateOfBirth : Date;
    country : String(20);
    role : Role not null;
    jerseyNumber : Integer @mandatory @assert.unique ;
    isCaptain : Boolean default false not null;
    team : Association to Teams not null;    // every Player must have exactly one Team.

}


entity Venues : cuid , managed{
    stadiumName : String(100) @mandatory;
    city : String(20) @mandatory;
    seatingCapacity : Integer @mandatory; 
}

entity Matches : cuid , managed{
    matchDate : Date @mandatory;
    status : MatchStatus not null;
    homeTeam :  Association to Teams not null;
    awayTeam :  Association to Teams not null;
    venue :   Association to Venues not null;
    winner :  Association to Teams ;
    resultMargin : String(100);  
    performances : Composition of many Performances on performances.match = $self;
}

entity Performances : cuid , managed{
    player : Association to Players not null; 
    runsScored : Integer @mandatory;
    ballsFaced : Integer @mandatory;
    wicketsTaken : Integer @mandatory;
    match : Association to Matches not null;
}

type MatchStatus : String(20) enum{
    scheduled = 'SCHEDULED';
    completed = 'COMPLETED';
    abandoned = 'ABANDONED';
}

type Role : String(20) enum{
    Batter = 'BATTER';
    Bowler = 'BOWLER';
    AllRounder = 'ALL-ROUNDER';
    WicketKeeper = 'WICKET-KEEPER'
}