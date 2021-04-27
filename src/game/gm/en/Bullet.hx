package gm.en;

class Bullet extends Entity {
	public function new(xx:Float, yy:Float) {
		super(0,0);
		setPosPixel(xx,yy);
		gravityMul = 0;
		wid = hei = 4;
		frict = 1;
		collides = false;
	}

	public function delayS(t:Float) {
		cd.setS("delayed",t);
	}

	public inline function isDelayed() return cd.has("delayed");

	function onHitCollision() {}


	function checkCollision() {
		if( !destroyed && ( level.hasWallCollision(cx,cy) || level.hasOneWay(cx,cy) && dyTotal>0 ) ) {
			onHitCollision();
			destroy();
		}
	}

	override function postUpdate() {
		entityVisible = !isDelayed();
		super.postUpdate();
	}

	override function onPreStepX() {
		super.onPreStepX();
		checkCollision();
	}

	override function onPreStepY() {
		super.onPreStepY();
		checkCollision();
	}

	override function fixedUpdate() {
		if( !isDelayed() )
			super.fixedUpdate();
	}
}