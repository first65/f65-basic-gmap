/* @pjs preload="/img/flower.png, /img/softstar.png, /img/circles.png, /img/splat.png, /img/splat2.png";  transparent="true"; crisp="true"; */
Fobject[] fo = new Fobject[65];
PImage[] img = new PImage[5];
color C;
float d;
void setup(){
  size(10,10);
	smooth();
	fill(255);
	strokeWeight(4);
	img[0] = loadImage("/img/flower.png");
	img[1] = loadImage("/img/softstar.png");
	img[2] = loadImage("/img/circles.png");
	img[3] = loadImage("/img/splat.png");
	img[4] = loadImage("/img/splat2.png");
	for( int i = 0; i < fo.length; i++){
		fo[i] = new Fobject(img[floor(random(5))]);
	}
	noLoop();
}
void draw(){
	background(255);
}
void make(){
	if(booleans[0] == true){
		size(1024,768);
	}else{
		size(1920,1080);
	}
	if(booleans[1] == true){
		background(255,180,180);
		C = color(255);
	}else{
		background(0);
		C = color(255,255,0);
	}
	if(booleans[2] == true){
		d = 20;
	}else{
		d = 200;
	}
	for( int i = 0; i < fo.length; i++){
		fo[i].setDimensions(random(width),random(height),d,C);
	}

	for( int i = 0; i < fo.length; i++){
		fo[i].draw();
	}
	save("f65.png");
}
class Fobject{
	float d,x,y;
	PImage img;
	color C;
	Fobject(PImage _img){
		img = _img;
	}
	void setDimensions(float _x, float _y,float _d, color _C){
		x = _x;
		y = _y;
		d = _d;
		C = _C;
	}
	void draw(){
		tint(C);
		image(img,x,y,d,d);
		noTint();
	}
}