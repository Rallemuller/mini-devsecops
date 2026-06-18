const express = require('express');
const app = express();

app.use(express.json());

// RETTET: Brugerinput valideres med whitelist før det bruges
app.get('/search', (req, res) => {
  const brugerInput = req.query.q;

  // Tillad kun bogstaver, tal og mellemrum
  if (!brugerInput || !/^[a-zA-Z0-9 ]+$/.test(brugerInput)) {
    return res.status(400).send('Ugyldigt søgeord');
  }

  res.send('Søgning gennemført for: ' + brugerInput);
});

app.listen(3000, () => console.log('App kører på port 3000'));