using GameService from './game-service';

annotate GameService.Student with {
  First_name @Common.Label: 'Voornaam';
  Last_name  @Common.Label: 'Achternaam';
};

// Voor internationalisering i18n => WERKT NIET
/* using GameService from './game-service';

annotate GameService.Student with {
  First_name @Common.Label: '{i18n>First_name}';
  Last_name  @Common.Label: '{i18n>Last_name}';
};

annotate GameService.Game with {
  Name        @Common.Label: '{i18n>Name}';
  Genre       @Common.Label: '{i18n>Genre}';
  Platform    @Common.Label: '{i18n>Platform}';
  Cover_url   @Common.Label: '{i18n>Cover_url}';
  Description @Common.Label: '{i18n>Description}';
};
 */

