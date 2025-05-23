using {sap.igdbfe.cap as my} from '../db/schema';

service GameService {
  @cds.redirection.target
  entity Game @readonly as projection on my.Game;
   @odata.draft.enabled
  entity Student        as projection on my.Student{
    Student_ID,
    First_name,
    Last_name,
    /* to_favos : redirected to FavoriteGame, */
    to_StudentFavoriteGamesView
  };
  entity FavoriteGame   as projection on my.FavoriteGame;
  
  entity StudentFavoriteGamesView as projection on my.StudentFavoriteGamesView{
    key Student_ID,
    key Game_ID,
    GameName,
    Genre,
    Platform,
    Cover_url,
    Description,
    GameUrl
  };
  @cds.query: true
  entity GenreList      as projection on my.GenreList;

  @cds.query: true
  entity PlatformList   as projection on my.PlatformList;




  action AddToFavorites(Game_ID: Integer);
  action RemoveFromFavorites(Game_ID: Integer);

}

