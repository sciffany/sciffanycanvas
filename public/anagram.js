//https://stackoverflow.com/questions/2190801/passing-parameters-to-javascript-files



var c = document.getElementById("canvas");
var ctx = canvas.getContext("2d");
ctx.font = "30px Arial";

word = words[1];
//https://www.w3schools.com/graphics/game_sound.asp
function sound(src) {
    this.sound = document.createElement("audio");
    this.sound.src = src;
    this.sound.setAttribute("preload", "auto");
    this.sound.setAttribute("controls", "none");
    this.sound.style.display = "none";
    document.body.appendChild(this.sound);
    this.play = function(){
        this.sound.play();
    }
    this.stop = function(){
        this.sound.pause();
    }
}

mySound = new sound("type.mp3");




ctx.fillText(word,10,50);

var pos = 10;

c.addEventListener("keydown",check);

function check(e) {
	mySound.play();
    ctx.fillText(String.fromCharCode(e.keyCode),pos+=10,200);

}
