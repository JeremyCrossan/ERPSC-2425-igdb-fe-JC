using GameService as service from '../../srv/game-service';

annotate service.Game with @(
    UI.SelectionFields : [ Genre, Platform ],
    UI.LineItem : [
         {
            $Type : 'UI.DataField',
            Label : 'Game_ID',
            Value : Game_ID,
        }, 
        {
            $Type: 'UI.DataFieldWithUrl',
            Value: Cover_url,
            Url: Cover_url,
            IconUrl: Cover_url,
            Label: 'Cover'
            },
        {
            $Type : 'UI.DataField',
            Label : 'Name',
            Value : Name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Genre',
            Value : Genre,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Publisher',
            Value : Publisher,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Platform',
            Value : Platform,
        },
    ]
);
annotate service.Game with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Game_ID',
                Value : Game_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Name',
                Value : Name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Genre',
                Value : Genre,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Publisher',
                Value : Publisher,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Platform',
                Value : Platform,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Release_date',
                Value : Release_date,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Cover_url',
                Value : Cover_url,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Description',
                Value : Description,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ]
);

annotate service.Game with {
  Genre @( 
    Common.ValueList : {
      $Type : 'Common.ValueListType',
      CollectionPath : 'GenreList',
      Parameters : [
        {
          $Type : 'Common.ValueListParameterInOut',
          LocalDataProperty : Genre,
          ValueListProperty : 'Genre'
        }
      ]
    },
    Common.ValueListWithFixedValues : true
  );
};

annotate service.Game with {
  Platform @( 
    Common.ValueList : {
      $Type : 'Common.ValueListType',
      CollectionPath : 'PlatformList',
      Parameters : [
        {
          $Type : 'Common.ValueListParameterInOut',
          LocalDataProperty : Platform,
          ValueListProperty : 'Platform'
        }
      ]
    },
    Common.ValueListWithFixedValues : true
  );
};




