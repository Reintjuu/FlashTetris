package  {
	
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	
	public class Display extends MovieClip {
		
		var levelWidth = 12;
		var levelHeight = 16;
		var grid:Array;
		var data:Array;

		public function Display() {
			
			setupLevel();
		}
	
		function setupLevel(){
			grid = new Array();
			data = new Array();
			for (var j=0; j<levelHeight; j++){
				grid[j] = new Array();
				data[j] = new Array();
				for (var i=0; i<levelWidth; i++){
					var block:Block = new Block();
					addChild(block);
					block.x = 20 * i + 20;
					block.y = 20 * j + 20;
					grid[j][i] = block;
					data[j][i] = 0;
				}
			}
			update();
		}
		
		function update(){
			for (var j=0; j<levelHeight; j++)
			for (var i=0; i<levelWidth; i++){
				var r = data[j][i] * 0.5 + 0.5;
				var g = r;
				var b = r;
				grid[j][i].transform.colorTransform = new ColorTransform(r,g,b,1,0,0,0,0);
			}
		}
		
		function setGrid(x, y, value){
			if (x < 0) return;
			if (y < 0) return;
			if (x >= levelWidth) return;
			if (y >= levelHeight) return;
			data[y][x] = value;
			update();
		}
		
		function getGrid(x, y){
			if (x < 0) return 1;
			if (y < 0) return 0;
			if (x >= levelWidth) return 1;
			if (y >= levelHeight) return 1;
			return data[y][x];
		}
	}
	
}