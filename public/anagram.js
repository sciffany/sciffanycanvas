var c = document.getElementById("canvas");
var ctx = canvas.getContext("2d");
ctx.font = "30px Arial";



height = 500, width = 1000;
var my_gradient=ctx.createLinearGradient(0,0,0,height);
my_gradient.addColorStop(0.7,"black");
my_gradient.addColorStop(1,"black");

ctx.fillStyle=my_gradient;
ctx.fillRect(0,0,height*2,width*2);

var word = selection[0];



var letters = shuffled[0];

//ctx.canvas.width  = window.innerWidth;
//ctx.canvas.height = window.innerHeight;

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




for (var i =0; i<letters.length; i++){
    ctx.beginPath();
    ctx.fillStyle="white";
    ctx.arc(i*100+60,90,35,0,6.28, false);
    ctx.fill();
    ctx.fillStyle="black";
    ctx.fillText(letters[i],i*100+50,100);


}

var pos = 10;

c.addEventListener("keydown",check);

function check(e) {

    var character = String.fromCharCode(e.keyCode);
    
    var index = letters.indexOf(character.toUpperCase());
    if (index != -1) {
        letters[index] = " ";
        mySound.play();
        ctx.fillStyle="white";
    
        ctx.fillText(character,pos+=50,300);
    }

	

}


function redraw(){
    



}