const express = require('express');
const app = express();

// FEJL: En hårdkodet API-nøgle (Secret)
const AWS_SECRET_KEY = "AKIAIMXFFAEZEXAMPLEKEY"; 

app.get('/', (req, res) => {
  res.send('Velkommen til min DevSecOps app!');
});

app.listen(3000, () => console.log('App kører på port 3000'));