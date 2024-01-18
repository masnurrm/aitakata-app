const { setGlobalOptions } = require("firebase-functions/v2");
setGlobalOptions({ maxInstances: 10 });

const { onRequest } = require("firebase-functions/v2/https");
const admin = require("firebase-admin");
const { initializeApp } = require("firebase-admin/app");
const serviceAccount = require("./service-account.json");

initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

const express = require("express");
const app = express();
const cors = require("cors");
app.use(cors({ origin: true }));

const nutritionRecommendationRouter = require("./router/NutritionRecommendationRouter");

app.get("/", (req, res) => {
  res
    .status(200)
    .send({ success: true, message: "Aitakata service running properly." });
});

app.use("/api/nutrition-recommendations", nutritionRecommendationRouter);

exports.app = onRequest(
  {
    region: "asia-southeast1",
  },
  app
);
