<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Bear Ninja Hunter Game</title>
    <meta name="author" content="Catherine Hawley">
   <!-- <link rel="stylesheet" href="css/style.css"> -->
     
  </head>

<body>

<h2>Play Bear, Ninja, Hunter!</h2>

<p>Play against the computer</p>

<ul>
  <li>The Bear Beats the Hunter.</li>
  <li>The Hunter Beats the Ninja.</li>
  <li>And the Ninja Beats the Bear.</li>
</ul>

<p>Click a button to select your choice.</p>

<hr>

<div class="choices">
  <button id="BearBtn">Bear</button>
  <button id="NinjaBtn">Ninja</button>
  <button id="HunterBtn">Hunter</button>
</div>

<hr>

<div id="result" class="result">
<!-- display game result -->
</div>

<div id="winCounter" class="win-counter" style="display:none;">

</div>

<!-- Play Again button -->
<button id="playAgainBtn" style="display:none; margin-top:20px;">Play Again</button>

 <!-- <script src="js/script.js"></script> -->

</body>
</html>




