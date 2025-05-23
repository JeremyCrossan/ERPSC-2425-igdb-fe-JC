/* using GameService as service from '../srv/game-service';

 annotate service.Game with @(
    UI.LineItem: [
        { $Type: 'UI.DataField', Value: Game_ID, Label: 'ID' },
        { $Type: 'UI.DataField', Value: Name, Label: 'Name' },
        { $Type: 'UI.DataField', Value: Genre, Label: 'Genre' },
        { $Type: 'UI.DataField', Value: Publisher, Label: 'Publisher' }
    ]
);

annotate service.Game with @(
    UI.FieldGroup #General : {
        $Type: 'UI.FieldGroupType',
        Data: [
            { $Type: 'UI.DataField', Value: Game_ID, Label: 'ID' },
            { $Type: 'UI.DataField', Value: Name, Label: 'Name' },
            { $Type: 'UI.DataField', Value: Description, Label: 'Description' }
        ]
    },
    UI.Facets: [
        {
            $Type: 'UI.ReferenceFacet',
            Label: 'General',
            Target: '@UI.FieldGroup#General'
        }
    ]
);

using from './game-ui/annotations';

annotate service.Game with @(
  UI.Identification : [
    {
      $Type : 'UI.DataFieldForAction',
      Action : 'GameService.AddToFavorites',
      Label : 'Toevoegen aan favorieten'
    },
    {
      $Type : 'UI.DataFieldForAction',
      Action : 'GameService.RemoveFromFavorites',
      Label : 'Verwijderen uit favorieten'
    }
  ]
); 
 */
 using from './game-ui/annotations';