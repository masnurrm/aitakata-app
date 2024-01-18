const express = require("express");
const router = express.Router();
const { getFirestore } = require("firebase-admin/firestore");

const db = getFirestore();

router.get("/", async (req, res) => {
  const date = req.query.date; // date

  if (!date) {
    res
      .status(400)
      .json({ error: "Data can not be found. Missing date parameter." });
    return;
  }

  const query = db.doc(`nutrition_recommendations/${date}`);

  const doc = await query.get();

  if (!doc.exists) {
    res.status(404).json({ data: null, message: "Data not found" });
    return;
  }

  const data = doc.data();

  res.status(200).json({ data });
});

module.exports = router;
