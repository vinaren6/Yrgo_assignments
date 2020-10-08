public class Cell  {
	PVector position = new PVector();
	boolean alive;
	boolean turn;
	int size;
	public Cell (int x, int y, int s) {
		position.set(x * s, y * s);
		size = s;
		
	}

}