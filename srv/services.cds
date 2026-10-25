using ipl as ipl from '../db/schema';

service MatchCentreService {
    @readonly
    entity Teams as projection on ipl.Teams
        excluding {createdAt, createdBy, modifiedBy, modifiedAt};

    @readonly
    entity Players as projection on ipl.Players
        excluding {createdAt, createdBy, modifiedBy, modifiedAt};

    @readonly
    entity Matches as projection on ipl.Matches 
        excluding {createdAt, createdBy, modifiedBy, modifiedAt};
    
    @readonly
    entity Venues as projection on ipl.Venues 
        excluding {createdAt, createdBy, modifiedBy, modifiedAt};
    
    // @readonly
    // entity Performance as projection on ipl.Performances
    //     excluding {createdAt, createdBy, modifiedBy, modifiedAt};
    
}

service AdminService @(
    requires : 'admin'
){
    @odata.draft.enabled
    entity Teams as projection on ipl.Teams;
    entity Players as projection on ipl.Players;
    entity Matches as projection on ipl.Matches  actions {
        action completeMatch(
            winner : UUID,
            margin : String(100)
        ) returns Matches;

        action abandonMatch() returns Matches;
    };
    
    entity Venues as projection on ipl.Venues ;
   

}

