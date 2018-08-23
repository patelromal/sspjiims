package in.co.javatutorials;

import java.io.Serializable;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

/**
 * @author javatutorials.co.in
 */
@ManagedBean(name = "inputBean")
@ViewScoped
public class InputBean implements Serializable {

	private static final long serialVersionUID = 9040359120893077422L;

	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String sayHello() {
		if(name == null || "".equals(name)) {
			return "Greetings: Hello Anonymous !!";
		} else {
			return "Greetings: Hello " + name ;
		}
	}
}