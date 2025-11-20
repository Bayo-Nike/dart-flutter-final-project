  // Import the functions you need from the SDKs you need
  import { initializeApp } from "https://www.gstatic.com/firebasejs/12.6.0/firebase-app.js";
  import { getAnalytics } from "https://www.gstatic.com/firebasejs/12.6.0/firebase-analytics.js";
  // TODO: Add SDKs for Firebase products that you want to use
  // https://firebase.google.com/docs/web/setup#available-libraries

  // Your web app's Firebase configuration
  // For Firebase JS SDK v7.20.0 and later, measurementId is optional
  const firebaseConfig = {
    apiKey: "AIzaSyBtOzQt_4YJQOksIpVYFWrF3GTiB1e8uA0",
    authDomain: "attendance-app-project-92f92.firebaseapp.com",
    projectId: "attendance-app-project-92f92",
    storageBucket: "attendance-app-project-92f92.firebasestorage.app",
    messagingSenderId: "1097056844428",
    appId: "1:1097056844428:web:528094cdacb1a5705919a9",
    measurementId: "G-99000S7T6Q"
  };

  // Initialize Firebase
  const app = initializeApp(firebaseConfig);
  const analytics = getAnalytics(app);
  // console.log(app);
  // console.log(analytics);
