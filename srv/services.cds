using ipl as ipl from '../db/schema';

service IPLMatches{
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
    
    @readonly
    entity Performance as projection on ipl.Performances
        excluding {createdAt, createdBy, modifiedBy, modifiedAt};
    
}

service AdminService @(
    requires : 'admin'
){
    entity Teams as projection on ipl.Teams;
    entity Players as projection on ipl.Players;
    entity Matches as projection on ipl.Matches ;
    entity Venues as projection on ipl.Venues ;
    entity Performance as projection on ipl.Performances;

}