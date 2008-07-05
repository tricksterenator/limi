
public class Computer {
	Memory _memory;
   
	public Computer(Memory memory) {
		_memory = memory;  
	}
	public String getMemoryType(){
		return _memory.getMemoryType();
	}	
}
