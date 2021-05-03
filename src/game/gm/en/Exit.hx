package gm.en;

class Exit extends Entity {
	var data : Entity_Exit;
	public function new(d:Entity_Exit) {
		super(0,0);

		data = d;

		setPosPixel(data.pixelX, data.pixelY);
		pivotX = data.pivotX;
		pivotY = data.pivotY;
		wid = data.width;
		hei = data.height;

		gravityMul = 0;
		collides = false;
		spr.set( dict.arrow );
		spr.setCenterRatio(1, 0.5);
	}

	override function dispose() {
		super.dispose();
	}

	override function postUpdate() {
		super.postUpdate();
		var ang = switch data.f_ExitDir {
			case North: -M.PIHALF;
			case East: 0;
			case West: M.PI;
			case South: M.PIHALF;
		}
		spr.rotation = ang;
		spr.x = centerX - Math.cos(ang) * ( 6 + M.fabs(Math.cos(ftime*0.1)*4) );
		spr.y = centerY - Math.sin(ang) * ( 6 + M.fabs(Math.cos(ftime*0.1)*4) );
	}


	override function fixedUpdate() {
		super.fixedUpdate();

		if( inBounds(hero.centerX, hero.centerY, 2) ) {
			game.nextLevel();
			destroy();
		}
	}
}