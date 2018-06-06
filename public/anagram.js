var c = document.getElementById("canvas");
var ctx = canvas.getContext("2d");
var pad=40;
var width = window.innerWidth - pad*2;
var height = window.innerHeight - pad*2
c.height = height;
c.width = width;

c.addEventListener("keydown",check);
window.addEventListener("resize",resizeCanvas, false);

var level = 0;
var word = selection[level];
var letters = shuffled[level];
var guess = [];

redraw();

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


function resizeCanvas(e){
    width = window.innerWidth - pad*2;
    height = window.innerHeight - pad*2;
    c.height = height;
    c.width = width;

    redraw();

}

function redraw(){

    var my_gradient=ctx.createLinearGradient(0,0,0,height);
    my_gradient.addColorStop(0.7,"black");
    my_gradient.addColorStop(1,"black");
    ctx.fillStyle=my_gradient;
    ctx.fillRect(0,0,width,height);


    var nLetters = letters.length;
    var pos = 10;

    var percentCanvas = 0.4  
    if (c.width < 1000){
     percentCanvas = 0.6
    }
    var stride = width/nLetters*percentCanvas;
    var radius = stride/2*0.9;
    var fontsize = stride*0.5;
    for (var i =0; i<nLetters; i++){
        ctx.font = fontsize+"px Arial";
        var position = stride*i+stride/2+(1-percentCanvas)*width/2
        ctx.beginPath();
        ctx.fillStyle="white";
        ctx.arc(position,radius*3,radius,0,6.28, false);
        ctx.fill();
        ctx.fillStyle="black";
        ctx.fillText(letters[i],position-radius/3,radius*3.5);
    }

    for (var i=0; i<guess.length; i++){
        ctx.font = fontsize+"px Arial";
        var position = stride*i+stride/2+(1-percentCanvas)*width/2
        ctx.fillStyle="white";
        ctx.fillText(guess[i],position-radius/4,radius*6);
    }



}

function check(e) {
    if (e.keyCode == 8){
        var index = letters.indexOf(" ");
        letters[index] = guess.pop();
        redraw();
    } else {
        var character = String.fromCharCode(e.keyCode);
        var index = letters.indexOf(character.toUpperCase());
        if (index != -1) {
            letters[index] = " ";
            guess.push(character);
            redraw();
            if (guess.length == letters.length && guess.join("")===word.toUpperCase()){ //check for win
                level++;
                word = selection[level];
                letters = shuffled[level];
                guess = [];
                redraw();
            }
        }
    }
    
}

