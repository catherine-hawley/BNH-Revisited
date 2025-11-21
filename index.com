<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Bear Ninja Hunter Game</title>
    <meta name="author" content="Catherine Hawley">
   <link rel="stylesheet" type="text/css" href="style.css">
        
  </head>

<body>
	<!-- display game rules -->
<h2 style ="margin-bottom: 1em;">Play Bear, Ninja, Hunter!</h2>

<p style="margin-bottom: 2em;">Play against the computer<p>

<ul style="margin-bottom: 2em;">
  <li>The Bear Beats the Hunter.</li>
  <li>The Hunter Beats the Ninja.</li>
  <li>And the Ninja Beats the Bear.</li>
</ul>

<p style="margin-bottom: 1em;">Click a button to select your choice.</p>

<hr>
<div class = "choices">	
<button id="BearBtn">Bear</button>
<button id="NinjaBtn">Ninja</button>
<button id="HunterBtn">Hunter</button>
</div>
<hr>
<div id = "result">
	<!-- result will be displayed here -->
</div>
<script>

const BearBtn = document.getElementById("BearBtn");
const NinjaBtn = document.getElementById("NinjaBtn");
const HunterBtn = document.getElementById("HunterBtn");
const resultDisplay = document.getElementById("result")	

BearBtn.addEventListener("click", ()=>{
	playRound("Bear")
});
NinjaBtn.addEventListener("click", ()=>{
	playRound("Ninja")
});	
HunterBtn.addEventListener("click", () =>{
	playRound("Hunter")
});	

//Process player choice and randomly generate computer choice
function playRound (playerChoice) {
	const choices = ["Bear", "Ninja", "Hunter"];
	const computerChoice = choices[Math.floor (Math.random () * choices.length)];
    const outcome = getWinner(playerChoice,computerChoice);
    resultDisplay.innerHTML = `
        <p>You chose: <strong>${playerChoice}</strong></p>
        <p>Computer chose: <strong>${computerChoice}</strong></p>
	<h3 style="margin-bottom: 0em;">${outcome}</h3>
    `;
}
function getWinner(player, computer) {
    if (player === computer) return "It's a tie!";

    const playerWins =
        (player === "Bear" && computer === "Hunter") ||
        (player === "Hunter" && computer === "Ninja") ||
        (player === "Ninja" && computer === "Bear");

    return playerWins ? "You win!" : "The computer wins!"
}





// 	(
// ){
// 	resultDisplay.textContent = "You win!";
// 	}

// 	else if (
// 	(player === "Bear" && computer === "Hunter") ||
// 	(player === "Ninja" && computer === "Bear") ||
// 	(player === "Hunter" && computer === "Ninja")
// ){
// 	resultDisplay.textContent = "The computer wins!"
//    }
// 	else {
// 		resultDisplay.textContent = "It's a tie!"
// 	}
// }
	 
  
//   function compareChoices(playerChoice) {
//     const computerChoice = getComputerChoice();
//     const result = getWinner(playerChoice, computerChoice);
//     alert(`You chose ${playerChoice}, computer chose ${computerChoice}. ${result}`);
//   }
   

   

  
</script>
</body>
</html>
