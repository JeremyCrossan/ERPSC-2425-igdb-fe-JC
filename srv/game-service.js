module.exports = srv => {
    const db = cds.transaction(srv);
  
    srv.on('AddToFavorites', async req => {
      const gameId = req.data.Game_ID;
      const studentId = 'ERPSCJC';
      await db.run(INSERT.into('FavoriteGame').entries({ Game_ID: gameId, Student_ID: studentId }));
    });
  
    srv.on('RemoveFromFavorites', async req => {
      const gameId = req.data.Game_ID;
      const studentId = 'ERPSCJC';
      await db.run(DELETE.from('FavoriteGame').where({ Game_ID: gameId, Student_ID: studentId }));
    });
  };
  