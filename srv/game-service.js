module.exports = srv => {
    const db = cds.transaction(srv);

    srv.before(['UPDATE', 'DELETE'], 'FavoriteGame', async req => {
      const studentId = 'abe700f6-089b-4a9f-bc37-c57175c425cf';
      if (req.data.Student_ID && req.data.Student_ID !== studentId) {
        req.reject(403, req.text('error.notAllowed'));
      }
    });
    
    srv.before('CREATE', 'FavoriteGame', async req => {
      const studentId = 'abe700f6-089b-4a9f-bc37-c57175c425cf';
      if (req.data.Student_ID && req.data.Student_ID !== studentId) {
        req.reject(403, req.text('error.notAllowed'));
      }
    });
  
    srv.on('AddToFavorites', async req => {
      const gameId = req.data.Game_ID;
      const studentId = 'abe700f6-089b-4a9f-bc37-c57175c425cf';
      await db.run(INSERT.into('FavoriteGame').entries({ Game_ID: gameId, Student_ID: studentId }));
    });
  
    srv.on('RemoveFromFavorites', async req => {
      const gameId = req.data.Game_ID;
      const studentId = 'abe700f6-089b-4a9f-bc37-c57175c425cf';
      await db.run(DELETE.from('FavoriteGame').where({ Game_ID: gameId, Student_ID: studentId }));
    });
  };
  