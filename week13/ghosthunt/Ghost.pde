class Ghost{
	int x,y;
	PImage img;
	Eye leftEye;
	Eye rightEye;
	int timeForChangeDirection;

	int direction;
	int speed;

	boolean isDead;

	Ghost (int x, int y)
	{
		this.x = x;
		this.y = y;
		this.img = loadImage("ghost.png");
		this.initEyes();
		timeForChangeDirection = millis();
		direction = int(random(0, 4));
		speed = 5;
		isDead = false;
	}

	Ghost (int x, int y, PImage img)
	{
		this(x,y);
		this.img = img;
	}

	void initEyes()
	{
		this.leftEye = new Eye(this.x, this.y,5, 0);
		this.rightEye = new Eye(this.x, this.y,5, 1);
	}

	void draw()
	{
		if (!isDead) {
			image(img, x, y);
			leftEye.draw(this.x, this.y);
			rightEye.draw(this.x, this.y);
			if (millis() - timeForChangeDirection > 300) {
				timeForChangeDirection = millis();
				changeMoveDirection();	
			}	
		}
	}

	boolean isHitByMouse()
	{
		if (mousePressed && mouseX > x && mouseX < x + img.width && mouseY > y && mouseY < y + img.height) {
			return true;
		}
		else {
			return false;
		}
		
	}

	void changeMoveDirection()
	{
		direction = int(random(0, 4));
	}

	void dead()
	{
		isDead = true;
	}

	void move()
	{
		switch (direction) {
			//up
			case 0:
				y-=speed;
				if (y<0) {
					y=0;
					changeMoveDirection();
				}
				break;
			//down
			case 1:
				y+=speed;
				if (y>height - img.height) {
					y=height - img.height;
					changeMoveDirection();
				}
				break;
			//left
			case 2:
				x-=speed;
				if (x<0) {
					x=0;
					changeMoveDirection();
				}
				break;
			//right
			case 3:
				x+=speed;
				if (x>width - img.width) {
					x = width - img.width;
					changeMoveDirection();
				}
				break;
		}
	}
}