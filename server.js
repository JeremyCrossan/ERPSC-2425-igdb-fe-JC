const cds = require('@sap/cds')

cds.on('bootstrap', app => {
  // CORS headers toestaan
  app.use((req, res, next) => {
    res.setHeader("Access-Control-Allow-Origin", "*")
    res.setHeader("Access-Control-Allow-Methods", "*")
    res.setHeader("Access-Control-Allow-Headers", "*")
    next()
  })

 // Forceer OData-Version header
  app.use((req, res, next) => {
     if (req.method === 'POST' && req.url.includes('$batch')) {
       res.setHeader('OData-Version', '4.0')
        }
        next()
    })
})

module.exports = cds.server
