class Eye{

	//center of the eye
	int x,y;
	int radius;
	int type;

	// center of eye -> x, y
	// radius of circle -> radius
	// type -> 0 = left eye, 1= right eye
	Eye (int x, int y, int radius, int type) {
		this.x= x;
		this.y= y;
		this.offsetAdjust();
		this.radius = radius;
		this.type = type;
	}

	void draw(int x, int y)
	{
		this.x = x;
		this.y = y;
		offsetAdjust();

		float angle = atan2(mouseY-y,mouseX-x);
		int eye_x = int(this.x + cos(angle) * radius);
		int eye_y = int(this.y + sin(angle) * radius);
		fill(0);
		ellipse(eye_x, eye_y, 10, 10);
	}

	void offsetAdjust()
	{
		if (type == 0) {
			x+= 20;
			y+= 34;
		}
		else {
			x+= 44;
			y+= 34;
		}
	}

}