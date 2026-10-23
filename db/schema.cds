namespace ipl;
using {cuid, managed} from '@sap/cds/common';


entity Teams : cuid , managed{
    teamCode : String(3) @assert.unique:{ teamCode: teamCode } @mandatory;
    teamName : String(100) @mandatory;
    homeCity : String(30) ;
    foundedYear : Integer ;
    players : Composition of many Players on players.team = $self;      // one Team can have many Players.   
 
}

entity Players : cuid , managed{
    playerName : String(100) @mandatory;
    dateOfBirth : Date;
    country : String(20);
    role : Role not null;
    jerseyNumber : Integer @mandatory @assert.range:[1, 99];
    isCaptain : Boolean default false ;
    team : Association to Teams @mandatory;    // every Player must have exactly one Team.

}


entity Venues : cuid , managed{
    stadiumName : String(100) @mandatory;
    city : String(20) ;
    seatingCapacity : Integer ; 
}

entity Matches : cuid , managed{
    matchDate : Date @mandatory;
    status : MatchStatus not null;
    homeTeam :  Association to Teams @mandatory;
    awayTeam :  Association to Teams @mandatory;
    venue :   Association to Venues @mandatory;
    winner :  Association to Teams ;
    resultMargin : String(100);  
    performances : Composition of many Performances on performances.match = $self;
}

entity Performances : cuid , managed{
    player : Association to Players not null; 
    runsScored : Integer @mandatory @assert.range: [0, 2147483647];
    ballsFaced : Integer @mandatory @assert.range: [0, 2147483647];
    wicketsTaken : Integer @mandatory @assert.range: [0, 10];
    match : Association to Matches @mandatory;
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



