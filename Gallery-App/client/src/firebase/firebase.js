import {initializeApp} from "firebase/app";
import {getStorage} from "firebase/storage";

const firebaseConfig = {
    apiKey: "AIzaSyB7HBI5sHqB1lBlUhNNdfBu43wQvbDnilA",
    authDomain: "arhackyimages.firebaseapp.com",
    projectId: "arhackyimages",
    storageBucket: "arhackyimages.appspot.com",
    messagingSenderId: "961475424611",
    appId: "1:961475424611:web:808f9e09116b7afcc3a356"
};

// initializing Firebase
const app = initializeApp(firebaseConfig);
export const storage = getStorage(app);