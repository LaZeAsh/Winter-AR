# Winter-AR

## 💡 Inspiration💡

All of our team members are currently located in places where it does not snow, and they will not have the opportunity to experience the Christmas Wonderland that the people who live in places where it snows get to experience. As a way to give them a similar experience from the comfort of their own home, we used Augmented Reality to give them a true experience of a Christmas Wonderland.

## ⚙️ What it does ⚙️

Users get to feel immersed in a really cool Christmas experience by listening to Christmas music while exploring an immersive 3D view of Christmas trees, snow, and presents. Users can also take a snapshot of themselves in the snow, and share it with the world! They can then see other people’s photos in the photo gallery and get to have a celebratory Christmas together when they usually can’t. 

## 🏗️ How we built it 🏗️

We used Swift to build the mobile app side of things, including the AR experience, taking a snapshot, and the music. This is done using RealityKit and AVFoundation in Swift. We then connected the snapshots to a firebase storage, which is then accessible by a React app that displays all the images in a gallery. We deployed the website with Netlify and used Domain.com and displayed this website in the mobile app as a web view using Swift’s web view. This way, users can alternatively access the React website anywhere and not just in the app. 

Our Domain name is http://argallery.tech. 

## 🚩 Challenges we ran into

2 of the 3 teammates were new to Swift and RealityKit, because of this development went slower than expected and we could not incorporate as many features as we wanted. We also had troubles uploading our images to our database so they could be used for our gallery website. The model we used with RealityKit did not work 100% initially so we had to modify the models for them to fit our needs. We also tried and to use Mongo Realm at first, but we decided to use Firebase instead after failing to upload images correctly from Swift. One of the team members is also new to hackathons and it was difficult to understand the idea of hackathons. 

## 🥇 Accomplishments that we're proud of

We are proud of the final product we have made, not only have we made an experience that is smooth and usable we also added features such as a beautiful UI that allows you to access our website gallery and the AR experience, we allow users to take pictures, and explore pictures from the community. One of our teammates is new to hackathons and there were only 3 members in our team so it was a great learning experience for him and he is very happy to have come up with a great app in the end. He worked on the React app and learned about Firebase. 

## 📚 What we learned

We learned how to make a basic frontend UI using SwiftUI. We also learned about how to integrate data in Swift to React using Firebase. We also learned a little about Mongo Realm. 

## ⏳What's next for Winter-AR
We would like to publish this app to the App Store!

