const functions = require("firebase-functions");
const admin = require("firebase-admin");
const crypto = require("crypto");

module.exports = functions.pubsub.schedule("every 10 seconds").onRun(async () => {
  const sessionsSnap = await admin.firestore()
      .collection("attendance_sessions")
      .where("qrEnabled", "==", true)
      .get();

  sessionsSnap.forEach(doc => {
    const sessionId = doc.id;
    const randomToken = crypto.randomBytes(16).toString("hex");

    admin.firestore()
      .collection("attendance_sessions")
      .doc(sessionId)
      .update({
        qrToken: randomToken,
        updatedAt: admin.firestore.FieldValue.serverTimestamp()
      });
  });

  return null;
});
