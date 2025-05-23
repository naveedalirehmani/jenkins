// src/index.ts
import express from 'express';

const app = express();
const PORT = process.env.PORT || 3000;

app.get('/hello', (req, res) => {
  res.json({ message: 'Hello World 2' });
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
