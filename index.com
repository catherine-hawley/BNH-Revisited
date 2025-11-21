<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Bear Ninja Hunter Game</title>
    <meta name="author" content="Catherine Hawley">
   <link rel="stylesheet" href="css/style.css">

        
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

<div id="result" class="result"></div>

<div id="winCounter" class="win-counter" style="display:none;"></div>

<!-- Play Again button -->
<button id="playAgainBtn" style="display:none; margin-top:20px;">Play Again</button>


<script>
// Track wins
let playerWins = 0;
let computerWins = 0;

// Elements
const resultDisplay = document.getElementById("result");
const winCounterDisplay = document.getElementById("winCounter");
const playAgainBtn = document.getElementById("playAgainBtn");

// Buttons
document.getElementById("BearBtn").addEventListener("click", () => playRound("Bear"));
document.getElementById("NinjaBtn").addEventListener("click", () => playRound("Ninja"));
document.getElementById("HunterBtn").addEventListener("click", () => playRound("Hunter"));

// Game logic
function playRound(playerChoice) {
  const choices = ["Bear", "Ninja", "Hunter"];
  const computerChoice = choices[Math.floor(Math.random() * choices.length)];
  const outcome = getWinner(playerChoice, computerChoice);

  // Update win counters
  if (outcome === "You win!") playerWins++;
  if (outcome === "The computer wins!") computerWins++;

  // Display results
  resultDisplay.innerHTML = `
    <p>You chose: <strong>${playerChoice}</strong></p>
    <p>Computer chose: <strong>${computerChoice}</strong></p>
    <h3>${outcome}</h3>
  `;

  // Display win counters
  winCounterDisplay.style.display = "block";
  winCounterDisplay.innerHTML = `
    <p><strong>Player Wins:</strong> ${playerWins}</p>
    <p><strong>Computer Wins:</strong> ${computerWins}</p>
  `;

  // Show Play Again button
  playAgainBtn.style.display = "inline-block";
}

// Determine winner
function getWinner(player, computer) {
  if (player === computer) return "It's a tie!";

  const playerWins =
    (player === "Bear" && computer === "Hunter") ||
    (player === "Hunter" && computer === "Ninja") ||
    (player === "Ninja" && computer === "Bear");

  return playerWins ? "You win!" : "The computer wins!";
}

// Reset game session
playAgainBtn.addEventListener("click", () => {
  playerWins = 0;
  computerWins = 0;
  resultDisplay.innerHTML = "";
  winCounterDisplay.style.display = "none";
  playAgainBtn.style.display = "none";
});

</script>
</body>
</html>




