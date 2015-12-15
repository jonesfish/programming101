class Pinky extends Ghost{

	Pinky (int x, int y) {
		super(x,y,loadImage("ghost_pink.png"));
	}

	void randomSpeed()
	{
		speed = int(random(5, 8));
	}

}