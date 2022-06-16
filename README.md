# Tarif Defterim - iOS App (Swift & Firebase)
Tarif Defterim is a social media app to post your food recipes.

## How to use
1-Download or clone the project<br>
2-Install pods (If you don't know how to, google it. freaking easy)<br>
2-Add your GoogleService-Info.plist to TarifDefterim->TarifDefterim->Resources folder.<br>
3-Go to Firabase console and on the Storage section you need to change rules with:<br>
<code>
  service firebase.storage {
  match /b/{bucket}/o {
    match /{allPaths=**} {
      allow read, write: if request.auth != null;
    }
  }
}
</code>

## Firebase
-Authentication<br>
-Firestore Database<br>
-Storage

### Screen Shots
<p align="center">
  <img alt="Light" src="https://github.com/muratbuyukbas/BitirmeProjesi-iOS-App/blob/main/Screen%20Shots/login.png?raw=true" width="40%">
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="Dark" src="https://github.com/muratbuyukbas/BitirmeProjesi-iOS-App/blob/main/Screen%20Shots/signup.png?raw=true" width="40%">
</p>
<p align="center">
  <img alt="Light" src="https://github.com/muratbuyukbas/BitirmeProjesi-iOS-App/blob/main/Screen%20Shots/profile.png?raw=true" width="40%">
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="Dark" src="https://github.com/muratbuyukbas/BitirmeProjesi-iOS-App/blob/main/Screen%20Shots/explore.png?raw=true" width="40%">
</p>
<p align="center">
  <img alt="Light" src="https://github.com/muratbuyukbas/BitirmeProjesi-iOS-App/blob/main/Screen%20Shots/settings.png?raw=true" width="40%">
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="Dark" src="https://github.com/muratbuyukbas/BitirmeProjesi-iOS-App/blob/main/Screen%20Shots/notifications.png?raw=true" width="40%">
</p>
<p align="center">
  <img alt="Light" src="https://github.com/muratbuyukbas/BitirmeProjesi-iOS-App/blob/main/Screen%20Shots/recipe.png?raw=true" width="40%">
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="Dark" src="https://github.com/muratbuyukbas/BitirmeProjesi-iOS-App/blob/main/Screen%20Shots/followers.png?raw=true" width="40%">
</p>
<p align="center">
  <img alt="Light" src="https://github.com/muratbuyukbas/BitirmeProjesi-iOS-App/blob/main/Screen%20Shots/addrecipe.png?raw=true" width="40%">
&nbsp; &nbsp; &nbsp; &nbsp;
  <img alt="Dark" src="https://github.com/muratbuyukbas/BitirmeProjesi-iOS-App/blob/main/Screen%20Shots/lastrecipes.png?raw=true" width="40%">
</p>
