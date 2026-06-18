const express = require('express');
const app = express();

app.use(express.json());

// FEJL: Brugerinput bliver sat direkte ind i en kommando uden validering
app.get('/search', (req, res) => {
  const brugerInput = req.query.q;
  const { execSync } = require('child_process');
  const resultat = execSync('grep -r ' + brugerInput + ' /data');
  res.send(resultat.toString());
});

app.listen(3000, () => console.log('App kører på port 3000'));