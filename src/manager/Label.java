package manager;

public class Label {

	int key;  
    String value;
    
    public Label(int key,String value){
    	this.key=key;  
        this.value=value; 
    }

	public int getKey() {
		return key;
	}

	public void setKey(int key) {
		this.key = key;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
}
