
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
