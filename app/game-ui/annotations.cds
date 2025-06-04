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
      Value : '{i18n>Bekijk afbeelding}',
      Url   : Cover_url
      }
    ]
  },

  // ===== Detailpagina met "General Information" sectie =====
  UI.Facets : [
    {
      $Type : 'UI.ReferenceFacet',
      ID : 'GeneralInfoSection',
      Label : '{i18n>General Information}',
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
