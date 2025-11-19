const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp();

exports.generateQRCode = require("./qr_generator");
exports.validateAttendance = require("./attendance_validator");
