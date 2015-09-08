package  {
		
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	public class Main extends MovieClip {
		
		var display:Display;
		var level:Level;
		var frm:int;
		
		public function Main() {
			
			display = new Display();
			addChild(display);
			display.x = 0;
			display.y = 0;
			
			level = new Level(display);
			
			frm = 0;
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKey);
			stage.addEventListener(Event.ENTER_FRAME, update);
		}
		
		function update(e:Event){
			frm ++;
			if (frm < 10) return;
			frm = 0;
			level.update();
		}
		
		function onKey(e:KeyboardEvent){
			if (e.keyCode == 37) level.moveLeft();
			if (e.keyCode == 39) level.moveRight();
			if (e.keyCode == 38) level.turnPiece();
			if (e.keyCode == 40) frm = 1000;
		}
	}
	
}
