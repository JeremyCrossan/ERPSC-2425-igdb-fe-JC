using GameService as service from '../../srv/game-service';

annotate service.Game with @(
    UI.SelectionFields : [ Genre, Platform ],
    UI.LineItem : [
         {
            $Type : 'UI.DataField',
            Label : '{i18n>Game_ID}',
            Value : Game_ID,
        }, 
        {
            $Type: 'UI.DataFieldWithUrl',
            Value: Cover_url,
            Url: Cover_url,
            IconUrl: Cover_url,
            Label: '{i18n>Cover}'
            },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Name}',
            Value : Name,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Genre}',
            Value : Genre,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Publisher}',
            Value : Publisher,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Platform}',
            Value : Platform,
        },
    ],
    UI.HeaderInfo : {
            TypeName : 'Game',
            TypeNamePlural : 'Games',
            Title : {
              $Type : 'UI.DataField',
              Value : Name
            }
    },
    UI.HeaderFacets : [
          {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>General Information}',
            Target : '@UI.FieldGroup#GeneratedGroup1'
          },
          {
            $Type : 'UI.CollectionFacet',
            Label : '{i18n>Favorites}',
            Facets : [
                      {
            $Type : 'UI.ReferenceFacet',
            Label : 'Toevoegen aan favorieten',
            Target : '@UI.DataFieldForAction#AddToFavorite'
          },
          {
            $Type : 'UI.ReferenceFacet',
            Label : 'Verwijderen uit favorieten',
            Target : '@UI.DataFieldForAction#RemoveFromFavorite'
          }
            ]
      }
    ],
    );

annotate service.Game with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Game_ID}',
                Value : Game_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Name}',
                Value : Name,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Genre}',
                Value : Genre,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Publisher}',
                Value : Publisher,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Platform}',
                Value : Platform,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Release_date}',
                Value : Release_date,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Cover_url}',
                Value : Cover_url,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Description}',
                Value : Description,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : '{i18n>General Information}',
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


/* @UI.LineItem : [
  { $Type: 'UI.DataField', Value: Game_ID, Label: '{i18n>Game_ID}' },
  { $Type: 'UI.DataField', Value: to_game.Name, Label: '{i18n>Name}' }
] */
/* annotate service.FavoriteGame with @(
    UI.LineItem #Favorietegames : [
        {
            $Type : 'UI.DataField',
            Value : to_game.Cover_url,
            Label : 'Cover',
        }, 
        {
            $Type : 'UI.DataFieldWithUrl',
            Value : to_game.Name,
            Label : 'Name',
            Url : GameUrl,
        },
        {
            $Type : 'UI.DataField',
            Value : to_game.Genre,
            Label : 'Genre',
        },
        {
            $Type : 'UI.DataField',
            Value : to_game.Description,
            Label : 'Description',
        },
        {
            $Type : 'UI.DataField',
            Value : to_game.Platform,
            Label : 'Platform',
        },
    ],
    UI.Identification : [
        {
            $Type : 'UI.DataField',
            Value : to_game.Name
        }
    ]
); */

annotate service.Student with @(
  UI.SelectionFields : [ First_name, Last_name ],
  UI.LineItem : [
    { $Type : 'UI.DataField', Value : First_name },
    { $Type : 'UI.DataField', Value : Last_name }
  ],
  UI.Facets : [
    {
      $Type  : 'UI.ReferenceFacet',
      ID     : 'FavorieteGames',
      Label  : 'Favorite games',
      Target : 'to_StudentFavoriteGamesView/@UI.LineItem'
    }
  ],
  UI.HeaderInfo : {
    TypeName : 'Student',
    TypeNamePlural : 'Students',
    Title : {
        $Type : 'UI.DataField',
        Value : First_name,
        Label : 'First Name'
    },
    Description : {
        $Type : 'UI.DataField',
        Value : Last_name,
        Label : 'Last Name'
    }
  }
);

annotate service.Game with {
    Cover_url @UI.IsImageURL : true
};

annotate service.StudentFavoriteGamesView with {
  Cover_url @UI.IsImageURL : true;
};

annotate service.StudentFavoriteGamesView with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : Cover_url,
            Label : 'Cover',
        }, 
        {
            $Type : 'UI.DataFieldWithUrl',
            Label : 'Game Name',
            Value : GameName,
            Url   : GameUrl
        },
        {
            $Type : 'UI.DataField',
            Value : Genre,
            Label : 'Genre'
        },
        {
            $Type : 'UI.DataField',
            Value : Platform,
            Label : 'Platform'
        },
        {
            $Type : 'UI.DataField',
            Value : Description,
            Label : 'Description'
        }
    ]
);





