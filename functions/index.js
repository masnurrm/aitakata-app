/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const {setGlobalOptions} = require("firebase-functions/v2");
setGlobalOptions({maxInstances: 10});

const {onRequest} = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

// exports.helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

const admin = require("firebase-admin")
const { initializeApp } = require("firebase-admin/app");
const { getFirestore } = require("firebase-admin/firestore");
const serviceAccount = require("./service-account.json");

initializeApp({
    credential: admin.credential.cert(serviceAccount)
})

const express = require("express");
const app = express();
const cors = require('cors')
app.use(cors({origin: true}))

app.get("/", (req, res) => {
  res.status(200).send("Root route");
});

app.get("/test", (req, res) => {
  res.status(200).send("Test success");
});

app.get("/get-data", async (req, res) => {
  const querySnapshot = await getFirestore().collection("logs").get();
  const data = querySnapshot.docs.map((doc) => doc.data());
  res.status(200).json(data);
});

app.get("/create", async (req, res) => {
  const writeResult = await getFirestore()
    .collection("logs")
    .add({
      customId: 1,
      status: true,
      data: {
        name: "testing 1",
      },
    });

  res.status(201).json({ result: `Message with ID: ${writeResult.id} added.` });
});

exports.app = onRequest(
  {
    region: "asia-southeast1",
  },
  app
);
