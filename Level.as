package  {
	import flash.events.Event;
	
	public class Level {

		var display:Display;
		var piece:Piece
		
		public function Level(display:Display) {
			this.display = display;
			
			piece = new Piece(display);
		}

		function update() {
			if (!piece.setPosition(piece.x, piece.y + 1)) {
				checkRows();
				piece = new Piece(display);
			}
		}
		
		function moveLeft() {
			if (!piece.setPosition(piece.x -1, piece.y)) checkRows();
		}
		
		function moveRight(){
			if (!piece.setPosition(piece.x +1, piece.y)) checkRows();
		}
		
		function turnPiece(){
			if (!piece.turn()) checkRows();
		}
		
		function checkRows(){
			for (var j=0; j<display.levelHeight; j++) {
				var isFull = true;
				for (var i=0; i<display.levelWidth; i++){
					if (display.getGrid(i, j) == 0) isFull = false;
				}
				if (isFull){
					for ( i=0; i<display.levelWidth; i++) {
						for (var w=j; w>=0; w--){
							display.setGrid(i, w, display.getGrid(i, w-1));
						}
					}
				}
			}
		}
		
		
	}
	
}
