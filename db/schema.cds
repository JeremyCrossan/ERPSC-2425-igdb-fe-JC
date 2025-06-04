namespace sap.igdbfe.cap;

entity Game {
  key Game_ID      : Integer;
      Name         : String(100);
      Genre        : String(50);
      Publisher    : String(50);
      Platform     : String(50);
      Release_date : Date;
      Cover_url    : String(100);
      Description  : LargeString;
}

entity Student @odata.draft.enabled {
  key Student_ID : UUID;
      First_name : String(100);
      Last_name  : String(100);
      to_favos   : Composition of many FavoriteGame
                     on to_favos.Student_ID = $self.Student_ID;
      to_StudentFavoriteGamesView : Association to many StudentFavoriteGamesView
                     on to_StudentFavoriteGamesView.Student_ID = $self.Student_ID;

}

entity FavoriteGame {
  key Game_ID    : Integer;
  key Student_ID : UUID;
      to_game    : Association to Game
                     on to_game.Game_ID = $self.Game_ID;
}

entity GenreList as select from Game {
  key Genre: String
} group by Genre;

entity PlatformList as select from Game {
  key Platform: String
} group by Platform;

entity StudentFavoriteGamesView as select from FavoriteGame as f
  join Game as g on g.Game_ID = f.Game_ID {
    key f.Student_ID,
    key f.Game_ID,
    g.Name as GameName,
    g.Genre,
    g.Platform,
    g.Cover_url,
    g.Description,
    '#/Game(Game_ID=' || cast(f.Game_ID as String) || ')' as GameUrl : String
}


