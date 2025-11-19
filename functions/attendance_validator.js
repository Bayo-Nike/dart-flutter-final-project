const functions = require("firebase-functions");
const admin = require("firebase-admin");

module.exports = functions.https.onCall(async (data, context) => {
  const { studentId, sessionId, method, token } = data;

  const sessionDoc = await admin.firestore()
      .collection("attendance_sessions")
      .doc(sessionId)
      .get();

  if (!sessionDoc.exists) throw new functions.https.HttpsError("not-found", "Session not found");

  const session = sessionDoc.data();

  // QR VALIDATION
  if (method === "qr") {
    if (token !== session.qrToken) {
      throw new functions.https.HttpsError("permission-denied", "Invalid QR");
    }
  }

  // Save record
  await admin.firestore()
      .collection("attendance_records")
      .doc(sessionId)
      .collection("students")
      .doc(studentId)
      .set({
        studentId,
        method,
        timestamp: admin.firestore.FieldValue.serverTimestamp()
      });

  return { success: true };
});