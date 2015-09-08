package  {
	
	public class Piece {

		var shape:Array;
		var x, y;
		var display:Display;
		
		public function Piece(display:Display) {
			
			x = 0;
			y = 0;
			
			this.display = display;
			
			var shapeSelect = Math.floor(Math.random() * 2);
			
			if (shapeSelect == 0) {
				shape = [[0, 0, 0],
						 [1, 1, 1],
						 [0, 1, 0]];
				y = -1;
				x = Math.floor(Math.random() * (display.levelWidth - 3));
			} else {
				shape = [[0, 0, 0, 0],
						 [1, 1, 1, 1],
						 [0, 0, 0, 0],
						 [0, 0, 0, 0]];
				y = -1;
				x = Math.floor(Math.random() * (display.levelWidth - 4));
			}
					 
			place();
		}

		function place(){
			for(var j=0; j<shape.length; j++)
			for(var i=0; i<shape[0].length; i++){
				if (shape[j][i] == 1)
					display.setGrid(x + i, y + j, shape[j][i]);
			}
		}
		
		function remove() {
			for (var j=0; j<shape.length; j++)
			for (var i=0; i<shape[0].length; i++){
				if (shape[j][i] == 1)
					display.setGrid(x + i, y + j, 0);
			}
		}
		
		function collide(x, y) {
			for (var j=0; j<shape.length; j++)
			for (var i=0; i<shape[0].length; i++){
				if (shape[j][i] == 1)
					if (display.getGrid(x + i, y + j) == 1) return true;
			}
			return false;
		}
		
		function setPosition(px, py) {
			remove ();
			if (collide(px, py)) { place(); return false; }
			x = px;
			y = py;
			place();
			return true;
		}
		
		function turn() {
			remove();
			var oldShape:Array = shape;
			var newShape:Array = new Array();
			for (var i=0; i<shape[0].length; i++) {
				newShape[i] = new Array;
			}
			for (var j=0; j<shape.length; j++){
				for (i=0; i<shape[0].length; i++){
					newShape[i][j] = shape[shape.length-j-1][i];
				}
			}
			shape = newShape;
			var success = true;
			if (collide(x, y)) { shape = oldShape; success = false; }
			place();
			return success;
		}
	}
	
}
