using GameService as service from '../../srv/game-service';

annotate service.Game with {
  Cover_url @UI.IsImageURL : true;

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

annotate service.Game with @(
  UI.SelectionFields : [ Genre, Platform ],

  UI.LineItem : [
    {
      $Type : 'UI.DataField',
      Label : 'Game ID',
      Value : Game_ID
    },
    {
      $Type : 'UI.DataFieldWithUrl',
      Value : Cover_url,
      Url : Cover_url,
      IconUrl : Cover_url,
      Label : 'Cover'
    },
    {
      $Type : 'UI.DataField',
      Label : 'Naam',
      Value : Name
    },
    {
      $Type : 'UI.DataField',
      Label : 'Genre',
      Value : Genre
    },
    {
      $Type : 'UI.DataField',
      Label : 'Uitgever',
      Value : Publisher
    },
    {
      $Type : 'UI.DataField',
      Label : 'Platform',
      Value : Platform
    }
  ],

  UI.HeaderInfo : {
    TypeName : 'Game',
    TypeNamePlural : 'Games',
    Title : {
      $Type : 'UI.DataField',
      Value : Name
    }
  },

  UI.Facets : [
    {
      $Type : 'UI.ReferenceFacet',
      ID : 'GeneralInfoSection',
      Label : 'Algemene informatie',
      Target : '@UI.FieldGroup#GeneralInfo'
    }
  ],

  UI.FieldGroup #GeneralInfo : {
    $Type : 'UI.FieldGroupType',
    Data : [
      { $Type : 'UI.DataField', Label : 'Game ID',      Value : Game_ID },
      { $Type : 'UI.DataField', Label : 'Naam',          Value : Name },
      { $Type : 'UI.DataField', Label : 'Genre',         Value : Genre },
      { $Type : 'UI.DataField', Label : 'Uitgever',     Value : Publisher },
      { $Type : 'UI.DataField', Label : 'Platform',      Value : Platform },
      { $Type : 'UI.DataField', Label : 'Releasedatum',  Value : Release_date },
      { $Type : 'UI.DataField', Label : 'Beschrijving',   Value : Description }
    ]
  }
);

annotate service.Student with @(
  UI.SelectionFields : [ First_name, Last_name ],
  UI.LineItem : [
    { $Type : 'UI.DataField', Value : First_name, Label: 'Voornaam' },
    { $Type : 'UI.DataField', Value : Last_name, Label: 'Achternaam' }
  ],
  UI.HeaderInfo : {
    TypeName : 'Student',
    TypeNamePlural : 'Studenten',
    Title : {
      $Type : 'UI.DataField',
      Value : First_name,
      Label : 'Voornaam'
    },
    Description : {
      $Type : 'UI.DataField',
      Value : Last_name,
      Label : 'Achternaam'
    }
  },
  UI.Facets : [
    {
      $Type : 'UI.ReferenceFacet',
      ID : 'GeneralInfo',
      Label : 'Student', 
      Target : '@UI.FieldGroup#CreateStudent',
    },
    {
      $Type  : 'UI.ReferenceFacet',
      ID     : 'FavorieteGames',
      Label  : 'Favoriete Games',
      Target : 'to_favos/@UI.LineItem'
    }
  ]
);

annotate service.Student with @(
    UI.FieldGroup #CreateStudent : {
        $Type : 'UI.FieldGroupType',
        Label : 'Student', 
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Voornaam',
                Value : First_name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Achternaam',
                Value : Last_name,
            }
        ]
    }, 
);

annotate service.FavoriteGame with @(
  UI.HeaderInfo : {
    TypeName : 'Favoriete Game',
    TypeNamePlural : 'Favoriete Games',
    Title : {
      $Type : 'UI.DataField',
      Value : to_game.Name,
      Label : 'Naam'
    },
    Description : {
      $Type : 'UI.DataField',
      Value : to_game.Genre,
      Label : 'Genre'
    }
  },

  UI.HeaderFacets : [
  {
    $Type : 'UI.ReferenceFacet',
    ID : 'CoverHeader',
    Label : '',
    Target : '@UI.FieldGroup#CoverInHeader'
  }
],

  UI.FieldGroup #CoverInHeader : {
    $Type : 'UI.FieldGroupType',
    Data : [
      {
        $Type : 'UI.DataField',
        Label : '',
        Value : to_game.Cover_url
      },
      {
        $Type : 'UI.DataFieldWithUrl',
        Label : '',
        Value : 'Bekijk cover',
        Url   : to_game.Cover_url
      }
    ]
  },

  UI.LineItem : [
    {
      $Type : 'UI.DataField',
      Value : to_game.Cover_url,
      Label : 'Cover'
    },
    {
      $Type : 'UI.DataFieldWithNavigationPath',
      Value : to_game.Name,
      Label : 'Naam',
      Target : 'to_game'
    },
    {
      $Type : 'UI.DataField',
      Value : to_game.Genre,
      Label : 'Genre'
    },
    {
      $Type : 'UI.DataField',
      Value : to_game.Platform,
      Label : 'Platform'
    }
  ],

  UI.Facets : [
  {
    $Type : 'UI.ReferenceFacet',
    ID : 'FavoriteGameDetails',
    Label : 'Details',
    Target : '@UI.FieldGroup#FavoriteGameDetailsGroup'
  }
],

  UI.FieldGroup #FavoriteGameDetailsGroup : {
  $Type : 'UI.FieldGroupType',
  Label : 'Game Details',
  Data : [
    {
      $Type : 'UI.DataField',
      Label : 'Game ID',
      Value : to_game.Game_ID
    },
    {
      $Type : 'UI.DataField',
      Label : 'Platform',
      Value : to_game.Platform
    },
    {
      $Type : 'UI.DataField',
      Label : 'Publisher',
      Value : to_game.Publisher
    },
    {
      $Type : 'UI.DataField',
      Label : 'Releasedatum',
      Value : to_game.Release_date
    },
    {
      $Type : 'UI.DataField',
      Label : 'Beschrijving',
      Value : to_game.Description
    }
  ]
}
);

