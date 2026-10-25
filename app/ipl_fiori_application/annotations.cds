using AdminService as service from '../../srv/services';
annotate service.Teams with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Team Code',
                Value : teamCode,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Team Name',
                Value : teamName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Home City',
                Value : homeCity,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Founded Year',
                Value : foundedYear,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'teamCode',
            Value : teamCode,
        },
        {
            $Type : 'UI.DataField',
            Label : 'teamName',
            Value : teamName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'homeCity',
            Value : homeCity,
        },
        {
            $Type : 'UI.DataField',
            Label : 'foundedYear',
            Value : foundedYear,
        },
    ],
);