annotate service.FavoriteGame with {
  Game_ID @(
    Common.ValueList : {
      $Type : 'Common.ValueListType',
      CollectionPath : 'Game',
      Parameters : [
        {
          $Type : 'Common.ValueListParameterInOut',
          LocalDataProperty : Game_ID,
          ValueListProperty : 'Game_ID'
        },
        {
          $Type : 'Common.ValueListParameterInOut',
          LocalDataProperty : Game_ID,
          ValueListProperty : 'Name'
        },
        {
          $Type : 'Common.ValueListParameterInOut',
          LocalDataProperty : Game_ID,
          ValueListProperty : 'Genre'
        },
        {
          $Type : 'Common.ValueListParameterInOut',
          LocalDataProperty : Game_ID,
          ValueListProperty : 'Platform'
        }
      ]
    },
    Common.Label : 'Game'
  );
};





// annotations.cds met i18n labels => WERKT NIET
/*
using GameService as service from '../../srv/game-service';

annotate service.Game with {
  Cover_url @UI.IsImageURL : true;

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

annotate service.Game with @(
  UI.SelectionFields : [ Genre, Platform ],

  UI.LineItem : [
    {
      $Type : 'UI.DataField',
      Label : '{i18n>Game_ID}',
      Value : Game_ID
    },
    {
      $Type : 'UI.DataFieldWithUrl',
      Value : Cover_url,
      Url : Cover_url,
      IconUrl : Cover_url,
      Label : '{i18n>Cover}'
    },
    {
      $Type : 'UI.DataField',
      Label : '{i18n>Name}',
      Value : Name
    },
    {
      $Type : 'UI.DataField',
      Label : '{i18n>Genre}',
      Value : Genre
    },
    {
      $Type : 'UI.DataField',
      Label : '{i18n>Publisher}',
      Value : Publisher
    },
    {
      $Type : 'UI.DataField',
      Label : '{i18n>Platform}',
      Value : Platform
    }
  ],

  // ===== Header-inhoud (titel) =====
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
      Label : '',
      Target : '@UI.FieldGroup#CoverOnly'
    }
  ],

  // ===== Afbeelding bovenaan via FieldGroup =====
  UI.FieldGroup #CoverOnly : {
  $Type : 'UI.FieldGroupType',
  Data : [
      {
      $Type : 'UI.DataField',
      Value : Cover_url
      },
      {
      $Type : 'UI.DataFieldWithUrl',
      Value : '{i18n>Bekijk_afbeelding}',
      Url   : Cover_url
      }
    ]
  },

  // ===== Detailpagina met "General Information" sectie =====
  UI.Facets : [
    {
      $Type : 'UI.ReferenceFacet',
      ID : 'GeneralInfoSection',
      Label : '{i18n>General_Information}',
      Target : '@UI.FieldGroup#GeneralInfo'
    }
  ],

  UI.FieldGroup #GeneralInfo : {
    $Type : 'UI.FieldGroupType',
    Data : [
      { $Type : 'UI.DataField', Label : '{i18n>Game_ID}',      Value : Game_ID },
      { $Type : 'UI.DataField', Label : '{i18n>Name}',          Value : Name },
      { $Type : 'UI.DataField', Label : '{i18n>Genre}',         Value : Genre },
      { $Type : 'UI.DataField', Label : '{i18n>Publisher}',     Value : Publisher },
      { $Type : 'UI.DataField', Label : '{i18n>Platform}',      Value : Platform },
      { $Type : 'UI.DataField', Label : '{i18n>Release_date}',  Value : Release_date },
      { $Type : 'UI.DataField', Label : '{i18n>Description}',   Value : Description }
    ]
  }
);

annotate service.Student with @(
  UI.SelectionFields : [ First_name, Last_name ],
  UI.LineItem : [
    { $Type : 'UI.DataField', Value : First_name, Label: '{i18n>First_name}' },
    { $Type : 'UI.DataField', Value : Last_name, Label: '{i18n>Last_name}' }
  ],
  UI.HeaderInfo : {
    TypeName : 'Student',
    TypeNamePlural : 'Students',
    Title : {
      $Type : 'UI.DataField',
      Value : First_name,
      Label : '{i18n>First_name}'
    },
    Description : {
      $Type : 'UI.DataField',
      Value : Last_name,
      Label : '{i18n>Last_name}'
    }
  },
  UI.Facets : [
    {
      $Type  : 'UI.ReferenceFacet',
      ID     : 'FavorieteGames',
      Label  : '{i18n>FavoriteGames}',
      Target : 'to_StudentFavoriteGamesView/@UI.LineItem'
    }
  ]
);

annotate service.StudentFavoriteGamesView with {
  Cover_url @UI.IsImageURL : true;
};

annotate service.StudentFavoriteGamesView with @(
  UI.LineItem : [
    {
      $Type : 'UI.DataField',
      Value : Cover_url,
      Label : '{i18n>Cover}'
    },
    {
      $Type : 'UI.DataFieldWithUrl',
      Label : '{i18n>Name}',
      Value : GameName,
      Url   : GameUrl
    },
    {
      $Type : 'UI.DataField',
      Value : Genre,
      Label : '{i18n>Genre}'
    },
    {
      $Type : 'UI.DataField',
      Value : Platform,
      Label : '{i18n>Platform}'
    }
  ]
);
*/
